package cc.varga.mvc.events.system
{
	import flash.events.Event;
	
	public class SystemEvent extends Event
	{
		
		public static const FINISHED_RIGSTRY : String = "finished_registry";
		public static const FINISHED_VIEW_REGISTRY : String = "finished_view_reg";
		public static const FINISHED_INJECTIONS_REGISTRY : String = "finished_inj_reg";
		public static const FINISHED_MEDIATOR_REGISTRY : String = "finished_mediator_reg";
		
		
		public function SystemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}