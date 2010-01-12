package cc.varga.mvc.views.result
{
	import flash.events.Event;
	
	public class ResultItemEvent extends Event
	{
		
		public static const PLAY_ITEM : String = "play_item";
		public static const ADD_TO_PLAYLIST : String = "add_to_playlist";
		public static const DOWNLOAD_ITEM : String = "donwload_item";
		
		public var jsonObj : Object;
		
		public function ResultItemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}