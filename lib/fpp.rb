root_path = File.join File.dirname(__FILE__), ".."
src_path = File.join root_path, "src"
libs_src_paths = Rake::FileList.new "libs/**/src"
libs = Rake::FileList.new "libs/extLib/*.swc"
public_path = ENV["JUKEBOX_PUBLIC_PATH"] || Object.const_defined?(:SINATRA_ROOT) ? sinatra("public","jukebox") : "public/jukebox"

task :test => [ "air:test" ] do; end
namespace :flex do
  desc "Compile Flex App"
  task :compile do
    ::RakeFileUtils.mkdir_p public_path
    `mxmlc +configname=flex -include-libraries #{libs.join(" ")} -source-path #{[src_path,*libs_src_paths].join " "} -output #{File.join(public_path,*%w{jukebox FlexPlayer.swf})} -debug=true -- #{File.join src_path,"FlexPlayer.mxml"}`
  end
end
task :package => [ "air:package" ] do; end
task :certificate => [ "air:certificate" ] do; end
task :adl => [ "air:adl" ] do; end
task :docs => [ "air:docs" ] do; end
desc "Clean Compiled Flex App"
task :clean => [ "air:clean" ] do; end
task :acompc => [ "air:acompc" ] do; end

