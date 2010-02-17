package cc.varga.mvc.service.playlist
{
	import cc.varga.mvc.service.IPlaylistService;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Actor;
	
	public class PlaylistService extends Actor implements IPlaylistService
	{
		[Bindable]
		private var playlist : ArrayCollection = new ArrayCollection();		
		
		[Bindable]
		public var repeat : Boolean = false;
		
		private var itemDict : Dictionary = new Dictionary();
		private var currentPos : uint = 0;
    private var _current : Object;
    private var _previous : Object;
    private var _next : Object;
		
		public function PlaylistService()
		{
			super();
		}
		
		public function add(item : Object) : void
		{
			playlist.addItem(item);
			itemDict[item] = item;
		}
		
		public function remove(item : Object) : void
		{
			
		}
		
/*		public function getItem(index : uint) : Object{
			return playlist.getItemAt(index);
		}
	*/	
		/*public function shufflePlaylist():void
		{
			
		}
		
		public function repeatPlaylist():void
		{
			if(repeat){
				repeat = false;
			} else {
				repeat = true;
			}
		}*/
		
		public function clear() : void
		{
			playlist = new ArrayCollection();
			itemDict = new Dictionary();
		}
		
		public function get prev() : Object{
      if(currentPos > 1) {
        currentPos -= 1;
        return playlist.getItemAt(currentPos);
      }
      else {
        return null;
      }
		}
		
		public function get next() : Object{
      if(currentPos < playlist.length) {
        return playlist.getItemAt(currentPos++);
      }
      else {
        return null;
      }
		}
		
		public function get all() : ArrayCollection
		{
			return playlist;
		}
		

    public function get current() : Object {
      return playlist.getItemAt(currentPos);
    }

		import cc.varga.mvc.views.player.*;
		private function checkFileType(jsonObj : Object):void{
			
//      var event : PlayerEvent = new PlayerEvent(PlayerEvent.PLAY_MP3);
//      event.result = jsonObj.sid;
//      dispatch(event);
	//		if(jsonObj["video_id"]){
	//			var event : PlayerEvent = new PlayerEvent(PlayerEvent.PLAY_YOUTUBE_VIDEO);
	//			event.itemObj = jsonObj;
	//			dispatch(event);
	//		}
			
		}
	
		
	}
}

