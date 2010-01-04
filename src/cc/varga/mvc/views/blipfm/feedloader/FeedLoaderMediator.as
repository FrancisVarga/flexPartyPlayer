package cc.varga.mvc.views.blipfm.feedloader
{
	import cc.varga.utils.logging.Logger;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.*;
	
	public class FeedLoaderMediator extends Mediator
	{
		public function FeedLoaderMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.views.blipfm.feedloader.FeedLoaderContext";
		}
		
	}
}