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
package cc.varga.mvc.models.playlist
{
	import cc.varga.mvc.models.sound.ISound;
	import cc.varga.mvc.events.playlist.*;
	import cc.varga.utils.logging.Logger;
  import com.adobe.serialization.json.*;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	import org.robotlegs.mvcs.*;
	
	public class PlaylistModel extends Actor implements ISound
	{
		
		private var _playlistObj : ArrayCollection = new ArrayCollection();
		private var searchText : String;
		
		public var playListURL :String = "";
		public var currentItem : uint = 0;
		
		public function set playlistObj(value : Array):void{
			_playlistObj.source = value;
		}
		
		public function getItems():Array{
			return _playlistObj.source;
		}
		
		public function getNextItem():Object{
			currentItem++;
			if(currentItem >= _playlistObj.length){
				currentItem = 0;
			}
			
			return _playlistObj.getItemAt(currentItem);				
		}
		
		public function getPrevItem():Object{
			currentItem--;
			if(currentItem <= 0){
				currentItem = 0;
			}
			
			return _playlistObj.getItemAt(currentItem);
		}
		
		public function getCurrentItem():Object{
			return _playlistObj.getItemAt(currentItem);
		}
		
		public function listlength():uint{
			return _playlistObj.source.length;
		}
		
		public function search(value : String):void{
			this.searchText = value;
			var http : HTTPService = new HTTPService();
			http.addEventListener(FaultEvent.FAULT, onSerachFault);
			http.addEventListener(ResultEvent.RESULT, onSearchResult);
			http.method = "POST";
			http.url = "http://aludose/web/search.json";

			http.send( {"query":value} );
		}
		
		private function onSearchResult(event : ResultEvent):void{
      		playlistObj = JSON.decode(event.result.toString()) as Array;
      		dispatch(new PlaylistURLEvent(PlaylistURLEvent.PLAYLIST_DISPLAYED));
		}
		
		private function onSerachFault(event : FaultEvent):void{
			
		}
		
		public function toString():String{ return "cc.varga.mvc.models.playlist.PlaylistModel"}
	}
	
}
