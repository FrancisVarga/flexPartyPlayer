package cc.varga.mvc.models.player
{
	import cc.varga.mvc.events.playlist.PlaylistURLEvent;
	import cc.varga.mvc.views.player.PlayerWindow;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class PlayerModel extends Actor
	{
		
		private var currentPlayList : ArrayCollection = new ArrayCollection();
		
		private var window : PlayerWindow = new PlayerWindow();
		
		public function addItemToPlaylist(json:Object):void{
			playlist.addItem(json);
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
			
	}
}