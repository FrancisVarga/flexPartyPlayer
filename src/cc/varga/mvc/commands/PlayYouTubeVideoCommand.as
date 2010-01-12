package cc.varga.mvc.commands
{
	import org.robotlegs.mvcs.Command;
	
	import cc.varga.mvc.views.player.PlayerEvent;
	
	public class PlayYouTubeVideoCommand extends Command
	{
		
		[Inject]
		public var event : PlayerEvent;
		
		public function PlayYouTubeVideoCommand()
		{
			super();
		}
		
		override public function execute() : void{
			
			
			
		}
		
	}
}