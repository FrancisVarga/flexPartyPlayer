root_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
bundler_env = File.join(root_path,%w{vendor gems environment.rb})
if File.exists? bundler_env
  require bundler_env
  Bundler.require_env
  $LOAD_PATH << File.join(root_path,"lib")
else
  puts "Run `gem bundle` first"
  exit
end
