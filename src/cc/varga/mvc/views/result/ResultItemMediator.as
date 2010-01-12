package cc.varga.mvc.views.result
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.service.playlist.Playlist;
	import cc.varga.mvc.*;
	
	public class ResultItemMediator extends Mediator
	{
		
		[Inject]
		public var view : ResultItem;
		
		[Inject]
		public var model : Playlist;
		
		public function ResultItemMediator()
		{
			super();
		}
		
		override public function onRegister() : void{

			eventMap.mapListener(view, ResultItemEvent.ADD_TO_PLAYLIST, onAddToPlaylist); 
			
		}
		
		private function onAddToPlaylist(event : ResultItemEvent):void{
			
			model.addToPlaylist(event.jsonObj);	
			
			var appEvent : ApplicationEvent = new ApplicationEvent(ApplicationEvent.SWITCH_TO_PLAYER);
			appEvent.stage = ApplicationStateList.PLAYER_STATE;
			dispatch(appEvent);
			
		}
		
	}
}