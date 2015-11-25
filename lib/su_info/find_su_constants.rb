# FindSUConstants createss three files, one in columns, another exactly
# the same, but tab delimited, and the third for use in creating the
# Sketchup_Constants.md file.

# The files list all classes, modules, and constants defined by SketchUp.
#
# File layout is --
# * Root (or un-namespaced) constants defined by the SketchUp environment
# * 'Namespaced' constants defined in SketchUp, starting with SketchUp
# * List of SketchUp modules / classes that have no constants defined
#
# This module requires that the file 'native_ruby_cnsts.txt' exists in the
# directory defined as <code>ENV['TMP'] || ENV['TEMP']</code>.
#
# Lastly, remember to unload all of your extensions / plug-ins before runnning this.
#
module FindSUConstants
  # version number, listed in file headers
  @@version = 1.2

  # cur dir
  @@dir = File.dirname(__FILE__)
  Dir.chdir(@@dir)

  # intermediate text for md file
  @@text         = ''
  
  # text of tab delimited file
  @@text_tab     = ''
  # text of tab delimited file used for creating the Sketchup_Constants.md file
  @@text_tab_md  = ''
  
  # text of file section that listed 'no constants' objects, columnar formatted file
  @@no_const     = ''
  # text of file section that listed 'no constants' objects, tab delimited file
  @@no_const_tab = ''
  
  # counter for root constants
  @@ctr_root  = 0
  # counter for constants in SketchUp classes / modules
  @@ctr_su    = 0
  # counter for SketchUp classes / modules that have no constants
  @@ctr_su_no = 0
  
  # columnar formatted file - width of 1st column
  @@width_1   = 43
  # columnar formatted file - width of 2nd column
  @@width_2   = 35
  # columnar formatted file - string of spaces for blank 2nd column
  @@space_2 = ' '.ljust(@@width_2)
  # columnar formatted file - string for middle column of 'no constants' items
  @@no_constants = 'no constants'.ljust(@@width_2)
  
  # used in file names, which are also shown in the 'finished' messagebox
  @@su_major = Sketchup.version.split('.')[0].rjust(2, '0')
  if ( @@su_major.to_i >= 10 )
    @@su_major_full = "20#{@@su_major}"
  else
    @@su_major_full = @@su_major.to_i.to_s
  end
  
  # Main entry point
  # @return [Void]
  def self._run()
    re_include = /^(Array|Numeric|String|Set|RUBY_)/
    ctr = 0
    h_native = {}
    objects = []
    constants = []

    return unless (@@text_md   = self.file_get_str('Sketchup_Constants_List.md'))
   
    # get hash from file of native Ruby objects
    return unless self.get_ruby_hash(h_native)
    # sort root constants into two arrays, constants and module objects
    Object.constants.sort.each { |c|
      o = Object.const_get(c)
      c_to_s = c.to_s
      next if ( /FindSUConstants/ =~ c_to_s || (h_native.key?(c_to_s) && !(re_include =~ c_to_s)) )
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
    self.write_constants(constants, 0, Object) if ( len_c > 0)
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
    hdr = self.create_header()
    @@text = hdr + @@text
    @@text_tab = hdr + @@text_tab

    @@text_md.gsub!(/SketchUp_Constants_List/, "SketchUp #{@@su_major_full} Constants List")
    
    # write files, show done message box
    self.file_write("SketchUp_#{@@su_major}_Constants_List.md"    , @@text_md)
    self.file_write("su#{@@su_major}_constants_tab.txt", @@text_tab)
    self.file_write("su#{@@su_major}_constants_tab_md.txt", @@text_tab_md)
#    self.msg_box_done()
    load "#{@@dir}/create_su_constants_md.rb"
  end

  # Returns the file header
  # @return [String]
  def self.create_header()
    # create file hdr
    t = Time.now.gmtime
    sDateTime =  t.strftime("%Y-%m-%d at %I:%M:%S %p") + " GMT"
    hdr =  "## Generated on #{sDateTime} using Sketchup version #{Sketchup.version}\n"
    hdr << "## Using FindSUConstants version #{@@version}, see https://github.com/MSP-Greg/SketchUp\n"
    hdr << "## Found the following --\n"
    hdr <<  "##  #{@@ctr_root.to_s.rjust(4)} Constants at object / root\n"
    hdr <<    "##  #{@@ctr_su.to_s.rjust(4)} Constants defined in Sketchup classes\n"
    hdr << "##  #{@@ctr_su_no.to_s.rjust(4)} Sketchup  defined classes / modules with no constants\n##\n\n"
  end

  # Finds all constants in object namespace, reentrant
  # @param obj [Object]
	def self.find_nested_constants(obj)
    constants = []
    objects   = []
    c_len = 0
    ctr = 0
    isCls = obj.kind_of?(Class)
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
    s_class = (obj.class == Class ? 'Class' : 'Module')
    obj_str = obj.to_s
    if (len_c > 0)
			@@text << "<tr><td>#{obj_str}</td><td></td><td>#{s_class}</td></tr>\n"
      @@text_tab << "\n#{obj_str}::\t\t#{s_class}\n"
      self.write_constants(constants, 2, obj)
      @@text << "<tr><td>&#160;</td>&#160;<td></td><td>&#160;</td></tr>\n"
      @@text_tab << "\n"
		else
      @@no_const     << "<tr><td>#{obj_str}</td><td>#{s_class}</td><td>&#160;</td></tr>\n"
      @@no_const_tab << "#{obj_str}\tno constants\t#{s_class}\n"
      @@ctr_su_no += 1
      if (@@ctr_su_no % 5 == 0)
        @@no_const     << "<tr><td>&#160;</td>&#160;<td></td><td>&#160;</td></tr>\n"
        @@no_const_tab << "\n"
      end
    end

    if (objects.length > 0)
      objects.sort! { |a,b| a.to_s <=> b.to_s }
      objects.each { |o| self.find_nested_constants(o) }
    end
	end

  # Creates and returns a Hash from the items in the native_ruby_cnsts.txt file
  # @return [Hash]
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

  # Returns a file as a String, location is `ENV['TMP'] || ENV['TEMP']`
  # @param file [String]
  # @param path [String,nil]
  # @return [String,nil]
  #
  def self.file_get_str(file, path = nil )
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

  # Shows the 'finished' UI.messagebox
  def self.msg_box_done()
    msg = "Wrote files in folder #{ENV['TMP'] || ENV['TEMP']} --\n"
    msg << "   su#{@@su_major}_constants.txt\n"
    msg << "   su#{@@su_major}_constants_tab.txt\n"
        msg << "   su#{@@su_major}_constants_tab_md.txt\n\n"
    msg << "Found --\n"
    msg <<  "   #{@@ctr_root.to_s.rjust(4)} Constants at object / root\n"
    msg <<    "   #{@@ctr_su.to_s.rjust(4)} Constants defined in Sketchup classes\n"
    msg << "   #{@@ctr_su_no.to_s.rjust(4)} Sketchup  defined classes/modules with no constants"
    UI.messagebox(msg)
  end

  # Writes an array of constants to the three output files
  # @param constants [Array<String>]
  # @param indent [Integer] indent width for nested constants
  # @param object [Object] namespace/parent of constants array
  def self.write_constants(constants, indent, object)
    s_indent = '              '.slice(0, indent)
    width_1 = @@width_1 - indent
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
      if (/RUBY_/ =~ c)
        val.sub!(/ Y/, '<br/>Y')
        val.sub!(/\) \[/, ')<br/>[')
      end
      @@text << "<tr><td>#{c}</td><td>#{val}</td><td>#{o.class}</td></tr>\n"
      @@text_tab << "#{c}\t#{val}\t#{o.class}\n"
      @@text_tab_md << "#{fqn}#{c}\t#{val}\t#{o.class}\n"
      ctr += 1
      if (ctr % 5 == 0 && ctr != len_c)
        @@text << "<tr><td>&#160;</td>&#160;<td></td><td>&#160;</td></tr>\n"
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

# load 'D:/rb/lib/su_info/find_su_constants.rb'
FindSUConstants._run()
CreateSUConstantsMD._run()