package cc.varga.mvc.views.blipfm.feedloader.loaderURL
{
	import cc.varga.mvc.events.blipfm.BlipFMEvent;
	import cc.varga.utils.logging.Logger;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	import org.robotlegs.mvcs.*;
	
	public class LoaderURLMediator extends Mediator
	{
		[Inject]
		public var view : LoaderURL;
		
		public function LoaderURLMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			Logger.tracing("LoaderURLMediator onRegister", this.toString());
			
			eventMap.mapListener(view, BlipFMEvent.BLIPFM_LOAD_FEED, onLoadURLClick);
			
		}
		
		private function onLoadURLClick(event : BlipFMEvent):void{
			
			Logger.tracing("Load Nick Feed", this.toString());
			
			var service : HTTPService = new HTTPService();
			service.addEventListener(ResultEvent.RESULT, onResult);
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.method = "GET";
			service.url = "http://aludose/web/blip/" + event.nickName + ".json";
			service.send();
			
		}
		
		private function onFault(event:FaultEvent):void{
			Logger.tracing("Blip.fm Fault", this.toString());
		}
		
		private function onResult(event : ResultEvent):void{
			Logger.tracing("Blip.fm Result", this.toString());
		}
		
		public function toString():String{
			return "cc.varga.mvc.views.blipfm.feedloader.views.loaderURL.LoaderURLMediator";
		}
		
	}
}