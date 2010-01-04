package cc.varga.mvc.events.blipfm
{
	import flash.events.Event;
	
	public class BlipFMEvent extends Event
	{
		
		public static const BLIPFM_LOAD_FEED : String = "blipfm_load_feed";
		
		public var nickName : String;
		
		public function BlipFMEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}