package cc.varga.mvc
{
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
		
	}
}