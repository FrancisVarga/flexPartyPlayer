package cc.varga.mvc.views.player
{
	import cc.varga.api.jukebox.*;
	import cc.varga.mvc.service.playlist.*;
	import cc.varga.mvc.views.result.*;
	import cc.varga.utils.Logger;
	import cc.varga.api.jukebox.*;
	
	import com.automatastudios.audio.audiodecoder.AudioDecoder;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class PlayerMediator extends Mediator
	{
		
		[Inject]
		public var playlistModel : PlaylistService;
		
		private var apiService : JukeboxAPI;
		
		[Inject]
		public var view : Player;
		
		private var collectionID : String;
		private var paused : Boolean = false;
		private var oggDecoder : AudioDecoder = new AudioDecoder();
		private var mp3Decoder : Sound = new Sound();
		private var soundChannel : SoundChannel = new SoundChannel();
		
		public function PlayerMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			eventMap.mapListener(eventDispatcher, PlayerEvent.PLAY_YOUTUBE_VIDEO, playYouTubeVideo);
			eventMap.mapListener(view, PlayerEvent.PLAY_PLAYLIST, onPlayPlaylist);
			eventMap.mapListener(view, PlayerEvent.PLAY_END, onPlayEnd);
			eventMap.mapListener(view, PlayerEvent.PLAYER_PAUSE, onPause);
			eventMap.mapListener(view, KeyboardEvent.KEY_DOWN, onKeyDown);
			eventMap.mapListener(view, PlayerEvent.PLAYER_SAVE_COLLECTION, onPlayerCollectionSave);
			eventMap.mapListener(eventDispatcher, PlayerEvent.PLAY_MP3, playMp3);
			eventMap.mapListener(eventDispatcher, PlayerEvent.PLAY_OGG, playOGG);
			
			drawPlaylist();	
			
		}
		
		private function onPlayerCollectionSave(event : PlayerEvent):void{
			
			Logger.log("save collection", "");
			
			apiService = new JukeboxAPI();
			
			if(!collectionID){
				Logger.log("Create collection", "");
				apiService.addEventListener(JukeboxAPIEvent.COLLECTION_CREATED, onCollectionCreated);
				apiService.createCollection({title:"Default", tags:["Testing", "SaveCollections"]});
			}else{
				apiService.updateCollection({});
			}		
			
		}
		
		private function onCollectionCreated(event : JukeboxAPIEvent):void{
			
			trace(event.result);
			
		}
		
		private function playOGG(event : PlayerEvent):void{
			
			clearSound();
			
		}
		
		private function playMp3(event : PlayerEvent):void{

			clearSound();
			mp3Decoder.addEventListener(Event.COMPLETE, onMp3Complete);
			mp3Decoder.load(new URLRequest(event.itemObj["url"]));
			mp3Decoder.play();
			
		}
		
		private function onMp3Complete(event : Event):void{
			dispatch(new PlayerEvent(PlayerEvent.PLAY_END));
		}
		
		private function onKeyDown(event : KeyboardEvent):void{
			if(event.keyCode == 32 && paused == false){
				paused = true;
				//view.youtubePlayer.pause();
			} else {
				paused = false;
				//view.youtubePlayer.play();
			}
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
			clearSound();
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
		
		private function clearSound():void{
			
			this.soundChannel = null;
			this.mp3Decoder = null;
			this.oggDecoder = null;
			
			this.soundChannel = new SoundChannel();
			this.mp3Decoder = new Sound();
			this.oggDecoder = new AudioDecoder();
			
			view.youtubePlayer.stop();
			
		}
		
	}
}