package cc.varga.mvc.views.search
{
	import flash.events.Event;
	
	public class SearchSiteEvent extends Event
	{

		public static const SEARCH_CLICKED : String = "search_clicked";
		public static const LOAD_BLIP_FM_FEED : String = "load_blip_fm_feed";
		public static const DOWNLOAD_SONG : String = "download_song";
		public static const LOAD_REMOTE_PLAYLIST : String = "load_remote_playlist";
		public static const DRAW_RESULT : String = "draw_result";
		
		public var search_query : String;
		public var blipFM_Nick : String;
		public var jsonObj:Object;
		public var remotePlaylistURL : String;
		public var resultJSON : Object;
		
		public function SearchSiteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}