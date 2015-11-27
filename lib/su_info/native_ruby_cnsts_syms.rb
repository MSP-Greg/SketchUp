# load 'D:/rb/su_info/native_ruby_cnsts_syms.rb'
#
# MUST BE RUN IN A RUBY ENVIRONMENT, NOT FROM INSIDE OF SKETCHUP !!!
#
# Saves one constants file and one symbols file to temp folder.
# Version specific...
#

# Generate constants file
t = Object.constants.sort
s = ""
t.each { |c|
  s << "#{c}\n"
}
temp = ENV['TMP'] || ENV['TEMP']
if (File.directory?(temp))
  file = File.open("#{temp}#{File::SEPARATOR}native_ruby_cnsts.txt", "w")
  if (file)
    file.write(s)
    file.close
  end
end

# Generate symbols file
t = Symbol.all_symbols.sort
s = ""
t.each { |c|
  s << "#{c}\n"
}
temp = ENV['TMP'] || ENV['TEMP']
if (File.directory?(temp))
  file = File.open("#{temp}#{File::SEPARATOR}native_ruby_syms.txt", "w")
  if (file)
    file.write(s)
    file.close
  end
end
puts "Done"
