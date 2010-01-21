package cc.varga.mvc
{
	import cc.varga.mvc.commands.*;
	import cc.varga.mvc.service.*;
	import cc.varga.mvc.service.playlist.*;
	import cc.varga.mvc.views.navigation.*;
	import cc.varga.mvc.views.player.*;
	import cc.varga.mvc.views.result.ResultItem;
	import cc.varga.mvc.views.result.ResultItemMediator;
	import cc.varga.mvc.views.search.SearchSite;
	import cc.varga.mvc.views.search.SearchSiteEvent;
	import cc.varga.mvc.views.search.SearchSiteMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;

	public class ApplicationContext extends Context
	{
		public function ApplicationContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup() : void{
				
			//Commands
			commandMap.mapEvent(SearchSiteEvent.DRAW_RESULT, DrawResultCommand, SearchSiteEvent);
			commandMap.mapEvent(NavigationEvent.LEFT_CLICK, NavigationCommand, NavigationEvent);
			commandMap.mapEvent(NavigationEvent.RIGHT_CLICK, NavigationCommand, NavigationEvent);
			commandMap.mapEvent(PlaylistEvent.ADD_TO_PLAYLIST, AddToPlaylistCommand, PlaylistEvent);
			
			//Views
			mediatorMap.mapView(SearchSite, SearchSiteMediator);
			mediatorMap.mapView(ResultItem, ResultItemMediator);
			mediatorMap.mapView(Navigation, NavigationMediator);
			mediatorMap.mapView(Player, PlayerMediator);
			mediatorMap.mapView(PlayerItem, PlayerItemMediator);
			mediatorMap.mapView(Jukebox, ApplicationMediator);
			
			//Injections
			injector.mapSingleton(PlaylistService);
			injector.mapSingleton(StateChangerService);
			injector.mapValue(Jukebox, contextView );
			
			super.startup();
			
		}
		
	}
}