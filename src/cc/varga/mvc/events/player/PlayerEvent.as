package cc.varga.mvc.events.player
{
	import flash.events.Event;
	
	public class PlayerEvent extends Event
	{
		
		public static const LOCK : String = "lock";
		public static const UNLOCK : String = "unlock";
		public static const OPEN_PLAYER : String = "open_player";
		public static const CLOSE_PLAYER : String = "close_player";
		
		public static const ITEM_ADD_TO_PLAYLIST : String = "item_add_to_playlist";
		
		public function PlayerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}