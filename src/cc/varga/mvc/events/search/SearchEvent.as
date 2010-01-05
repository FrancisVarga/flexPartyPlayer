package cc.varga.mvc.events.search
{
	import flash.events.Event;
	
	public class SearchEvent extends Event
	{
		
		public static const SEARCH_QUERY : String = "search_query_event";
		
		public var search_query : String;
		
		public function SearchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}