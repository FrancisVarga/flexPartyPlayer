package cc.varga.mvc.commands
{
	import org.robotlegs.mvcs.Command;
	import cc.varga.mvc.views.navigation.*;
	import cc.varga.mvc.*;
	import cc.varga.mvc.service.*;
	
	public class NavigationCommand extends Command
	{
		
		[Inject]
		public var event : NavigationEvent;
		
		[Inject]
		public var stateService : StateChangerService;
		
		private var currentPos : Number = 0;
		private var stateList : Array = ApplicationStateList.stateList;
		private var mainView : Jukebox;
		
		public function NavigationCommand()
		{
			super();
		}
		
		override public function execute():void{
			
			mainView = contextView as Jukebox;
			
			switch(event.type){
				case NavigationEvent.LEFT_CLICK :
					leftSite();
					break;
				case NavigationEvent.RIGHT_CLICK :
					rightSite();
					break;
				default :
					break;
			}
			
		}
		
		private function leftSite():void{ stateService.switchToLeft(); }
		private function rightSite():void{ stateService.switchToRight(); }
		
	}
}