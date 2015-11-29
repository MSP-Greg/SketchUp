# Creates and saves a list of symbols defined by SketchUp.  Requires
# su_info_txt/native_ruby_syms.txt.
#
# Saves to su_info_txt or TEMP || TMP
#
# At present, SketchUp does not define many symbols. I created this code to
# determine that...
#
module CreateSUSymbols
  # version number, listed in file headers
  @@version = 1.2

  # cur dir
  @@dir = File.dirname(__FILE__)
  Dir.chdir(@@dir)
  
  # text of columnar formatted file
  @@text         = ''
  
  # used in file names, which are also shown in the 'finished' messagebox
  @@su_major = Sketchup.version.split('.')[0].rjust(2, '0')

  # Main entry point
  # @return [nil]
  def self._run()
    h_native = {}
    # get hash from file of native Ruby symbols
    return unless self.get_ruby_hash(h_native)

    symbols = []
    Symbol.all_symbols.each { |s|
      sym = s.to_s
      next if h_native.key?(sym)
      symbols << sym
    }
    symbols.sort!
    ctr = 0
    symbols.each { |s|
      @@text << "#{s}\n"
      ctr += 1
      @@text << "\n" if ctr % 5 == 0
    }
    self.write_dev_file("su#{@@su_major}_symbols.txt", @@text)
  end
  
  def self.create_header()
    # create file hdr
    t = Time.now.gmtime
    sDateTime =  t.strftime("%Y-%m-%d at %I:%M:%S %p") + " GMT"
    hdr =  "## Generated on #{sDateTime} using Sketchup version #{Sketchup.version}\n"
    hdr << "## Using FindSUSymbols version #{@@version}, see https://github.com/MSP-Greg/SketchUp\n"
    hdr << "## Found the following --\n"
  end

  # Loads a hash passed as a parameter with items in the native_ruby_syms.txt file
  # @param  [Hash] hash
  # @return [Boolean] true if hash loaded
  #
  def self.get_ruby_hash(hash)
    ok = false
    dir = "../../su_info_txt" || ENV['TMP'] || ENV['TEMP']
    if File.directory?(dir)
      f_name = "#{dir}#{File::SEPARATOR}native_ruby_syms.txt"
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

  # Shows the 'finished' UI.messagebox
  def self.msg_box_done()
    msg = "Wrote files in folder #{ENV['TMP'] || ENV['TEMP']} --\n"
    msg << "Found --\n"
#    msg <<  "   #{@@ctr_root.to_s.rjust(4)} Constants at object / root\n"
#    msg <<    "   #{@@ctr_su.to_s.rjust(4)} Constants defined in Sketchup classes\n"
#    msg << "   #{@@ctr_su_no.to_s.rjust(4)} Sketchup  defined classes/modules with no constants"
#    UI.messagebox(msg)
  end

  # Writes output file
  # @param name [String] name of output file with extention
  # @param string [String] file contents
  def self.write_dev_file(name, string)
    dir = "../../su_info_txt" || ENV['TMP'] || ENV['TEMP']
    if (File.directory?(dir))
      file = File.open("#{dir}#{File::SEPARATOR}#{name}", "w")
      if (file)
        file.write(string)
        file.close
      end
    else
      UI.messagebox("Directory #{dir} does not exist!")
    end
  end

end
#run
# load 'D:/rb/lib/su_info/create_su_symbols.rb'
CreateSUSymbols._run()
