# Loads and runs code to generate all md docs
#
module SUMD_All
  
  # Loads and runs all SUMD code
  #
  def self.sumd__run
    @rb_dir = File.dirname(__FILE__) + File::SEPARATOR
    load "#{@rb_dir}sumd_list.rb"
    load "#{@rb_dir}sumd_symbols.rb"
    load "#{@rb_dir}sumd_collections.rb"
    load "#{@rb_dir}sumd_guide.rb"
  end
end
SUMD_All.sumd__run
