root_path = File.expand_path(File.join File.dirname(__FILE__), "..", "..")
require 'open3'
if Object.const_defined? :Bundler
  require 'rake'
  require 'airake'
else
  require File.join(root_path, *%w{vendor gems environment.rb})
  Bundler.require_env
end
src_path = "src"
libs_src_path = File.expand_path(File.join(root_path, *%w{libs ** src}))
libs_src_paths = Rake::FileList.new(libs_src_path).map do |p| 
  p =~ /\A#{root_path}(.*)$/
    $1
end
libs = File.join(%w{libs extLib})
public_path = ENV["JUKEBOX_PUBLIC_PATH"] || "public"

task :test => [ "air:test" ] do; end
namespace :flex do
  #desc "Compile Flex App"
  #task :compile do
  #  ::RakeFileUtils.mkdir_p public_path
  #  cmd = "mxmlc +configname=flex -include-libraries #{libs.join(" ")} -source-path #{[src_path,*libs_src_paths].join " "} -output #{File.join(public_path,*%w{jukebox FlexPlayer.swf})} -debug=true -- #{File.join src_path,"FlexPlayer.mxml"}"
  #  pp cmd
  #  exec cmd
  #end
  #
  desc "Clean"
  task :clean do
    puts "Clean me"
  end

  desc "Compile"
  task :compile => :clean do
    begin
      project = Airake::Projects::Flex.new ENV["RACK_ENV"] || "development", root_path, :swf_path => "public/jukebox/FlexPlayer.swf" ,:mxml_path => %w{src FlexPlayer.mxml}.join("/"), :src_dirs => libs_src_paths.to_a, :lib_dir => libs, :debug => ENV["DEBUG"] ? true : false
      fcsh = PatternPark::FCSH.new_from_rake(ENV)
      fcsh.execute([ project.base_dir, project.fmxmlc.compile ])      
    rescue PatternPark::FCSHConnectError => e
      puts "Cannot connect to FCSHD (start by running: rake fcsh:start); Continuing compilation..."
      Airake::Runner.run(project.fmxmlc, :compile)
    end
  end

  desc "Prepare Environment for building Flex Party Player"
  task :setup => :setup_as3libs_submodules do
  end

  desc "Update or Initialize Submodules of as3libs"
  task :setup_as3libs_submodules => :setup_as3libs do
      cmds = <<CMDS
    git submodule 
    git submodule init
    git submodule update --init
CMDS
    Dir.chdir(::File.join(root_path,*%w{libs})) do
      Open3::popen3 cmds do |stdin,stdout,stderr|
        begin
          while line = stdout.readline
            puts line
          end
        rescue EOFError
        end
      end
    end
  end

  desc "Update or Initialize as3libs Submodule"
  task :setup_as3libs do
      cmds = <<CMDS
    git submodule 
    git submodule init
    git submodule update --init
CMDS
    Dir.chdir(root_path) do
      Open3::popen3 cmds do |stdin,stdout,stderr|
        begin
          while line = stdout.readline
            puts line
          end
        rescue EOFError
        end
      end
    end
  end
end
task :docs => [ "air:docs" ] do; end
desc "Clean Compiled Flex App"
task :clean => [ "air:clean" ] do; end

