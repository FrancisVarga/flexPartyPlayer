package cc.varga.mvc.views.search
{
	import cc.varga.mvc.events.search.SearchEvent;
	import cc.varga.utils.logging.Logger;
	
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
			dispatch(event);
			
		}
		
		public function toString():String{ return "cc.varga.mvc.views.search.SearchMediator"; }
		
		
	}
}