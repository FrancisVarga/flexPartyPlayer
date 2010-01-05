package cc.varga.mvc.commands.system
{
	import cc.varga.mvc.events.system.SystemEvent;
	import cc.varga.mvc.views.playlistItem.PlaylistItem;
	
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
				
				var item : PlaylistItem = new PlaylistItem();
				
				view.playlist.addElement(item);
				
			}
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.commands.system.DrawPlaylist";
		}
		
	}
}