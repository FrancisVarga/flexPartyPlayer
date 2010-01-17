package cc.varga.mvc.views.result
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.service.playlist.*;
	import cc.varga.mvc.*;
	import cc.varga.mvc.views.player.*;
	
	public class ResultItemMediator extends Mediator
	{
		
		[Inject]
		public var view : ResultItem;
		
		[Inject]
		public var model : PlaylistService;
		
		public function ResultItemMediator()
		{
			super();
		}
		
		override public function onRegister() : void{

			eventMap.mapListener(view, PlaylistEvent.ADD_TO_PLAYLIST, onAddToPlaylist);  
			eventMap.mapListener(view, PlayerEvent.PLAY_ITEM, onPlayYouTube);
			
		}
		
		private function onPlayYouTube(event : PlayerEvent):void{
			dispatch(event);
		}
		
		private function onAddToPlaylist(event : PlaylistEvent):void{
			dispatch(event);			
		}
		
	}
}