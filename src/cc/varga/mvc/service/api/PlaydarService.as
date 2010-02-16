/*
* This source is heavily based on Lucas Hrabovsky (imlucas) as3playdar.
* The Original Source can be found at http://github.com/imlucas/as3playdar/blob/master/src/org/playdar/Playdar.as
*/
package cc.varga.mvc.service.api {
	import cc.varga.mvc.service.ISearchService;
	import cc.varga.mvc.service.ISoundService;
	import cc.varga.utils.Logger;
	
	import com.adobe.serialization.json.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
    
	public class Playdar extends Sprite implements ISearchService, ISoundService{

		public var sounds:Object = {};
        public var channels:Object = {};
        public var pauses:Object = {};
        public var state:String = "";
        
        public var currentSid:String;
        
        [Bindable] public var percentPlayed:Number = 0;
        private var timer:Timer;
        
		public function Playdar(){
			state = "ready";
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER, function(t:TimerEvent):void{
				var channel:SoundChannel = SoundChannel(channels[currentSid]);
				var sound:Sound = Sound(sounds[currentSid]);
				if(state=="playing"){
					percentPlayed = channel.position / sound.length;
					if(percentPlayed > .98){
						dispatchEvent(new Event("complete"));
					}
				}
			});
			timer.start();
			
		}
		public function playOrPause(sid:String):void{
			if(state == "paused"){
				resume(sid);
			}
			else if(state == "playing"){
				pause(sid);
			}
			else{
				play(sid);
			}
		}
		
		
		public function resume(sid:String):void{
			channels[sid] = Sound(sounds[sid]).play(pauses[sid]);
			state = "playing";
		}
		
		public function play(sid:String):void{
			SoundMixer.stopAll();
			currentSid = sid;
			Logger.log('Play called for sid '+sid,this.toString());
		    var snd:Sound = new Sound();
		    snd.load(new URLRequest('http://localhost:60210/sid/'+sid));
		    channels[sid] = snd.play();
		    sounds[sid] = snd;
		    state = "playing";
		}

    public function playMP3(uid : String) : void {
      play(uid);
    }

    public function playOGG(uid : String) : void {
    }
		
		public function pause(sid:String):void{
		    pauses[sid] = SoundChannel(channels[sid]).position;
		    stop(sid);
		    state = "paused";
		}
		
		public function stop(sid:String):void{
			state = "stopped";
			SoundChannel(channels[sid]).stop();
		}
		
		public function status(onSuccess:Function, onError:Function):void{
			getData(
			    'http://localhost:60210/api/?method=stat', 
			    function(r:Object):void{
			        onSuccess(r);
			    },
			    function(e:Error):void{
			    	onError(e);
			    }
			);
		}
		
		private function poll(qid:String, retry:int, onSuccess:Function):void{
			getData(
                'http://localhost:60210/api/?method=get_results&qid='+qid, 
                function(r:Object):void{
                	Logger.log('Got poll result',this.toString());
                    if(r.solved){
                    	Logger.log('Solved',this.toString());
                    	onSuccess(r);
                    }
                    else{
                    	Logger.log('Not Solved',this.toString());
                    	setTimeout(
	                    	function():void{
		                    	retry = retry+1;
		                    	Logger.log('polling',this.toString());
		                    	poll(qid, retry, onSuccess);
		                    }, 
	                    	250
                    	);
                    }
                },
                function(e:Error):void{
                   
                }
            );
		}
		
		public function resolve(artist:String, track:String, onSuccess:Function, onError:Function):void{
			Logger.log('Attempting to resolve Artist: '+artist+', Track: '+track,this.toString());
			getData(
                'http://localhost:60210/api/?method=resolve&artist='+artist+'&track='+track, 
                function(r:Object):void{
                    poll(r.qid, 0, onSuccess);
                },
                function(e:Error):void{
                    onError(e);
                }
            );
		}
		
		public function getData(url:String, onSuccess:Function, onError:Function=null, requestParams:Object=null){
			var request:URLRequest;

            request = new URLRequest(url);
            if(requestParams!=null){
                request.data = requestParams as URLVariables;
            }
            var loader:URLLoader = new URLLoader();
            loader.addEventListener(
                IOErrorEvent.IO_ERROR, 
                function(e:IOErrorEvent):void{
                    var error:Error = new Error("Couldnt parse XML.  Incorrect username/password or couldnt talk to foursquare :(");
                    if(onError != null){
                        onError(error);
                    }
                    else{
                        //mx.controls.Alert.show(error.message, "error");
                    }
                }
            );
            loader.addEventListener(
                Event.COMPLETE, 
                function(e:Event):void{
                    var loader:URLLoader = e.target as URLLoader;
                    try{
                        var parsed:Object = JSON.decode(loader.data);
                    }
                    catch(e:Error){

                        //mx.controls.Alert.show(e.message+"\n\nStack:\n"+e.getStackTrace(), 'XML Parse Error :(');
                    }
                    onSuccess(parsed);
                }
            );
            loader.load(request);
		}
	}
}
