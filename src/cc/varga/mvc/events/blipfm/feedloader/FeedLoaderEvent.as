package cc.varga.mvc.events.blipfm.feedloader
{
	import flash.events.Event;
	
	public class FeedLoaderEvent extends Event
	{
		
		public static const LOAD_FEED : String = "load_feed";
		
		public var blipNick : String;
		
		public function FeedLoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}