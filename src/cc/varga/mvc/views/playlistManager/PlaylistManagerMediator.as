package cc.varga.mvc.views.playlistManager {

    import cc.varga.mvc.models.data.AppDataModel;
    import cc.varga.utils.logging.Logger;
    
    import mx.controls.LinkButton;
    
    import org.robotlegs.mvcs.Mediator;
    import cc.varga.mvc.events.playlist.PlaylistEvent;
    import mx.core.UIComponent;
    import cc.varga.mvc.views.playlistItem.PlaylistItem;

    public class PlaylistManagerMediator extends Mediator {
        
		[Inject]
		public var model : AppDataModel;
		
		[Inject]
		public var view : PlaylistManager;
		
        public function PlaylistManagerMediator() {
            super();
        }

        override public function onRegister():void{
			
			Logger.tracing("onRegister", this.toString());
			
			eventMap.mapListener(eventDispatcher, PlaylistEvent.DRAW_PLAYLIST, drawPlaylist); 
			
			buildItems();
			
        }
		
		private function drawPlaylist(event : PlaylistEvent):void{
			
			Logger.tracing("drawplaylist", this.toString());
			
			for(var i:uint=0; i < event.playlistSource.length; i++){
				
				var item : PlaylistItem = new PlaylistItem();
				item.jsonObj = event.playlistSource[i];
				view.listContainer.addElement(item);
				
			}
			
		}
		
		private function buildItems():void{
		
			if(model.albumList.length > 0){
				
				for(var i:uint=0; i < model.albumList.length; i++){
					
					var item : PlaylistButton = new PlaylistButton();
					item.dataprovider = model.albumList[i]
					view.listContainer.addElement(item);
					
				}
				
			}else{
				
			}
			
		}
		
		public function toString():String{return "cc.varga.mvc.views.playlistManager.PlaylistManagerMediator";}
		
    }
}