package cc.varga.mvc.views.blipfm.feedloader
{
	import cc.varga.utils.logging.Logger;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	
	public class FeedLoaderContext extends Context
	{
		public function FeedLoaderContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void{
			
			Logger.tracing("FeedLoader Context Invoked", this.toString());
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.views.blipfm.feedloader.FeedLoaderContext";
		}
		
	}
}