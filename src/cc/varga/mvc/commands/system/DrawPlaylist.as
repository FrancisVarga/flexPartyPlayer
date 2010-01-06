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
			
			for(var i:uint=0; i < event.sourcePlaylist.length; i++){
			  Logger.tracing("Adding Playlist Item", this.toString());	
				var item : PlaylistItem = new PlaylistItem();
				item.jsonObj = event.sourcePlaylist.getItemAt(i) as Object;
				view.playlist.addElement(item);
				
			}
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.commands.system.DrawPlaylist";
		}
		
	}
}
