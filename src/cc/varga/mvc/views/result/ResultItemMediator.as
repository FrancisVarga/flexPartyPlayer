package cc.varga.mvc.views.result
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.service.playlist.*;
	import cc.varga.mvc.*;
	
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

			eventMap.mapListener(view, ResultItemEvent.ADD_TO_PLAYLIST, onAddToPlaylist); 
			
		}
		
		private function onAddToPlaylist(event : ResultItemEvent):void{
			
			var playlistEvent : PlaylistEvent = new PlaylistEvent(PlaylistEvent.ADD_TO_PLAYLIST);
			playlistEvent.addToPlaylistObj = view.jsonObj;
			dispatch(playlistEvent);
			
		}
		
	}
}