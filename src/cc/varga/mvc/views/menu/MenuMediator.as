package cc.varga.mvc.views.menu
{
	
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
			
		}
		
	}
}