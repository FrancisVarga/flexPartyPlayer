package cc.varga.mvc.views.result
{
	import cc.varga.mvc.*;
	import cc.varga.mvc.service.StateChangerService;
	import cc.varga.mvc.service.playlist.*;
	import cc.varga.mvc.views.player.*;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ResultItemMediator extends Mediator
	{
		
		[Inject]
		public var view : ResultItem;
		
		[Inject]
		public var model : PlaylistService;
		
		[Inject]
		public var stateService : StateChangerService;
		
		public function ResultItemMediator()
		{
			super();
		}
		
		override public function onRegister() : void{

			eventMap.mapListener(view, PlaylistEvent.ADD_TO_PLAYLIST, onAddToPlaylist);  
			eventMap.mapListener(view, ResultItemEvent.PLAY_ITEM, onPlayYouTube);
			
		}
		
		private function onPlayYouTube(event : ResultItemEvent):void{
			stateService.switchToStage(ApplicationStateList.PLAYER_STATE);
			var playerEvent : PlayerEvent = new PlayerEvent(PlayerEvent.PLAY_YOUTUBE_VIDEO);
			playerEvent.itemObj = event.itemObj;
			dispatch(playerEvent);
		}
		
		private function onAddToPlaylist(event : PlaylistEvent):void{
			dispatch(event);			
		}
		
	}
}