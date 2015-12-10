# ## Purpose:
#
# Creates an md file of the collections defined in SketchUp classes
#
# ## Code Process:
#
# 1. Creates array of root object
# 2. Loop thru array and creates objects array, removing objects that exist in
#    native Ruby (h_native)
# 3. Adds collections to file text
# 4. Calls [.find_nested](#find_nested-class_method) and
#    processes namespaced collections
#
# **Lastly, remember to unload all of your extensions / plug-ins before runnning this.**
#
module CreateSUCollections
  VERSION = 1.4

  EMPTY_ROW = "<tr class='clr'>#{'<td>&#160;</td>' * 7}</tr>\n" \
              "<tr>#{'<td></td>' * 7}</tr>\n"

  SU_DOCS = "http://www.sketchup.com/intl/en/developer/docs/ourdoc/"
              
  RB_DIR = File.dirname(__FILE__)
  
  # table text for md file
  @@text = "<thead><tr>"                   \
           "<th>Object</th>"               \
           "<th class='c'>Enum</th>"       \
           "<th class='c'>#each</th>"      \
           "<th class='c'>#[]</th>"        \
           "<th class='c'>#[]=</th>"       \
           "<th class='c'>#each_pair</th>" \
           "<th>Super</th>"                \
           "</tr></thead><tbody>\n"
  @@ctr  = 0
  
  # used in file names, which are also shown in the 'finished' messagebox
  @@su_major = Sketchup.version.split('.')[0].rjust(2, '0')
  if ( @@su_major.to_i >= 10 )
    @@toc_su = "20#{@@su_major}"
    @@title_su = @@toc_su
  else
    @@toc_su = @@su_major.to_i.to_s
    @@title_su = @@toc_su.to_s.rjust(5, '_')
  end
  
  # Main entry point
  # @return [nil]
  def self._run()
    h_native = {}
    objects = []

    # get template
    return unless (@@text_md = self.file_get_str('Template_Collections.md'))   

    # get hash from file of native Ruby objects
    return unless self.get_ruby_hash(h_native)

    # find objects and process
    Object.constants.sort.each { |c|
      o = Object.const_get(c)
      c_to_s = c.to_s
      next if ( /^CreateSU/ =~ c_to_s || h_native.key?(c_to_s) )
      objects << o if ( o.kind_of?(Module) )
    }
    
    # process root modules / classes
    if (objects.length > 0)
      # sort with Sketchup first
      objects.delete(Object)
      objects.delete(Sketchup)
      objects.sort! { |a,b| a.to_s <=> b.to_s }
      objects.insert(0, Sketchup)
      # now find info on modules / classes
      objects.each { |o| self.find_nested(o) }
    end
    self.done()
  end

  # Finds all collections in object namespace, reentrant.
  # Adds the info to file text string @@text
  # @param obj [Object]
  # @return [nil]
	def self.find_nested(obj)
    objects   = []
    isCls = obj.kind_of?(Class)
    isMod = false
    # get constants, divide into object & constants
    obj.constants.each { |c|
      next if (isCls && obj.superclass.const_defined?(c) )
      o = obj.const_get(c)
      # note: assignment
      objects << o if ( isMod = o.kind_of?(Module) )
    }

    if obj.public_method_defined?(:each)

      super_cls = isCls ? obj.superclass : "not defined"
      # show as Class, then Module, then Object, then ???
      c_m_type = if isCls                ; "Class"
              elsif isMod                ; "Module"
              elsif obj.kind_of?(Object) ; "Object"
              else                       ; "???"
              end

      obj_str = obj.to_s
      if (/(::)*([^:]+)$/ === obj_str)
        obj_str = "<a href='#{SU_DOCS}#{$2.downcase}'>#{obj_str}</a>" if $2
      end
    
#      meth = :slice
#      t = obj.public_method_defined?(meth) ? "Yes " : "No  "
#      puts "#{t} #{meth}  #{obj_str}"

      _enum        = obj.include?(Enumerable)
      _each        = obj.public_method_defined?(:each)
      _brackets    = obj.public_method_defined?(:[])
      _brackets_eq = obj.public_method_defined?(:[]=)
      _each_pair   = obj.public_method_defined?(:each_pair)

      # cascades
      _each_pair   = (_each_pair   && _brackets_eq) ? 'Y' : ( _each_pair   ? 'Yes' : ' ')
      _brackets_eq = (_brackets_eq && _brackets   ) ? 'Y' : ( _brackets_eq ? 'Yes' : ' ')
      _brackets    = (_brackets    && _each       ) ? 'Y' : ( _brackets    ? 'Yes' : ' ')
      _each        = (_each        && _enum       ) ? 'Y' : ( _each        ? 'Yes' : ' ')
      _enum        = (_enum ? 'Yes' : ' ')
      
      @@text << "<tr><td>#{obj_str}</td>" \
                    "<td class='c'>#{_enum}</td>" \
                    "<td class='c'>#{_each}</td>" \
                    "<td class='c'>#{_brackets}</td>" \
                    "<td class='c'>#{_brackets_eq}</td>" \
                    "<td class='c'>#{_each_pair}</td>" \
                    "<td>#{super_cls}</td></tr>\n"
      @@ctr += 1
      @@text << EMPTY_ROW if (@@ctr % 5 == 0)
      nil
    end

    # run child object constants of obj thru this
    if (objects.length > 0)
      objects.sort! { |a,b| a.to_s <=> b.to_s }
      objects.each { |o| self.find_nested(o) }
    end
	end

  # Inserts data into md template, writes file
  def self.done()
    @@text << '</tbody>'
    sDateTime =  Time.now.gmtime.strftime("%Y-%m-%d at %I:%M:%S %p GMT")
    hdr =  "Generated with [CreateSUCollections] v#{VERSION}, on" \
           " #{sDateTime}, using SketchUp v#{Sketchup.version} & Ruby #{RUBY_VERSION}.\n"

    # add content to md string
    @@text_md.sub!( /Template_Collections/, "#{@@title_su} Collections Info" )
    @@text_md.sub!( /Collections_TOC/, "SketchUp #{@@toc_su} Collections Info" )
    @@text_md.sub!( /<< collection >>/, @@text )
    @@text_md.sub!(/<< hdr >>/, hdr)
    
    # write file, show done message box
    self.file_write("SketchUp_#{@@su_major}_Collections.md", @@text_md)
    UI.messagebox("Done with Collections Info")
  end
  
  # Creates and returns a Hash from the items in the native_ruby_cnsts.txt file
  # @param hash [Hash] Hash to load with native Ruby constants
  # @return [Boolean] returns true if loaded
  #
  def self.get_ruby_hash(hash)
    ok = false
    ruby_info = nil
    dir = File.expand_path('../../su_info_txt', RB_DIR) || ENV['TMP'] || ENV['TEMP']
    if File.directory?(dir)
      f_name = "#{dir}#{File::SEPARATOR}native_ruby_cnsts.txt"
      if File.exists?(f_name)
        a_ruby = File.read(f_name).split(/[\r\n\f]+/)
        a_ruby.each { |k| hash[k] = nil }
        ok = true
      else
        UI.messagebox("File #{f_name} does not exist\n\nExiting!")
      end
    else
      UI.messagebox("Directory #{dir} does not exist\n\nExiting!")
    end
    ok
  end

  # Returns a file as a String
  # @param file [String]
  # @param path [String, nil]
  # @return [String, nil]
  #
  def self.file_get_str(file, path = nil)
    ret = nil
    dir = ( path ? File.expand_path(path, RB_DIR) : RB_DIR) ||
        ENV['TMP'] || ENV['TEMP']
    if File.directory?(dir)
      f_name = "#{dir}#{File::SEPARATOR}#{file}"
      if File.exists?(f_name)
        ret = File.read(f_name)
      else
        UI.messagebox("File #{f_name} does not exist\n\nExiting!")
      end
    else
      UI.messagebox("Directory #{f_name} does not exist\n\nExiting!")
    end
    ret
  end

  # Writes output file
  # @param f_name [String] name of output file with extention
  # @param string [String] file contents
  # @return [nil]
  def self.file_write(f_name, string)
    if (f_name.slice(-2,2) == 'md')
      dir = File.expand_path('../../docs/', RB_DIR) ||
          ENV['TMP'] || ENV['TEMP']
    else
      dir = File.expand_path(path, RB_DIR) || ENV['TMP'] || ENV['TEMP']
    end
    if (File.directory?(dir))
      file = File.open("#{dir}#{File::SEPARATOR}#{f_name}", "w")
      if (file)
        file.write(string)
        file.close
      end
    end
  end

end

CreateSUCollections._run()
