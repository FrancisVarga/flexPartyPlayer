package cc.varga.mvc.views.player
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.mvc.service.*;
	
	public class PlayerItemMediator extends Mediator
	{
		
		[Inject]
		public var view : PlayerItem;
		
		[Inejct]
		public var soundService : ISoundService;
		
		public function PlayerItemMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			
		}
		
		private function onPlayItem(event:PlayerEvent):void{
			
			
			
		}
		
		private function checkPlayType():void{
			
		}
		
		
	}
}
