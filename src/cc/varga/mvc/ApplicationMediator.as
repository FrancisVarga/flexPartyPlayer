package cc.varga.mvc
{
	import flash.events.KeyboardEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ApplicationMediator extends Mediator
	{
		
		[Inject]
		public var view : Jukebox;
		

		public function ApplicationMediator()
		{
			super();
		}
		
		override public function onRegister():void{	
		}
		
		private function onKeyDown(event : KeyboardEvent):void{
			
		}
		
	}
}
