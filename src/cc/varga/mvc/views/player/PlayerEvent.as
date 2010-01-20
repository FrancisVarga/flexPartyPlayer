package cc.varga.mvc.views.player
{
	import flash.events.Event;
	
	public class PlayerEvent extends Event
	{
		
		public static const PLAY_ITEM : String = "play_item";
		public static const PLAY_YOUTUBE_VIDEO : String = "play_youtube_video";
		public static const PLAY_OGG : String = "play_ogg";
		public static const PLAY_MP3 : String = "play_mp3";
		public static const PLAY_PLAYLIST : String = "play_playlist";
		public static const PLAY_END : String = "play_end";
			
		public static const PLAYER_PAUSE : String = "player_pause";
		public static const PLAYER_NEXT : String = "player_next";
		public static const PLAYER_PREV : String = "player_prev";
		public static const PLAYER_REPEAT : String = "player_repeat";
		public static const PLAYER_SHUFFLE : String = "player_shuffle";
		
		private var _youTubeID : String;
		public var itemObj : Object;
		
		public function PlayerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function set youTubeID(value:String):void{
			_youTubeID = value;
		}
		
		public function get youTubeID():String{
			return itemObj["video_id"];
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