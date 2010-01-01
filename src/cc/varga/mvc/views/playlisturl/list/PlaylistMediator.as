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
package cc.varga.mvc.views.playlisturl.list
{
	import cc.varga.mvc.events.playlist.PlaylistURLEvent;
	import cc.varga.mvc.models.player.PlayerModel;
	import cc.varga.mvc.models.playlist.PlaylistModel;
	import cc.varga.mvc.views.playlisturl.item.PlaylistItem;
	import cc.varga.utils.logging.Logger;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class PlaylistMediator  extends Mediator
	{
		
		[Inject]
		public var view : Playlist;
		
		[Inject]
		public var model : PlaylistModel;
		
		[Inject]
		public var playerModel : PlayerModel;
		
		private var currentLength : uint = 0;
		
		public function PlaylistMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			Logger.tracing("Register PlaylistMediator", this.toString());
			
			eventMap.mapListener(eventDispatcher, PlaylistURLEvent.PLAYLIST_DISPLAYED, buildPlaylist); 
			
		}
		
		private function buildPlaylist(event : *):void{			
			var playlist : Array = model.getItems();
			
			if(playlist.length > 0){
				
				if(currentLength < 1 || currentLength != playlist.length){
					
					currentLength = playlist.length;
					
					for(var i:uint=0; i < playlist.length; i++){
						
						var item : PlaylistItem = new PlaylistItem();
						item.jsonObj = playlist[i];
						view.addElement(item);
						
					}	
				}
				
			}
			
		}
		
		public function toString():String{ return "cc.varga.mvc.views.playlisturl.list.PlaylistMediator"}
	}
	
}