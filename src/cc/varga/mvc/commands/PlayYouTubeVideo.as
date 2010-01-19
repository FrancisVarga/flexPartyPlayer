package cc.varga.mvc.commands
{
	import cc.varga.mvc.ApplicationStateList;
	import cc.varga.mvc.service.StateChangerService;
	import cc.varga.mvc.views.player.PlayerEvent;
	import cc.varga.utils.Logger;
	
	import org.robotlegs.mvcs.Command;
	
	public class PlayYouTubeVideo extends Command
	{
		
		[Inject]
		public var stateService : StateChangerService;
		
		[Inject]
		public var event : PlayerEvent;
		
		public function PlayYouTubeVideo()
		{
			super();
		}
		
		override public function execute() : void{
			Logger.log("play youtube video", "");
			
		}
		
	}
}