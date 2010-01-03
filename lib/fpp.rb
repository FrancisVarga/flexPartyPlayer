# Aliases
require 'rake/tasklib'
class Jukebox
  class Tasks < ::Rake::TaskLib
    attr_accessor :root_path, :src_path, :libs_src_paths, :libs
    def initialize public_path
      @root_path = File.join File.dirname(__FILE__), ".."
      @src_path = File.join root_path, "src"
      @libs_src_paths = Rake::FileList.new "libs/**/src"
      @libs = Rake::FileList.new "libs/extLib/*.swc"
      @public_path = public_path
    end

    def define
      task :test => [ "air:test" ] do; end
      namespace :flex do
        task :compile do
          `mxmlc +configname=flex -include-libraries #{libs.join(" ")} -source-path #{[src_path,*libs_src_paths].join " "} -output #{File.join(public_path,*%w{jukebox FlexPlayer.swf})} -debug=true -- #{File.join src_path,"FlexPlayer.mxml"}`
        end
      end
      task :package => [ "air:package" ] do; end
      task :certificate => [ "air:certificate" ] do; end
      task :adl => [ "air:adl" ] do; end
      task :docs => [ "air:docs" ] do; end
      task :clean => [ "air:clean" ] do; end
      task :acompc => [ "air:acompc" ] do; end
    end
  end
end
