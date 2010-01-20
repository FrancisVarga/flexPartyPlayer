package cc.varga.mvc.views.player
{
	import cc.varga.mvc.service.playlist.*;
	import cc.varga.mvc.views.result.*;
	import cc.varga.utils.Logger;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class PlayerMediator extends Mediator
	{
		
		[Inject]
		public var playlistModel : PlaylistService;
		
		[Inject]
		public var view : Player;
		
		private var paused : Boolean = false;
		
		public function PlayerMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			eventMap.mapListener(eventDispatcher, PlayerEvent.PLAY_YOUTUBE_VIDEO, playYouTubeVideo);
			eventMap.mapListener(view, PlayerEvent.PLAY_PLAYLIST, onPlayPlaylist);
			eventMap.mapListener(view, PlayerEvent.PLAY_END, onPlayEnd);
			eventMap.mapListener(view, PlayerEvent.PLAYER_PAUSE, onPause);
			
			drawPlaylist();	
			
		}
		
		private function onPause(event:PlayerEvent):void{
			if(paused){
				paused = false;
				view.youtubePlayer.play();
			}else {
				paused = true;
				view.youtubePlayer.pause();	
			}	
		}
		
		private function onPlayEnd(event : PlayerEvent):void{
			Logger.log("Item End", "");
			playlistModel.play(playlistModel.getNext());
		}
		
		private function onPlayItem(event : PlayerEvent):void{
			Logger.log("PlayItem Event", "");
		}
		
		private function onPlayPlaylist(event : PlayerEvent):void{
			playlistModel.play();
		}
		
		private function playYouTubeVideo(event:PlayerEvent):void{
		
			Logger.log("Play YouTube Video", "");
			view.youtubePlayer.videoID = event.youTubeID;
			
		}
		
		private function drawPlaylist():void{
			
			view.playlist.removeAllElements();
			
			for(var i:uint=0; i < playlistModel.getAll().length; i++){
			
				var item : PlayerItem = new PlayerItem();
				item.jsonObj = playlistModel.getAll().getItemAt(i);
				item.position = i;
				view.playlist.addElement(item);
				
			}
			
		}
		
	}
}