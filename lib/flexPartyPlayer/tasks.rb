root_path = File.expand_path(File.join File.dirname(__FILE__), "..", "..")
require 'open3'
if Object.const_defined? :Bundler
  require 'rake'
  require 'airake'
else
  require File.join(root_path, *%w{vendor gems environment.rb})
  Bundler.require_env
end

task :test => [ "air:test" ] do; end
namespace :flex do
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
      puts "AS3 Sublibs refresh in #{`pwd`}"
      stdin,stdout,stderr = Open3::popen3 cmds
      threads = []
      $stdout.sync = true
      threads << Thread.new(stdout) do |stdout|
        begin
          while line = stdout.readline
            puts line
          end
        rescue EOFError
        end
      end

      threads << Thread.new(stderr) do |stderr|
        begin
          while line = stderr.readline
            puts line
          end
        rescue EOFError
        end
      end
      threads.each {|t| t.join }
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

