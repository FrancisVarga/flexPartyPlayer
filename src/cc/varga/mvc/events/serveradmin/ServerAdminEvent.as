package cc.varga.mvc.events.serveradmin
{
	import flash.events.Event;
	
	public class ServerAdminEvent extends Event
	{
		
		public static const SERVERADMIN_OPEN : String = "open_serveradmin";
		
		public function ServerAdminEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}