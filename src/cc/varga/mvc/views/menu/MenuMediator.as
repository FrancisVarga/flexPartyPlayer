package cc.varga.mvc.views.menu
{
	
	import cc.varga.utils.logging.Logger;
	
	import org.robotlegs.mvcs.*;
	
	public class MenuMediator extends Mediator
	{
		
		[Inject]
		public var view : Menu;
		
		public function MenuMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			
			Logger.tracing("onRegister", this.toString());
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.views.menu.MenuMediator";
		}
		
	}
}