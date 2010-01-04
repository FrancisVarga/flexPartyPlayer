package cc.varga.mvc.views.blipfm.feedloader
{
	import org.robotlegs.mvcs.*;
	
	public class FeedLoaderMediator extends Mediator
	{

		[Inject]
		public var view : FeedLoader;
		
		public function FeedLoaderMediator()
		{
			super();
		}
		
		public function toString():String{
			return "cc.varga.mvc.views.blipfm.feedloader.FeedLoaderContext";
		}
		
	}
}