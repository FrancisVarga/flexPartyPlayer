package cc.varga.mvc.events.playlist
{
	import flash.events.Event;
	
	public class PlaylistEvent extends Event
	{
		
		public static const ADD_ALL_TO_PLAYLIST : String = "add_all_to_playlist";
		
		public function PlaylistEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}