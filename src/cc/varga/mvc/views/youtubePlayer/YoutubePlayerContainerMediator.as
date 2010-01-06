package cc.varga.mvc.views.youtubePlayer
{
	import cc.varga.mvc.events.player.PlayerEvent;
	import cc.varga.utils.logging.Logger;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class YoutubePlayerContainerMediator extends Mediator
	{
		
		[Inject]
		public var view : YoutubePlayerContainer;
		
		public function YoutubePlayerContainerMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			
			eventMap.mapListener(view, PlayerEvent.PLAY_YOUTUBE_VIDEO, playVideo);
			
		}
		
		private function playVideo(event : PlayerEvent):void{
			
			Logger.tracing("PlayVideo", this.toString());
			
			if(event.youtubeVideoID.length > 0){
				
				view.player.videoID = event.youtubeVideoID;				
				
			}
			
		}
		
		public function toString():String{ return "cc.varga.mvc.views.youtubePlayer.YoutubePlayerContainerMediator"; }
		
	}
}