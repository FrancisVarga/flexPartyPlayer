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
package cc.varga.mvc.events.controllers
{
	import flash.events.Event;
	
	public class ControllersEvent extends Event
	{
		
		public static const LOCK_CLICK : String = "lock_click";
		public static const PLAY_CLICK : String = "play_click";
		public static const STOP_CLICK : String = "stop_click";
		public static const NEXT_CLICK : String = "next_click";
		public static const PREV_CLICK : String = "prev_click";
		public static const SHUFFLE_CLICK : String = "shuffle_click";
		public static const RANDOM_CLICK : String = "random_click";
    public static const TOGGLE_SIDEBARS : String = "toggle_sidebars";
		
		public function ControllersEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	
	}
	
}
