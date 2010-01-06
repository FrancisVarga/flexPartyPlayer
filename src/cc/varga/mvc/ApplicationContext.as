//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
//Authors: Franics Varga
//eMail: fv@varga-multimedia.com
//homepage: http://www.varga-multimedia.com
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//<a href='http://creativecommons.org/licenses/by-nc-sa/3.0/'>Creative Commons License<a\>
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//You are free:
//
//to Share — to copy, distribute and transmit the work
//to Remix — to adapt the work
//Under the following conditions:
//
//Attribution — You must attribute the work in the manner specified by the author or licensor 
//(but not in any way that suggests that they endorse you or your use of the work).
//
//Noncommercial — You may not use this work for commercial purposes.
//
//Share Alike — If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.
//
//With the understanding that:
//
//Waiver — Any of the above conditions can be waived if you get permission from the copyright holder.
//Public Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.
//Other Rights — In no way are any of the following rights affected by the license:
//
//Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations; The author's moral rights;
//
//Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.
//Notice — For any reuse or distribution, you must make clear to others the license terms of this work. 
//The best way to do this is with a link to this web page.																	
//
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
package cc.varga.mvc
{
	import cc.varga.mvc.commands.data.LoadAlbumsData;
	import cc.varga.mvc.commands.data.LoadArtistDataCommand;
	import cc.varga.mvc.commands.playlist.LoadPlaylistCommand;
	import cc.varga.mvc.events.playlist.PlaylistURLEvent;
	import cc.varga.mvc.models.data.AppDataModel;
	import cc.varga.mvc.models.player.PlayerModel;
	import cc.varga.mvc.models.playlist.PlaylistModel;
	import cc.varga.mvc.models.sound.SoundModel;
	import cc.varga.mvc.views.blipfm.feedloader.FeedLoader;
	import cc.varga.mvc.views.blipfm.feedloader.FeedLoaderMediator;
	import cc.varga.mvc.views.controllers.Controllers;
	import cc.varga.mvc.views.controllers.ControllersMediator;
	import cc.varga.mvc.views.menu.Menu;
	import cc.varga.mvc.views.menu.MenuMediator;
	import cc.varga.mvc.views.player.PlayerWindow;
	import cc.varga.mvc.views.player.PlayerWindowMediator;
	import cc.varga.mvc.views.playlist.Playlist;
	import cc.varga.mvc.views.playlist.PlaylistMediator;
	import cc.varga.mvc.views.playlistItem.PlaylistItem;
	import cc.varga.mvc.views.playlistItem.PlaylistItemMediator;
	import cc.varga.mvc.views.playlistManager.PlaylistButton;
	import cc.varga.mvc.views.playlistManager.PlaylistButtonMediator;
	import cc.varga.mvc.views.playlistManager.PlaylistManager;
	import cc.varga.mvc.views.playlistManager.PlaylistManagerMediator;
	import cc.varga.mvc.views.playlisturl.PlaylistURL;
	import cc.varga.mvc.views.playlisturl.PlaylistURLMediator;
	import cc.varga.mvc.views.search.Search;
	import cc.varga.mvc.views.search.SearchMediator;
	import cc.varga.utils.logging.Logger;
	
	import flash.display.DisplayObjectContainer;
	import flash.system.Security;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import flash.system.System;
	
	public class ApplicationContext extends Context
	{
		
		public static var INSTANCE : ApplicationContext;
		
		public function ApplicationContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
			
			Security.loadPolicyFile("http://aludose/crossdomain.xml");
			
			INSTANCE = this;
		}
		
		override public function startup() : void{
			
			Logger.tracing("Application Startup", this.toString());
			
			commandMap.mapEvent(PlaylistURLEvent.PLAYLIST_LOAD, LoadPlaylistCommand, null, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, LoadArtistDataCommand, null, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, LoadAlbumsData, null, true);
			
			injector.mapSingleton(PlaylistModel);
			injector.mapSingleton(SoundModel);
			injector.mapSingleton(PlayerModel);
			injector.mapSingleton(AppDataModel);
			
			mediatorMap.mapView(PlaylistURL, PlaylistURLMediator);
			mediatorMap.mapView(PlaylistItem, PlaylistItemMediator);
			mediatorMap.mapView(Controllers, ControllersMediator);
			mediatorMap.mapView(Playlist, PlaylistMediator);
			mediatorMap.mapView(PlayerWindow, PlayerWindowMediator);
			mediatorMap.mapView(Menu, MenuMediator);
			mediatorMap.mapView(FeedLoader, FeedLoaderMediator);
			mediatorMap.mapView(Search, SearchMediator);
			mediatorMap.mapView(PlaylistManager, PlaylistManagerMediator);
			mediatorMap.mapView(PlaylistButton, PlaylistButtonMediator);
			mediatorMap.mapView(FlexPlayer, ApplicationMediator);
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
			
		}
		
		override public function shutdown() : void{
			
			Logger.tracing("Shutdown Applikation", this.toString());
		}
		
		public function toString():String{ return "cc.varga.mvc.ApplicationContext"}
	}
	
}