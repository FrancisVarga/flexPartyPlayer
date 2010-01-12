package cc.varga.mvc.views.navigation
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.ApplicationStateList;
	
	public class NavigationMediator extends Mediator
	{
		
		[Inject]
		public var view : Navigation;
		
		private var stateList : Array;
		private var currentStatePos : uint;
		public function NavigationMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			eventMap.mapListener(view, NavigationEvent.LEFT_CLICK, onLeftClick);
			eventMap.mapListener(view, NavigationEvent.RIGHT_CLICK, onRightClick);
		
			stateList = ApplicationStateList.stateList;
			
		}
		
		private function onLeftClick(naviEvent : NavigationEvent):void{
			var event : NavigationEvent = new NavigationEvent(NavigationEvent.LEFT_CLICK);
			dispatch(event);
		}
		
		private function onRightClick(naviEvent : NavigationEvent):void{
			var event : NavigationEvent = new NavigationEvent(NavigationEvent.RIGHT_CLICK);
			dispatch(event);
		}
		
	}
}