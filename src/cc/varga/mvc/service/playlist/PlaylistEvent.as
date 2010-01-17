package cc.varga.mvc.service.playlist
{
	import flash.events.Event;
	
	public class PlaylistEvent extends Event
	{
		
		
		public static const ADD_TO_PLAYLIST : String = "add_to_playlist";
		
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