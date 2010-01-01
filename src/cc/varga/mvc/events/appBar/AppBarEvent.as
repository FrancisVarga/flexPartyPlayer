package cc.varga.mvc.events.appBar
{
	import flash.events.Event;
	
	public class AppBarEvent extends Event
	{
		
		public static const OPEN_PLAYER : String = "open_player";
		public static const OPEN_SERVERADMIN : String = "open_serveradmin";
		
		public function AppBarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}