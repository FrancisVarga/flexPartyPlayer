package cc.varga.mvc.views.player
{
	import flash.events.Event;
	
	public class PlayerEvent extends Event
	{
		public static const PLAYER_ENABLE : String = "player_enable";
		public static const PLAYER_DISABLE : String = "player_disable";
		public static const PLAYER_PAUSE : String = "player_pause";
		public static const PLAYER_NEXT : String = "player_next";
		public static const PLAYER_PREV : String = "player_prev";

		public static const PLAYER_SAVE_COLLECTION : String = "save_collection";
		public static const PLAYER_LOAD_COLLECTION : String = "load_collection";
		
		public var result : Object;
		
		public function PlayerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			var cloneEvent : PlayerEvent = new PlayerEvent(this.type);
			cloneEvent.result = this.result;
			return cloneEvent;
		}
	}
}
