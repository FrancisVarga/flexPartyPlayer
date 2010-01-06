package cc.varga.mvc.events.playlist
{
	import flash.events.Event;
	
	public class PlaylistEvent extends Event
	{
		
		public static const ADD_ALL_TO_PLAYLIST : String = "add_all_to_playlist";
		public static const DOWNLOAD : String = "download";
		public static const GET_ALBUM : String = "get_album";
		public static const DRAW_PLAYLIST : String = "draw_playlist";
		
		public var albumID : String;
		
		public var playlistSource : Array;
		
		public function PlaylistEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}