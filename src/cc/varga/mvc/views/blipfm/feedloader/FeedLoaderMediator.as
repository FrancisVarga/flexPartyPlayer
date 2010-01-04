package cc.varga.mvc.views.blipfm.feedloader
{
	import cc.varga.utils.logging.Logger;
	
	import org.robotlegs.mvcs.*;
	
	public class FeedLoaderMediator extends Mediator
	{

		[Inject]
		public var view : FeedLoader;
		
		public function FeedLoaderMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			Logger.tracing("FeedLoaderMediator onRegister", this.toString());
		}
		
		public function toString():String{
			return "cc.varga.mvc.views.blipfm.feedloader.FeedLoaderContext";
		}
		
	}
}