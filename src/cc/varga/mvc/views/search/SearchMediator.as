package cc.varga.mvc.views.search
{
	import cc.varga.mvc.events.search.SearchEvent;
	import cc.varga.utils.logging.Logger;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	import org.robotlegs.mvcs.Mediator;
	
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
			
			Logger.tracing("Result: " + event.result.toString(), this.toString());
			
		}
		
		private function onFault(event : FaultEvent):void{
			
			Logger.tracing("onFault: " + event.message, this.toString());
			
		}
		
		public function toString():String{ return "cc.varga.mvc.views.search.SearchMediator"; }
		
		
	}
}