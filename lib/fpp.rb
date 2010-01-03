root_path = File.join File.dirname(__FILE__), ".."
if Object.const_defined? :Bundler
  require 'rake'
  require 'airake'
else
  require File.join(root_path, *%w{vendor gems environment.rb})
  Bundler.require_env
end
src_path = File.join root_path, "src"
libs_src_path = File.expand_path(File.join(root_path,*%w{libs ** src}))
libs_src_paths = Rake::FileList.new libs_src_path
libs = Rake::FileList.new File.join(root_path, "libs/extLib/*.swc")
public_path = ENV["JUKEBOX_PUBLIC_PATH"] || Object.const_defined?(:SINATRA_ROOT) ? sinatra("public") : "public"

task :test => [ "air:test" ] do; end
namespace :flex do
  desc "Compile Flex App"
  task :compile do
    ::RakeFileUtils.mkdir_p public_path
    cmd = "mxmlc +configname=flex -include-libraries #{libs.join(" ")} -source-path #{[src_path,*libs_src_paths].join " "} -output #{File.join(public_path,*%w{jukebox FlexPlayer.swf})} -debug=true -- #{File.join src_path,"FlexPlayer.mxml"}"
    pp cmd
    exec cmd
  end

  desc "Prepare Environment for building Flex Party Player"
  task :setup do
      cmds = <<CMDS
    git submodule 
    git submodule init
    git submodule update --init
CMDS
    Dir.chdir(root_path) do
      puts `#{cmds}`
    end
    Dir.chdir(::File.join(root_path,*%w{libs})) do
      puts `#{cmds}`
    end
  end
end
task :package => [ "air:package" ] do; end
task :certificate => [ "air:certificate" ] do; end
task :adl => [ "air:adl" ] do; end
task :docs => [ "air:docs" ] do; end
desc "Clean Compiled Flex App"
task :clean => [ "air:clean" ] do; end
task :acompc => [ "air:acompc" ] do; end

