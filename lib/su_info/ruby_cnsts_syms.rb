# load 'D:/rb/lib/su_info/ruby_cnsts_syms.rb'
#
# MUST BE RUN IN A RUBY ENVIRONMENT, NOT FROM INSIDE OF SKETCHUP !!!
#
# Saves one constants file and one symbols file to temp folder.
# Version specific...
#

# Generate constants file
if false
  gjl_t = Object.constants.sort
  gjl_s = ""
  gjl_t.each { |gjl_c|
    gjl_s << "#{gjl_c}\n"
  }
  gjl_temp = ENV['TMP'] || ENV['TEMP']
  if (File.directory?(gjl_temp))
    gjl_file = File.open("#{gjl_temp}#{File::SEPARATOR}native_ruby_cnsts.txt", "w")
    if (gjl_file)
      gjl_file.write(gjl_s)
      gjl_file.close
    end
  end
end

#Symbol.all_symbols.sort.each { |x| puts x } ; "---"

# Generate symbols file

if true
  gjl_t = Symbol.all_symbols.sort
  gjl_s = ""
  gjl_t.each { |gjl_c|
    gjl_s << "#{gjl_c}\n" unless (/^gjl_/ === gjl_c)
  }
  gjl_temp = ENV['TMP'] || ENV['TEMP']
  if (File.directory?(gjl_temp))
    gjl_file = File.open("#{gjl_temp}#{File::SEPARATOR}native_ruby_syms.txt", "w")
    if (gjl_file)
      gjl_file.write(gjl_s)
      gjl_file.close
    end
  end
end
puts "Done"
