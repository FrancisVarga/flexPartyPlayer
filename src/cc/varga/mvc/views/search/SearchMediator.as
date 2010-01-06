package cc.varga.mvc.views.search
{
	import cc.varga.mvc.events.search.SearchEvent;
	import cc.varga.utils.logging.Logger;
	
	import com.adobe.serialization.json.*;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.views.playlistItem.PlaylistItem;
	
	public class SearchMediator extends Mediator
	{
		
		[Inject]
		public var view : Search;
		
		public function SearchMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			Logger.tracing("onRegister", this.toString());
			
			eventMap.mapListener(view, SearchEvent.SEARCH_QUERY, onSearch); 
			
		}
		
		private function onSearch(event : SearchEvent):void{
			
			Logger.tracing("Search Request: " + event.search_query, this.toString());
			var httpServ : HTTPService = new HTTPService();
			httpServ.addEventListener(FaultEvent.FAULT, onFault);
			httpServ.addEventListener(ResultEvent.RESULT, onResult);
			httpServ.url = "http://aludose/web/search.json";
			httpServ.method = "POST";
			httpServ.send({query:event.search_query});
		
		}
		
		private function onResult(event : ResultEvent):void{
			
			var result : Object = JSON.decode(event.result as String);
			
			drawSearchResult(result as Array);
			
		}
		
		private function drawSearchResult(list:Array):void{
			
			view.listContainer.removeAllElements();
			
			for(var i:uint=0; i < list.length; i++){
				
				var item : PlaylistItem = new PlaylistItem();
				item.jsonObj = list[i];
				
				view.listContainer.addElement(item);
				
			}
			
		}
		
		private function onFault(event : FaultEvent):void{
			
			Logger.tracing("onFault: " + event.message, this.toString());
			
		}
		
		public function toString():String{ return "cc.varga.mvc.views.search.SearchMediator"; }
		
		
	}
}