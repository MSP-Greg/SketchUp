# Creates three files (?? is two digit SketchUp version):
#
# | Folder / File name                      | Information / Notes                                |
# |:----------------------------------------|:---------------------------------------------------|
# | docs / SketchUp_??\_Constants\_List.md    | Markdown 'List' file                             |
# | su_info_txt / su??\_constants\_tab.txt    | Tab Delimited text                               |
# | su_info_txt / su??\_constants\_tab_md.txt | Tab Delimited text, used to make 'Guide' md file |
#
# The three files list all classes, modules, and constants defined by SketchUp.
#
# File layout:
# * Root (or un-namespaced) constants defined by the SketchUp environment
# * 'Namespaced' constants defined in SketchUp, starting with SketchUp
# * List of SketchUp modules / classes that have no constants defined
#
# Required files:
#
# | File name                   |  Information / Notes                     |
# |:----------------------------|:-----------------------------------------|
# | Template\_List.md           | markdown template                        |
# | native\_ruby_cnsts.txt      | contains 'root' constants native to Ruby |
#
# Code Process:
# 1. Creates array of root constants
# 2. Loop thru array
#   1. Removes constants that exist in h_native
#   2. Splits constants into constants and objects
# 3. Adds constants to file text
# 4. Calls [.find_nested_constants](#find_nested_constants-class_method) and
#      processes namespaced constants
#
# **Lastly, remember to unload all of your extensions / plug-ins before runnning this.**
#
module CreateSUConstants
  # version number, listed in file headers
  @@version = 1.3

  # cur dir
  @@dir = File.dirname(__FILE__)
  Dir.chdir(@@dir)

  # intermediate text for md file
  @@text         = ''
  
  # text of tab delimited file
  @@text_tab     = ''
  # text of tab delimited file used for creating the SketchUp_??_Constants_List.md file
  @@text_tab_md  = ''
  
  # text of file section that listed 'no constants' objects, md file
  @@no_const     = "<tr><td><strong>SketchUp Object</strong></td><td><strong>superclass</strong></td><td><strong>kind_of?</strong></td></tr>\n"
  # text of file section that listed 'no constants' objects, tab delimited file
  @@no_const_tab = ''
  
  # counter for root constants
  @@ctr_root  = 0
  # counter for constants in SketchUp classes / modules
  @@ctr_su    = 0
  # counter for SketchUp classes / modules that have no constants
  @@ctr_su_no = 0
  
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
  # @return [Void]
  def self._run()
    re_include = /^(Array|Numeric|String|Set|RUBY_)/
    ctr = 0
    h_native = {}
    objects = []
    constants = []

    return unless (@@text_md = self.file_get_str('Template_List.md'))
   
    # get hash from file of native Ruby objects
    return unless self.get_ruby_hash(h_native)
    # sort root constants into two arrays, constants and module objects
    Object.constants.sort.each { |c|
      o = Object.const_get(c)
      c_to_s = c.to_s
      next if ( /CreateSUConstants/ =~ c_to_s || (h_native.key?(c_to_s) && !(re_include =~ c_to_s)) )
      if ( o.kind_of?(Module) )
#        objects << c
        objects << o
      else
        constants << c
      end
    }

    # write root constants
    len_c = constants.length
    @@ctr_root += len_c
    self.write_constants(constants, Object) if ( len_c > 0)
    @@text_md.sub!(/<< _gc_ >>/, @@text)
    @@text = ''
    
    # process root modules / classes
    if (objects.length > 0)
      # sort with Sketchup first
      objects.delete(Object)
      objects.delete(Sketchup)
      objects.sort! { |a,b| a.to_s <=> b.to_s }
      objects.insert(0, Sketchup)
      # now find info on modules / classes
      objects.each { |o| self.find_nested_constants(o) }
    end
    
    @@text_md.sub!(/<< _nsc_ >>/, @@text)
    @@text_md.sub!(/<< _noc_ >>/, @@no_const)
    @@text = ''

    # write info on modules / classes with no constants
    @@text_tab << "\n" << @@no_const_tab

    # create header and add to text
    @@text_tab = self.create_header_txt() + @@text_tab
    @@text_md.sub!( /<< hdr >>/, self.create_header_txt(true) )

    # md file title
    @@text_md.gsub!( /List_Title/, "#{@@title_su} Constants List" )
    @@text_md.gsub!( /List_TOC/, "SketchUp #{@@toc_su} Constants List" )
    
    # write files, show done message box
    self.file_write("SketchUp_#{@@su_major}_Constants_List.md"    , @@text_md)
    self.file_write(       "su#{@@su_major}_constants_tab.txt"    , @@text_tab)
    self.file_write(       "su#{@@su_major}_constants_tab_md.txt" , @@text_tab_md)
#    self.msg_box_done()
    load "#{@@dir}/create_su_constants_guide.rb"
  end

  # Returns the file header
  # @param md {Boolean, nil] true for md, nil for text
  # @return [String]
  def self.create_header_txt(md = false)
    if md ;  lend = "\n\n" ; list = "* "  ; nbsp = '&nbsp;&nbsp;'
    else  ;  lend = "\n"   ; list = "   " ; nbsp = 160.chr
    end
    
    root  =  @@ctr_root.to_s.rjust(3).gsub(/ /, nbsp)
    su    =    @@ctr_su.to_s.rjust(3).gsub(/ /, nbsp)
    su_no = @@ctr_su_no.to_s.rjust(3).gsub(/ /, nbsp)
    
    # create file hdr
    sDateTime =  Time.now.gmtime.strftime("%Y-%m-%d at %I:%M:%S %p") + " GMT"
    hdr =  "Generated on #{sDateTime} using Sketchup version #{Sketchup.version}#{lend}"
    hdr << "Using [CreateSUConstants](http://www.rubydoc.info/github/MSP-Greg/SketchUp/master/CreateSUConstants) "
    hdr << "version #{@@version}, see "
    hdr << "[![GitHub](https://img.shields.io/badge/GitHub.com-MSP--Greg%2FSketchUp-blue.svg)](https://github.com/MSP-Greg/SketchUp)"
    hdr << "#{lend}"
    hdr << "Found the following:#{lend}"
    hdr <<  "#{list}#{root} Constants defined in Object (global)\n"
    hdr <<    "#{list}#{su} Constants defined in SketchUp objects\n"
    hdr << "#{list}#{su_no} SketchUp objects with no defined constants\n\n"
  end

  # Finds all constants in object namespace, reentrant.
  # Adds the info to file text strings by calling 
  # [.write_constants](#write_constants-class_method)
  # @param obj [Object]
  # @return [Void]
	def self.find_nested_constants(obj)
    constants = []
    objects   = []
    isCls = obj.kind_of?(Class)
    
    # get constants, divide into object & constants
    obj.constants.each { |c|
      next if (isCls && obj.superclass.const_defined?(c) )
      o = obj.const_get(c)
      if ( o.kind_of?(Module) )
        objects << o
      else
        constants << c
      end
    }
    
    len_c = constants.length
    @@ctr_su += len_c
    # show as Class, then Module, then class
    if defined?(obj.superclass)
      s_class = obj.superclass
    else
      s_class = "not defined"
    end
    c_m_type = if obj.kind_of?(Class)  ; "Class"
            elsif obj.kind_of?(Method) ; "Method"
            elsif obj.kind_of?(Object) ; "Object"
            else                       ; "???"
            end
   
    obj_str = obj.to_s
    if (len_c != 0)
      # add information about object and constants
			@@text << "<tr><td><strong>#{obj_str}::</strong></td><td><strong>#{s_class}</strong></td><td><strong>#{c_m_type}</strong></td></tr>\n"
      @@text_tab << "\n#{obj_str}::\t\t#{s_class}\n"
      self.write_constants(constants, obj)
      @@text << "<tr><td>&#160;</td><td>&#160;</td><td>&#160;</td></tr>\n"
      @@text_tab << "\n"
		else
      # add information about object to no_constants strings
      @@no_const     << "<tr><td>#{obj_str}</td><td>#{s_class}</td><td>#{c_m_type}</td></tr>\n"
      @@no_const_tab << "#{obj_str}\tno constants\t#{s_class}\t#{c_m_type}\n"
      @@ctr_su_no += 1
      if (@@ctr_su_no % 5 == 0)
        @@no_const     << "<tr><td>&#160;</td><td>&#160;</td><td>&#160;</td></tr>\n"
        @@no_const_tab << "\n"
      end
    end

    # run child object constants of obj thru this
    if (objects.length > 0)
      objects.sort! { |a,b| a.to_s <=> b.to_s }
      objects.each { |o| self.find_nested_constants(o) }
    end
	end

  # Creates and returns a Hash from the items in the native_ruby_cnsts.txt file
  # @param hash [Hash] Hash to load with native Ruby constants
  # @return [Boolean] returns true if loaded
  #
  def self.get_ruby_hash(hash)
    ok = false
    ruby_info = nil
    dir = "../../su_info_txt" || ENV['TMP'] || ENV['TEMP']
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
  # @param path [String, nil] defaults to \_\_FILE\_\_ dir, then
  #   'ENV['TMP'] || ENV['TEMP']'
  # @return [String, nil]
  #
  def self.file_get_str(file, path = nil)
  ret = nil
  dir = path || @@dir ||ENV['TMP'] || ENV['TEMP']
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

  # Writes an array of constants to the three output files
  # @param constants [Array<String>]
  # @param object [Object] namespace/parent of constants array
  def self.write_constants(constants, object)
    constants.sort!
    ctr = 0
    len_c = constants.length
    if (object == Object)
      fqn = ''
    else
      fqn = "#{object.to_s}::"
    end
    constants.each { |c|
      o = object.const_get(c)
      c = c.to_s
      val = o.to_s.dup
      if (/(RUBY_COPYRIGHT|RUBY_DESCRIPTION)/ =~ c)
        val.sub!(/ Y/, '<br/>Y')
        val.sub!(/\) \[/, ')<br/>[')
        @@text << "<tr><td>#{c}</td><td colspan='2'>#{val}</td></tr>\n"
      else
        @@text << "<tr><td>#{c}</td><td>#{val}</td><td>#{o.class}</td></tr>\n"
      end
      @@text_tab << "#{c}\t#{val}\t#{o.class}\n"
      @@text_tab_md << "#{fqn}#{c}\t#{val}\t#{o.class}\n"
      ctr += 1
      if (ctr % 5 == 0 && ctr != len_c)
        @@text << "<tr><td>&#160;</td><td>&#160;</td><td>&#160;</td></tr>\n"
        @@text_tab << "\n"
      end
    }
  end

  # Writes output file
  # @param f_name [String] name of output file with extention
  # @param string [String] file contents
  def self.file_write(f_name, string)
    dir = "../../su_info_txt" || ENV['TMP'] || ENV['TEMP']
    dir = "../../docs/" if (f_name.slice(-2,2) == 'md')
    
    if (File.directory?(dir))
      file = File.open("#{dir}#{File::SEPARATOR}#{f_name}", "w")
      if (file)
        file.write(string)
        file.close
      end
    end
  end

end

# load 'D:/rb/lib/su_info/create_su_constants.rb'
CreateSUConstants._run()
CreateSUConstantsGuide._run()