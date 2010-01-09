ENV["AIRAKE_ROOT"] = File.dirname(__FILE__)
ENV["AIRAKE_ENV"] = "development"
require File.join(ENV["AIRAKE_ROOT"],"config","boot")

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "grammophon"
    gemspec.summary = "A Flex Frontend to KitNo"
    gemspec.description = "A Flex Frontend to KitNo"
    gemspec.email = "github@varga-net"
    gemspec.homepage = "http://github.com/lennart/grammophon/"
    gemspec.authors = ["Francis Varga", "Lennart Melzer"]
    gemspec.add_dependency("sprout")
    gemspec.add_dependency('rake')

    files = FileList[%w{src/**/* test/* views/* lib/* script/* Gemfile}]
    gemspec.files = files.to_a
  end
  Rake.application.jeweler.gemspec.executables = []
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

# Optionally load gems from a server other than rubyforge:
# set_sources 'http://gems.projectsprouts.org'
sprout 'flex4'

project_model :model do |m|
  m.project_name            = 'FlexPlayer'
  m.language                = 'mxml'
  m.background_color        = '#FFFFFF'
  m.width                   = 970
  m.height                  = 550
  m.compiler_gem_name     = 'sprout-flex4sdk-tool'
  m.compiler_gem_version  = '>= 4.0.0'
  # m.src_dir               = 'src'
  m.lib_dir               = 'lib'
  m.swc_dir               = 'lib'
  m.bin_dir               = 'public/jukebox'
  # m.test_dir              = 'test'
  # m.doc_dir               = 'doc'
  # m.asset_dir             = 'assets'
  
  m.library_path.concat         FileList["#{m.lib_dir.to_s}/*.swc"].to_a
  m.libraries.concat [:robotlegs, :swiftsuspenders, :corelib, :"jukeboxapi-src"]
end


desc 'Compile and debug the application'
debug :debug do |m|
  m.debug = true
end

deploy :grammophon do |m|
  m.debug = true
end

desc 'Compile run the test harness'
unit :test

desc 'Compile the optimized deployment'
deploy :deploy

desc 'Create documentation'
document :doc

desc 'Compile a SWC file'
swc :swc

# set up the default rake task
task :default => :grammophon
