package cc.varga.mvc.events.system
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class SystemEvent extends Event
	{
		
		public static const START_REGISTRY : String = "registry_start";
		public static const FINISHED_RIGSTRY : String = "finished_registry";
		public static const FINISHED_VIEW_REGISTRY : String = "finished_view_reg";
		public static const FINISHED_INJECTIONS_REGISTRY : String = "finished_inj_reg";
		public static const FINISHED_MEDIATOR_REGISTRY : String = "finished_mediator_reg";
		public static const DRAW_PLAYLIST : String = "draw_playlist";
		
		public var sourcePlaylist : ArrayCollection = new ArrayCollection();
		
		public function SystemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}