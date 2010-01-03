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
package cc.varga.mvc.models.sound
{
	import cc.varga.mvc.models.playlist.PlaylistModel;
	import cc.varga.utils.logging.Logger;
	
	import com.automatastudios.audio.audiodecoder.AudioDecoder;
	import com.automatastudios.audio.audiodecoder.decoders.OggVorbisDecoder;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.system.System;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.*;
	
	public class SoundModel extends Actor
	{
		
		[Inject]
		public var playlistModel : PlaylistModel;
		
		public static const MP3 : String = "mp3";
		public static const OGG : String = "ogg";
		private static const BUFFER_SIZE:uint = 8192;
		
		private var soundChannel : SoundChannel = new SoundChannel();
		private var sound : Sound = new Sound();
		private var decoder : AudioDecoder = new AudioDecoder();
		private var soundURL : String;
		private var contentURL : String;
		private var currentCT : String;
		private var _player : String;
		private var currentPlaylist : ISound;
		
		public var currentJSONObj : Object = new Object();
		
		public function set player(value:String):void{
			player = value;
		}
		
		public function setCurrentJSONObj(json : Object):void{
			
			clearSound();
			
			Logger.tracing("set current json object", this.toString());
			
			playSound(json);
		}
		
		private function playSound(playObj:Object):void{
			
			if(playObj != null){
				currentJSONObj = playObj;
				checkFileType();
			}else{
				Alert.show("Something is wrong hit the developer FLEX!", "Error");
			}
			
		}
		
		private function clearSound():void{
			
			Logger.tracing("Clear all sound", this.toString());
			
			soundChannel.stop();
			soundChannel = null;
			soundChannel = new SoundChannel();
			sound = null;
			sound = new Sound();
			decoder = null;
			decoder = new AudioDecoder();
			
			System.gc();
			
		}
		
		public function playPlaylist(playlist:ISound):void{
			
			clearSound();
			
			currentPlaylist = playlist;
			
			soundChannel.addEventListener(Event.SOUND_COMPLETE, onItemComplete);
			sound.addEventListener(Event.COMPLETE, onItemComplete);
			sound.addEventListener(Event.SOUND_COMPLETE, onItemComplete);
			decoder.addEventListener(Event.COMPLETE, onItemComplete);
			decoder.addEventListener(Event.SOUND_COMPLETE, onItemComplete);
			
			if(playlist.listlength() > 0){
				playSound(currentPlaylist.getCurrentItem());
			}else{
				Alert.show("Playlist is null", "Error");
			}
			
		}
		
		private function onItemComplete(event : *):void{
			
			Logger.tracing("Item Complete from Playlist", this.toString());
			
			clearSound();
			
			soundChannel.addEventListener(Event.SOUND_COMPLETE, onItemComplete);
			sound.addEventListener(Event.COMPLETE, onItemComplete);
			sound.addEventListener(Event.SOUND_COMPLETE, onItemComplete);
			decoder.addEventListener(Event.COMPLETE, onItemComplete);
			decoder.addEventListener(Event.SOUND_COMPLETE, onItemComplete);
			
			setCurrentJSONObj(currentPlaylist.getNextItem());
			
		}
		
		private function checkFileType(playTo : String = ""):void{
			
			Logger.tracing("check file type", this.toString());	
			
			for (var item : * in currentJSONObj){
				
				if(item == "_attachments"){
					for(var att : * in currentJSONObj[item]){
						var cont:String = att;
						
						if(cont.lastIndexOf(".ogg") >= 1){
							Logger.tracing("Play OGG File", this.toString());
							contentURL = cont;
							currentCT = "ogg";
							loadOGGFile();
							break;
						}else if(cont.indexOf(".mp3") >= 1){
							Logger.tracing("Play Mp3 File", this.toString());
							contentURL = cont;
							currentCT = "mp3"
							loadMp3File();
							break;
						}
						
					}
				}
				
			}
			
		}
		
		private function loadmp4():void{
			
			var connect_nc:NetConnection = new NetConnection();
			connect_nc.connect(null);
			var stream_ns:NetStream = new NetStream(connect_nc);
			var video : Video = new Video();
			video.attachNetStream(stream_ns);
			
			stream_ns.play("D:\_Random\video.mp4");
		}
		
		private function loadMp3File():void{
			
			sound.addEventListener(Event.COMPLETE, onLoadComplete_mp3);
			sound.addEventListener(SampleDataEvent.SAMPLE_DATA, onSoundData);
			sound.addEventListener(IOErrorEvent.IO_ERROR, onIOError_mp3);
			//sound.load(new URLRequest("http://localserver:5984/musiclib/737fa73795ac1bff9f3c1145ccacd16c/04-gentleman_reg--when_heroes_change_professions-oma.mp3"));
			sound.load(new URLRequest("http://aludose/" + currentJSONObj["_id"] + "/" + contentURL));
			soundChannel = sound.play();
			
		}
		
		private function onSoundData(event : SampleDataEvent):void{
			trace(event);
		}
		
		private function onLoadComplete_mp3(event : Event):void{
			Logger.tracing("mp3 file complete", this.toString());
		}
		
		private function onIOError_mp3(event : IOErrorEvent):void{
			
		}
		
		private function loadOGGFile():void{	
			decoder.addEventListener(Event.INIT, onDecoderInit);
			/*decoder.addEventListener(IOErrorEvent.IO_ERROR, onDecoderIOError);
			decoder.addEventListener(Event.COMPLETE, onComplete);
			
			soundChannel.addEventListener(Event.SOUND_COMPLETE, onComplete);*/
			
			var oggStream : URLStream = new URLStream();
			
			decoder.load(oggStream, OggVorbisDecoder, BUFFER_SIZE);
			oggStream.load(new URLRequest("http://aludose/" + currentJSONObj["_id"] + "/" + contentURL));
			Logger.tracing("Play File: " + "http://aludose/" + currentJSONObj["_id"] + "/" + contentURL, this.toString());
		}
		
		private function onComplete(event : Event):void{
			Logger.tracing("OGG File Complete: " + event + " || Target: " + event.currentTarget, this.toString());
			clearSound();
		}
		
		private function onDecoderInit(event : Event):void{
			soundChannel = decoder.play();
			Logger.tracing("Init OGG Decoder", this.toString());
		}
		
		private function onDecoderIOError(event : Event):void{
			Logger.tracing("IO Decoder Error", this.toString());	
		}
		
		public function pause():void{
			soundChannel.stop();
		}
		
		public function stop():void{			
			clearSound();
		}
		
		public function next():void{
			setCurrentJSONObj(currentPlaylist.getNextItem());
		}
		
		public function prev():void{
			setCurrentJSONObj(currentPlaylist.getPrevItem() );
		}
		
		private function onSoundComplete(event : Event):void{
				
		}
		
		public function toString():String{ return "cc.varga.mvc.models.SoundModel"}
	}
	
}