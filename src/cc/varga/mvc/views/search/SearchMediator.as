package cc.varga.mvc.views.search
{
	import cc.varga.mvc.events.search.SearchEvent;
	
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
			
			eventMap.mapListener(view, SearchEvent.SEARCH_QUERY, onSearch); 
			
		}
		
		private function onSearch(event : SearchEvent):void{
			
			
			
		}
		
	}
}