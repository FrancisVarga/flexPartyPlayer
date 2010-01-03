package cc.varga.mvc.views.blipfm.feedloader.views.loaderURL
{
	import cc.varga.mvc.views.blipfm.feedloader.events.loaderURL.LoaderURLEvent;
	import cc.varga.utils.logging.Logger;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class LoaderURLMediator extends Mediator
	{
		[Inject]
		public var view : LoaderURL;
		
		public function LoaderURLMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			eventMap.mapListener(view, LoaderURLEvent.LOAD_URL, onLoadURLClick);
			
		}
		
		private function onLoadURLClick(event : LoaderURLEvent):void{
			
			Logger.tracing("Load Nick Feed", this.toString());
			
		}
		
		private function toString():String{
			return "cc.varga.mvc.views.blipfm.feedloader.views.loaderURL.LoaderURLMediator";
		}
		
	}
}