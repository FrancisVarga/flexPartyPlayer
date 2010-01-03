module FlexPartyPlayer
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(File.join(__FILE__,"..")))

    set :views,  "#{dir}/views"
    set :public, "#{dir}/public"
    set :static, true
    helpers Sinatra::UrlForHelper
    register Sinatra::StaticAssets

    get "/?" do
      version = "10.0.0"
      bgcolor = "#ffffff"
      swf = url_for("/jukebox/FlexPlayer")
      application = "FlexPlayer"
      width = "100%"
      height = "100%"
      javascript = <<CODE
  var swfVersionStr = "#{version}";
  var xiSwfUrlStr = "";
  var flashvars = {};
  var params = {};
  params.quality = "high";
  params.bgcolor = "#{bgcolor}";
  params.allowscriptaccess = "sameDomain";
  params.allowfullscreen = "true";
  var attributes = {};
  attributes.id = "#{application}";
  attributes.name = "#{application}";
  attributes.align = "middle";
  swfobject.embedSWF(  
    "#{swf}.swf", "flashContent",
    "#{width}", "#{height}",
    swfVersionStr, xiSwfUrlStr,
    flashvars, params, attributes);
CODE
      haml :jukebox, {}, :version => version, :bgcolor => bgcolor, :swf => swf, :width => width, :height => height, :application => application, :code => javascript
    end
  end
end
