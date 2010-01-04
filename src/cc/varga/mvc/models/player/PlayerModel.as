package cc.varga.mvc.models.player
{
	import cc.varga.mvc.events.player.PlayerEvent;
	import cc.varga.mvc.models.sound.ISound;
	import cc.varga.mvc.views.player.PlayerWindow;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.*;
	
	public class PlayerModel extends Actor implements ISound
	{
		[Bindable]
		private var currentPlayList : ArrayCollection = new ArrayCollection();
		
		private var window : PlayerWindow = new PlayerWindow();
		
		private var currentItem : uint = 0;
		
		public function listlength():uint{
			return currentPlayList.source.length;
		}
		
		public function addItemToPlaylist(json:Object):void{
			playlist.addItem(json);
			dispatch(new PlayerEvent(PlayerEvent.ITEM_ADD_TO_PLAYLIST));
		}
		
		public function getCurrentItem():Object{
			return playlist.getItemAt(currentItem);	
		}
		
		public function getNextItem():Object{
			currentItem++;
			if(currentItem > currentPlayList.length){
				currentItem = 0;
			}
			return playlist.getItemAt(currentItem);
		}
		
		public function getPrevItem():Object{
			currentItem--;
			if(currentItem < 0){
				currentItem = 0;
			}
			return playlist.getItemAt(currentItem);
		}
		
		public function removeItemByID(id : int):void{
			currentPlayList.removeItemAt(id);
		}
		
		public function removeItemByObj(json:Object):void{
			
			for(var i:uint=0; i <= currentPlayList.length; i++){
				
				var item : Object = currentPlayList.getItemAt(i);
				
				if(item["_id"] == json["_id"]){
					removeItemByID(i);
				}
				
			}
			
		}
		
		public function get playlist():ArrayCollection{
			return currentPlayList;
		}
		
		public function get lengthPlaylist():uint{
			return currentPlayList.length;
		}
			
	}
}