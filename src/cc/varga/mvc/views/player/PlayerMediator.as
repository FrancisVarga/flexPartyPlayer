package cc.varga.mvc.views.player
{
	import cc.varga.mvc.service.playlist.*;
	import cc.varga.mvc.views.result.*;
	import cc.varga.utils.Logger;
	
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.service.api.PlaydarService;
	import cc.varga.mvc.service.*;
	
	public class PlayerMediator extends Mediator
	{
		
		
    [Inject]
    public var disorder : IPlayerService;

    [Inject]
    public var playlist : IPlaylistService;

		
		[Inject]
		public var view : Player;
		
		private var paused : Boolean = false;
		
		public function PlayerMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			eventMap.mapListener(view, PlayerEvent.PLAYER_ENABLE, onPlayPlaylist);
			eventMap.mapListener(view, PlayerEvent.PLAYER_PAUSE, onPause);
			eventMap.mapListener(view, PlayerEvent.PLAYER_NEXT, onNext);
			eventMap.mapListener(view, PlayerEvent.PLAYER_PREV, onPrev);

			
      disorder.beforeNext = onSongComplete;
			drawPlaylist();	
			
		}
		
		private function onPause(event:PlayerEvent):void{
      disorder.state = "stalled";
		}
		
		private function onNext(event:PlayerEvent):void{
      onSongComplete();
		}

    private function onPrev(event:PlayerEvent) :void {
      var prev : Object = playlist.prev;
      if(prev != null) {
        disorder.play(prev.sid);
      }
      else {
        disorder.state = "stalled";
      }
    }

		private function onSongComplete(): void{
      var next : Object = playlist.next;
      if(next != null) {
        disorder.play(next.sid);
      }
      else {
        disorder.state = "stalled";
      }
		}
		
		private function onPlayItem(event : PlayerEvent):void{
			Logger.log("PlayItem Event", "");
		}
		
		private function onPlayPlaylist(event : PlayerEvent):void{
      disorder.state = "continuous";
		}
		
		private function onPlayMP3(event:PlayerEvent) : void {
		}
		
		private function drawPlaylist():void{
			
			view.playlist.removeAllElements();
			
			for(var i:uint=0; i < playlist.all.length; i++){
				
				var item : PlayerItem = new PlayerItem();
				item.jsonObj = playlist.all.getItemAt(i);
				item.position = i;
				view.playlist.addElement(item);
				
			}
			
		}
		
	}
}
