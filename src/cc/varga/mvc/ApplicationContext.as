package cc.varga.mvc
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	import cc.varga.mvc.views.search.SearchSite;
	import cc.varga.mvc.views.search.SearchSiteMediator;
	
	public class ApplicationContext extends Context
	{
		public function ApplicationContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup() : void{
				
			mediatorMap.mapView(SearchSite, SearchSiteMediator);
		
			super.startup();
			
		}
		
	}
}