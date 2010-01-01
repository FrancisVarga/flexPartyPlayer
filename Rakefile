require 'rubygems'
require 'airake'

ENV["AIRAKE_ROOT"] = File.dirname(__FILE__)
ENV["AIRAKE_ENV"] = "development"

# Aliases
task :test => [ "air:test" ] do; end
namespace :flex do
  task :compile do
    `mxmlc +configname=flex -include-libraries /Users/lenni/Source/flexPartyPlayer/libs/extLib/oggvorbis.swc -source-path /Users/lenni/Source/flexPartyPlayer/src /Users/lenni/Source/flexPartyPlayer/libs/extLib/httpclient/src/ /Users/lenni/Source/flexPartyPlayer/libs/extLib/robo/src/ /Users/lenni/Source/flexPartyPlayer/libs/extLib/swift/src/ /Users/lenni/Source/flexPartyPlayer/libs/extLib/core/src/ -output /Users/lenni/Source/flexPartyPlayer/bin/FlexPlayer.swf -debug=true -- /Users/lenni/Source/flexPartyPlayer/src/FlexPlayer.mxml`
  end
end
task :package => [ "air:package" ] do; end
task :certificate => [ "air:certificate" ] do; end
task :adl => [ "air:adl" ] do; end
task :docs => [ "air:docs" ] do; end
task :clean => [ "air:clean" ] do; end
task :acompc => [ "air:acompc" ] do; end
