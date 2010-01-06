package cc.varga.mvc.views.playlistManager {

    import cc.varga.mvc.models.data.AppDataModel;
    import cc.varga.utils.logging.Logger;
    
    import mx.controls.LinkButton;
    
    import org.robotlegs.mvcs.Mediator;

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