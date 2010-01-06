package cc.varga.mvc.views.blipfm.feedloader
{
	import cc.varga.mvc.events.blipfm.feedloader.FeedLoaderEvent;
	import cc.varga.mvc.views.playlistItem.PlaylistItem;
	import cc.varga.utils.logging.Logger;
	
	import com.adobe.serialization.json.*;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	import org.robotlegs.mvcs.*;
	
	public class FeedLoaderMediator extends Mediator
	{
		
		[Inject]
		public var view : FeedLoader;
		
		public function FeedLoaderMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			
			Logger.tracing("FeedLoaderMediator onRegister", this.toString());
			
			eventMap.mapListener(view, FeedLoaderEvent.LOAD_FEED, onFeedLoad);
			
		}
		
		private function onFeedLoad(event : FeedLoaderEvent):void{
			
			Logger.tracing("onFeed Load", this.toString());
			
			var httpService : HTTPService = new HTTPService();
			httpService.method = "POST";
			httpService.addEventListener(FaultEvent.FAULT, onFault);
			httpService.addEventListener(ResultEvent.RESULT, onResult);
			httpService.url = "http://aludose/web/blip/" + event.blipNick + ".json";
			httpService.send();
			
		}
		
		private function onFault(event : FaultEvent):void{
			Logger.tracing("Fault " + event.message, "");		
		}
		
		private function onResult(event : ResultEvent):void{
			Logger.tracing("Result " + event, "");
			
			var jsonObj : Array = JSON.decode(event.result as String) as Array;
			
			if(jsonObj.length > 0){
				for(var i:uint=0; i < jsonObj.length; i++){
					var item : PlaylistItem = new PlaylistItem();
					item.jsonObj = jsonObj[i];
					view.listContainer.addElement(item);
				}
			}
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.views.blipfm.feedloader.FeedLoaderContext";
		}
		
	}
}