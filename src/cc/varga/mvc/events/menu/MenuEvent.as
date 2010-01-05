package cc.varga.mvc.events.event
{
	import flash.events.Event;
	
	public class MenuEvent extends Event
	{
		
		public function MenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}