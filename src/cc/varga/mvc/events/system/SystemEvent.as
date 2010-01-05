package cc.varga.mvc.events.system
{
	import flash.events.Event;
	
	public class SystemEvent extends Event
	{
		
		public static const FINISHED_RIGSTRY : String = "finished registry";
		
		public function SystemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}