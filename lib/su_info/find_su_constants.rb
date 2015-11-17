# FindSUConstants createss two files, one in columns, the other tab delimited.
# The files list all classes, modules, and constants defined by SketchUp.
#
# File layout is --
# * Root (or un-namespaced) constants defined by the SketchUp environment
# * Constants defined in SketchUp, starting with the SketchUp namespace
# * List of SketchUp defined modules / classes that have no constants defined
#
# This module requires that the file 'native_ruby_cnsts.txt' exists in the directory 
# defined as <code>ENV['TMP'] || ENV['TEMP']</code>.
#
# Lastly, remember to unload all of your extensions / plug-ins before runnning this.
#
module FindSUConstants
  # version number, listed in file headers
  @@version = 1.1
  
  # text of columnar formatted file
  @@text         = ''
  # text of tab delimited file
  @@text_tab     = ''
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

  # Main entry point
  # @return [Void]
  def self._run()
    re_include = /^(Array|Numeric|String|Set|RUBY_)/
    ctr = 0
    h_native = {}
    objects = []
    constants = []

    # get hash from file of native Ruby objects
    h_native = self.get_ruby_hash()

    # sort root constants into two arrays, constants and module objects
    Object.constants.sort.each { |c|
      c_to_s = c.to_s
      next if ( /FindSUConstants/ =~ c_to_s || (h_native.key?(c_to_s) && !(re_include =~ c_to_s)) )
      if ( eval(c_to_s).kind_of?(Module) )
        objects << c_to_s
      else
        constants << c_to_s
      end
    }

    # write root constants
    len_c = constants.length
    @@ctr_root += len_c
    self.write_constants(constants, 0) if ( len_c > 0)

    # process root modules / classes
    if (objects.length > 0)
      # sort with Sketchup first
      idx = objects.index('Sketchup')
      objects[idx] = '      Sketchup'
      objects.sort!
      objects[0] = 'Sketchup'
      # now find info on modules / classes
      objects.each { |o| self.find_nested_constants(o) }
    end

    # write info on modules / classes with no constants
    @@text     << "\n" << @@no_const
    @@text_tab << "\n" << @@no_const_tab

    # create header and add to text
    hdr = self.create_header()
    @@text = hdr + @@text
    @@text_tab = hdr + @@text_tab

    # write files, show done message box
    self.write_dev_file("su#{@@su_major}_constants.txt"    , @@text)
    self.write_dev_file("su#{@@su_major}_constants_tab.txt", @@text_tab)
    self.msg_box_done()
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
  # @param obj_name [String]
	def self.find_nested_constants(obj_name)
		constants = []
    objects   = []
    c_len = 0
    ctr = 0
    eval("#{obj_name}.constants").each { |c|
      o = eval("#{obj_name}::#{c}")
      if ( o.kind_of?(Module) )
        objects << c.to_s
      else
        constants << c.to_s
      end
    }

    len_c = constants.length
    @@ctr_su += len_c
#		s_class = eval(obj_name).kind_of?(Class) ? 'Class' : 'Module'
    s_class = obj_name.kind_of?(Class) ? 'Class' : 'Module'

    if (len_c > 0)
      t = "#{obj_name}::".ljust(@@width_1) + @@space_2 + s_class
			@@text <<     "\n#{t}\n"
      @@text_tab << "\n#{obj_name}::\t\t#{s_class}\n"
      self.write_constants(constants, 2, obj_name)
      @@text << "\n"
      @@text_tab << "\n"
		else
      s_class = eval(obj_name).class == Class ? 'Class' : 'Module'
      @@no_const     << "#{obj_name.ljust(@@width_1)}#{@@no_constants}#{s_class}\n"
      @@no_const_tab << "#{obj_name}\tno constants\t#{s_class}\n"
      @@ctr_su_no += 1
      if (@@ctr_su_no % 5 == 0)
        @@no_const     << "\n"
        @@no_const_tab << "\n"
      end
    end

    if (objects.length > 0)
      objects.sort!
      objects.each { |o| self.find_nested_constants("#{obj_name}::#{o.to_s}") }
    end
	end

  # Creates and returns a Hash from the items in the native_ruby_cnsts.txt file
  # @return [Hash]
  def self.get_ruby_hash()
    ruby_info = nil
    temp_dir = ENV['TMP'] || ENV['TEMP']
    if (File.directory?(temp_dir))
      f_name = "#{temp_dir}#{File::SEPARATOR}native_ruby_cnsts.txt"
      if File.exists?(f_name)
        a_ruby = File.read(f_name).split(/[\r\n\f]+/)
      else
        UI.messagebox("File #{f_name} does not exist\n\nExiting!")
        exit
      end
    else
      UI.messagebox("Directory #{f_name} does not exist\n\nExiting!")
      exit
    end
    Hash[ *((a_ruby.collect { |v| [v, nil] }).flatten) ]
  end

  # Shows the 'finished' UI.messagebox
  def self.msg_box_done()
    msg = "Wrote files in folder #{ENV['TMP'] || ENV['TEMP']} --\n"
    msg << "   su#{@@su_major}_constants.txt\n"
    msg << "   su#{@@su_major}_constants_tab.txt\n\n"
    msg << "Found --\n"
    msg <<  "   #{@@ctr_root.to_s.rjust(4)} Constants at object / root\n"
    msg <<    "   #{@@ctr_su.to_s.rjust(4)} Constants defined in Sketchup classes\n"
    msg << "   #{@@ctr_su_no.to_s.rjust(4)} Sketchup  defined classes/modules with no constants"
    UI.messagebox(msg)
  end

  # Writes an array of constants to the two output files
  # @param constants [Array<String>]
  # @param indent [Integer] indent width for nested constants
  # @param ns [String] namespace of constants array
  def self.write_constants(constants, indent, ns = nil)
    s_indent = '              '.slice(0, indent)
    width_1 = @@width_1 - indent
    constants.sort!
    ctr = 0
    len_c = constants.length
    constants.each { |c|
      o = ns ? eval("#{ns}::#{c}") : eval("#{c}")
      @@text << "#{s_indent}#{c.ljust(width_1)}#{o.to_s.ljust(@@width_2)}#{o.class}\n"
      @@text_tab << "#{c}\t#{o}\t#{o.class}\n"
#      @@text << "#{s_indent}#{c.to_s.ljust(width_1)}#{o.to_s.ljust(@@width_2)}#{o.class}\n"
#      @@text_tab << "#{c.to_s}\t#{o}\t#{o.class}\n"
      ctr += 1
      if (ctr % 5 == 0 && ctr != len_c)
        @@text << "\n"
        @@text_tab << "\n"
      end
    }
  end

  # Writes output file
  # @param name [String] name of output file with extention
  # @param string [String] file contents
  def self.write_dev_file(name, string)
    temp = ENV['TMP'] || ENV['TEMP']
    if (File.directory?(temp))
      file = File.open("#{temp}#{File::SEPARATOR}#{name}", "w")
      if (file)
        file.write(string)
        file.close
      end
    end
  end

end
#run
# load 'D:/rb/su_info/find_su_constants.rb'
FindSUConstants._run()
