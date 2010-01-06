package cc.varga.mvc
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.events.player.PlayerEvent;
	import cc.varga.utils.logging.Logger;
	import cc.varga.mvc.events.sound.SoundEvent;
	
	public class ApplicationMediator extends Mediator
	{
		
		[Inject]
		public var view : FlexPlayer;
		
		public function ApplicationMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			Logger.tracing("onRegister", this.toString());
			
			eventMap.mapListener(eventDispatcher, PlayerEvent.PLAY_YOUTUBE_VIDEO, onPlayYoutubeVideo); 
			eventMap.mapListener(view, SoundEvent.SOUND_END, onEnd); 
			
		}
		
		private function onEnd(event : SoundEvent):void{
			
			Logger.tracing("on youtube video complete", this.toString());
			
		}
		
		private function onPlayYoutubeVideo(event : PlayerEvent):void{
			
			Logger.tracing("play youtube video", this.toString());
			
			view.youtubePlayer.player.videoID = event.youtubeVideoID;
			
		}
		
		public function toString():String{ return "cc.varga.mvc.ApplicationMediator"; }
		
	}
}