package cc.varga.mvc.service.playlist
{
	import flash.events.Event;
	
	public class PlaylistEvent extends Event
	{
		
		
		public static const PLAYLIST_ADD : String = "playlist_add";
    public static const PLAYLIST_REMOVE : String = "playlist_remove";
		
		public var addToPlaylistObj : Object;
		
		public function PlaylistEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			var playEvent : PlaylistEvent = new PlaylistEvent(this.type);
			playEvent.addToPlaylistObj = this.addToPlaylistObj;
			return playEvent;
		}
		
	}
}
