package cc.varga.mvc.commands
{
	import org.robotlegs.mvcs.Command;
	import cc.varga.mvc.service.*;
	import cc.varga.mvc.service.playlist.*;
	import cc.varga.mvc.service.StateChangerService;
	import cc.varga.mvc.*;
	
	public class AddToPlaylistCommand extends Command
	{
	
		[Inject]
		public var playlistService : IPlaylistService;
		
		[Inject]
		public var event : PlaylistEvent;
		
		[Inject]
		public var stageSwitcherService : StateChangerService;
		
		public function AddToPlaylistCommand()
		{
			super();
		}
		
		override public function execute() : void{
			playlistService.add(event.addToPlaylistObj);
			stageSwitcherService.switchToStage(ApplicationStateList.PLAYER_STATE);
		}
	}
}
