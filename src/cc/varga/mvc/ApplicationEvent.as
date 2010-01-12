package cc.varga.mvc
{
	import flash.events.Event;
	
	public class ApplicationEvent extends Event
	{
		
		public static const SWITCH_TO_PLAYER : String = "switch_to_player";
		
		public var stage:String;
		
		public function ApplicationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}