package cc.varga.mvc
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	import cc.varga.mvc.views.search.SearchSite;
	import cc.varga.mvc.views.search.SearchSiteMediator;
	import cc.varga.mvc.views.search.SearchSiteEvent;
	import cc.varga.mvc.views.result.ResultItem;
	import cc.varga.mvc.views.result.ResultItemMediator;
	
	import cc.varga.mvc.commands.DrawResultCommand;
	import cc.varga.mvc.service.playlist.IPlaylist;
	import cc.varga.mvc.service.playlist.Playlist;
	
	public class ApplicationContext extends Context
	{
		public function ApplicationContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup() : void{
				
			//Commands
			commandMap.mapEvent(SearchSiteEvent.DRAW_RESULT, DrawResultCommand, SearchSiteEvent);
			
			//Views
			mediatorMap.mapView(SearchSite, SearchSiteMediator);
			mediatorMap.mapView(ResultItem, ResultItemMediator);
			
			//Injections
			injector.mapSingleton(Playlist);
			
			super.startup();
			
		}
		
	}
}