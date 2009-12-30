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
	import org.robotlegs.mvcs.Actor;
	
	public class PlaylistModel extends Actor
	{
		
		public var playListURL :String = "";
		public var playlistObj : Array = new Array();
		public var currentItem : uint = 0;
		
		public function PlaylistModel()
		{
			super();
		}
		
		public function getItems():Array{
			return playlistObj;
		}
		
		public function getNextItem():Object{
			currentItem++;
			if(currentItem >= playlistObj.length){
				currentItem = 0;
			}
			
			return playlistObj[currentItem];				
		}
		
		public function getPrevItem():Object{
			currentItem--;
			if(currentItem <= 0){
				currentItem = 0;
			}
			
			return playlistObj[currentItem];
		}
		
		public function getCurrentItem():Object{
			return playlistObj[currentItem];
		}
		
		public function toString():String{ return "cc.varga.mvc.models.playlist.PlaylistModel"}
	}
	
}