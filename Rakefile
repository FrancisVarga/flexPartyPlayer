require 'rubygems'
ENV["AIRAKE_ROOT"] = File.dirname(__FILE__)
ENV["AIRAKE_ENV"] = "development"
bundler_env = File.join(File.dirname(__FILE__),*%w{vendor gems environment.rb})
if File.exists? bundler_env
  require bundler_env
  Bundler.require_env

  require 'lib/fpp'
  Jukebox.tasks_for_building_to("bin")

  begin
    require 'jeweler'
    Jeweler::Tasks.new do |gemspec|
      gemspec.name = "flexPartyPlayer"
      gemspec.summary = "A Flex Frontend to KitNo"
      gemspec.description = "A Flex Frontend to KitNo"
      gemspec.email = "github@varga-net"
      gemspec.homepage = "http://github.com/FrancisVarga/flexPartyPlayer/"
      gemspec.authors = ["Francis Varga"]
      gemspec.add_dependency('airake')
    end
  rescue LoadError
    puts "Jeweler not available. Install it with: gem install jeweler"
  end
else
  puts "Run `gem bundle` first"
end
