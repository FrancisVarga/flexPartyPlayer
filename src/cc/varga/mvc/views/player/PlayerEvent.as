package cc.varga.mvc.views.player
{
	import flash.events.Event;
	
	public class PlayerEvent extends Event
	{
		
		public static const PLAY_ITEM : String = "play_item";
		public static const PLAY_YOUTUBE_VIDEO = "play_youtube_video";
		public static const PLAY_PLAYLIST : String = "play_playlist";
		
		public var youTubeID : String;
		public var itemObj : Object;
		
		public function PlayerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			var cloneEvent : PlayerEvent = new PlayerEvent(this.type);
			cloneEvent.youTubeID = this.youTubeID;
			cloneEvent.itemObj = this.itemObj;
			return cloneEvent;
		}
	}
}