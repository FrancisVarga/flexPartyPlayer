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
package cc.varga.mvc.views.player
{
	import cc.varga.mvc.events.controllers.ControllersEvent;
	import cc.varga.mvc.events.player.PlayerEvent;
	import cc.varga.mvc.events.playlist.PlaylistURLEvent;
	import cc.varga.mvc.models.player.PlayerModel;
	import cc.varga.mvc.models.playlist.PlaylistModel;
	import cc.varga.mvc.models.sound.SoundModel;
	import cc.varga.mvc.views.blipfm.feedloader.FeedLoader;
	import cc.varga.utils.logging.Logger;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.*;
	
	public class PlayerWindowMediator extends Mediator
	{
		
		[Inject]
		public var view : PlayerWindow;
		
		[Inject]
		public var playerModel : PlayerModel;
		
		[Inject]
		public var sound : SoundModel;
		
		[Inject]
		public var playlist : PlaylistModel;
		
		public function PlayerWindowMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			eventMap.mapListener(eventDispatcher, PlayerEvent.ITEM_ADD_TO_PLAYLIST, onAddItemToPlaylist);
			
			eventMap.mapListener(view, PlayerEvent.LOCK, lockPlayer);
			eventMap.mapListener(view, PlayerEvent.UNLOCK, unlockPlayer);
			eventMap.mapListener(view, PlayerEvent.LOAD_BLIP_FM_FEED, onBlipFeedLoader);
			
			eventMap.mapListener(view, PlaylistURLEvent.PLAYLIST_LOAD, loadPlaylist);
			
		}
		
		private function onBlipFeedLoader(event : PlayerEvent):void{
			
			var loadBlipFeed : FeedLoader = FeedLoader(PopUpManager.createPopUp(contextView, FeedLoader, true));
			PopUpManager.centerPopUp(loadBlipFeed);
			
		}
		
		private function loadPlaylist(event : PlaylistURLEvent):void{
			eventDispatcher.dispatchEvent(new PlaylistURLEvent(PlaylistURLEvent.PLAYLIST_LOAD));
		}
		
		private function playPlaylist(event : ControllersEvent):void{
			
			Logger.tracing("play playlist", this.toString());
			
			
		}
		
		private function lockPlayer(event : PlayerEvent):void{
			
			Logger.tracing("lock player", this.toString());
			view.controllers.Btn_next.enabled = false;
			view.controllers.Btn_prev.enabled = false;
			
		}
		
		private function unlockPlayer(event : PlayerEvent):void{
			
			Logger.tracing("unlock", this.toString());
			view.controllers.Btn_next.enabled = true;
			view.controllers.Btn_prev.enabled = true;	
			
		}
		
		private function onAddItemToPlaylist(event : PlayerEvent):void{
				
			view.dataGrid.dataProvider = playerModel.playlist;
			
		}
		
		public function toString():String{ return "cc.varga.mvc.views.player.PlayerWindowMediator"}
	}
	
}