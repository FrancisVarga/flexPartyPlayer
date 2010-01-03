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
package cc.varga.mvc.views.playlisturl.item
{
	import cc.varga.mvc.events.playlist.controller.PlaylistControllerEvent;
	import cc.varga.mvc.models.sound.SoundModel;
	import cc.varga.mvc.models.player.PlayerModel;
	import cc.varga.mvc.models.playlist.PlaylistModel;
	import cc.varga.utils.logging.Logger;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class PlaylistItemMediator extends Mediator
	{
		
		[Inject]
		public var model : PlaylistModel;
		
		[Inject]
		public var view : PlaylistItem;
		
		[Inject]
		public var soundModel : SoundModel;
		
		[Inject]
		public var playlistPlayerModel : PlayerModel;
		
		override public function onRegister() : void{
			
			eventMap.mapListener(view, PlaylistControllerEvent.PLAY_THIS_ITEM, playThisItem);
			eventMap.mapListener(view, PlaylistControllerEvent.ADD_TO_PLAYLIST, addToPL);
			
		}
		
		private function playThisItem(event : PlaylistControllerEvent):void{
			Logger.tracing("Play this item", this.toString());
			soundModel.setCurrentJSONObj(view.jsonObj);
		}
		
		private function addToPL(event : PlaylistControllerEvent):void{
			Logger.tracing("Add to Playlist", this.toString());
			playlistPlayerModel.addItemToPlaylist(event.currentJSONObj);
		}
		
		public function toString():String{ return "cc.varga.mvc.views.plalisturl.item.PlaylistItemMediator"}
	}
	
}