package cc.varga.mvc
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.events.player.PlayerEvent;
	import cc.varga.utils.logging.Logger;
	import cc.varga.mvc.events.sound.SoundEvent;
	import flash.media.Sound;
	import flash.events.KeyboardEvent;
	import mx.formatters.SwitchSymbolFormatter;
	import flash.ui.Keyboard;
	
	public class ApplicationMediator extends Mediator
	{
		
		[Inject]
		public var view : FlexPlayer;
		
		private var tabDown : uint = 0;
		
		public function ApplicationMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			Logger.tracing("onRegister", this.toString());
			
			eventMap.mapListener(eventDispatcher, PlayerEvent.PLAY_YOUTUBE_VIDEO, onPlayYoutubeVideo); 
			eventMap.mapListener(view, SoundEvent.SOUND_END, onEnd);
			eventMap.mapListener(view, KeyboardEvent.KEY_DOWN, onKeyDown);
			
		}
		
		private function onKeyDown(event : KeyboardEvent):void{
			
			Logger.tracing("Key down: " + event.keyCode, this.toString());
			
			switch(event.keyCode){
				case Keyboard.F11 : 
					onTabPush();
					break;
				default :
					break;
			}
			
		}
		
		private function onTabPush():void{
			
			if(tabDown == 0){
				Logger.tracing("First Tab Down", this.toString());
				view.currentState = "full";
				tabDown++;
			}else{
				Logger.tracing("Second Tab Down", this.toString());
				view.currentState = "normal";
				tabDown = 0;
			}
			
		}
		
		private function onEnd(event : SoundEvent):void{
			
			Logger.tracing("on youtube video complete", this.toString());
			view.youtubePlayer.visible = false;
			
		}
		
		private function onPlayYoutubeVideo(event : PlayerEvent):void{
			
			Logger.tracing("play youtube video", this.toString());
			
			view.youtubePlayer.player.videoID = event.youtubeVideoID;
			view.youtubePlayer.visible = true;
			
		}
		
		public function toString():String{ return "cc.varga.mvc.ApplicationMediator"; }
		
	}
}