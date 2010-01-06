package cc.varga.mvc.commands.system
{
	import cc.varga.mvc.events.system.SystemEvent;
	import cc.varga.mvc.views.playlistItem.PlaylistItem;
	import cc.varga.utils.logging.Logger;
	
	import org.robotlegs.mvcs.Command;
	
	public class DrawPlaylist extends Command
	{
		
		[Inject]
		public var event : SystemEvent;
		
		public var view : FlexPlayer;
		
		public function DrawPlaylist()
		{
			super();
		}
		
		override public function execute() : void{
			
			view = contextView as FlexPlayer;
			
			Logger.tracing("Draw PLaylist View: " + view, this.toString());
			Logger.tracing("Playlist Source: " + event.sourcePlaylist, this.toString());
			
			if(event.sourcePlaylist || event.sourcePlaylist.length > 0){
				for(var i:uint=0; i < event.sourcePlaylist.length; i++){
					
					var item : PlaylistItem = new PlaylistItem();
					item.jsonObj = event.sourcePlaylist.getItemAt(i) as Object;
					view.playlist.addElement(item);
					
				}
			} else {
				Logger.tracing("Source of playlist is null", this.toString());
			}
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.commands.system.DrawPlaylist";
		}
		
	}
}