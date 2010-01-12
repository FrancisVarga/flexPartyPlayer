package cc.varga.mvc.views.navigation
{
	import flash.events.Event;
	
	public class NavigationEvent extends Event
	{
		
		public static const LEFT_CLICK : String = "left_click";
		public static const RIGHT_CLICK : String = "right_click";
		
		public function NavigationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}