package cc.varga.mvc.service.playlist
{
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
		
		public function PlaylistService()
		{
			super();
		}
		
		public function addToPlaylist(item : Object):void
		{
			playlist.addItem(item);
			itemDict[item] = item;
		}
		
		public function removeFromPlaylist(item : Object):void
		{
			
		}
		
		public function getItem(index : uint):Object{
			return playlist.getItemAt(index);
		}
		
		public function shufflePlaylist():void
		{
			
		}
		
		public function repeatPlaylist():void
		{
			if(repeat){
				repeat = false;
			} else {
				repeat = true;
			}
		}
		
		public function removeAll():void
		{
			playlist = new ArrayCollection();
			itemDict = new Dictionary();
		}
		
		public function getPrev():Object{
			currentPos--;
			if(currentPos < 0){
				currentPos = 0;
			}
			return getItem(currentPos);
			
		}
		
		public function getNext():Object{
			currentPos++;
			if(currentPos == getAll().length){
				Alert.show("End of the Playlist", "Info");
			}
			return getItem(currentPos);
		}
		
		public function getAll():ArrayCollection
		{
			return playlist;
		}
		
		public function play(itemToPlayObj : Object = null):void{ 
			if(itemToPlayObj){
				checkFileType(itemToPlayObj);
			}else{
				checkFileType(this.getItem(0));
			}
		}
		
		import cc.varga.mvc.views.player.*;
		private function checkFileType(jsonObj : Object):void{
			
      var event : PlayerEvent = new PlayerEvent(PlayerEvent.PLAY_MP3);
	//		if(jsonObj["video_id"]){
	//			var event : PlayerEvent = new PlayerEvent(PlayerEvent.PLAY_YOUTUBE_VIDEO);
	//			event.itemObj = jsonObj;
	//			dispatch(event);
	//		}
			
		}
	
		
	}
}
