package cc.varga.mvc.views.blipfm.feedloader.events.loaderURL
{
	import flash.events.Event;
	
	public class LoaderURLEvent extends Event
	{
		
		public static const LOAD_URL : String;
		
		public function LoaderURLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}