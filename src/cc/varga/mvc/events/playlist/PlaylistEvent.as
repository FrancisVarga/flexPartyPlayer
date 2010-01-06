package cc.varga.mvc.events.playlist
{
	import flash.events.Event;
	
	public class PlaylistEvent extends Event
	{
		
		public static const ADD_ALL_TO_PLAYLIST : String = "add_all_to_playlist";
		public static const DOWNLOAD : String = "download";
		public static const GET_ALBUM : String = "get_album";
		
		public var albumID : String;
		
		public function PlaylistEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}