/*
* This source is heavily based on Lucas Hrabovsky (imlucas) as3playdar.
* The Original Source can be found at http://github.com/imlucas/as3playdar/blob/master/src/org/playdar/Playdar.as
*/
package cc.varga.mvc.service.api {
	import cc.varga.mvc.service.ISearchService;
	import cc.varga.mvc.service.ISoundService;
	import cc.varga.utils.Logger;
  import org.playdar.Playdar;
  import org.robotlegs.mvcs.Actor;
  import cc.varga.mvc.views.player.PlayerEvent;
  import flash.events.Event;
	
    
	public class PlaydarService extends Actor implements ISearchService, ISoundService {

    private var playdar : Playdar;
    private var _currentlyPlaying : String;
    private var _onComplete : Function;
    private var _onError : Function;
    public function PlaydarService() {
      playdar = new Playdar();
        playdar.addEventListener(Event.COMPLETE,onSongComplete);
      super();
    }

    public function resolve(artist : String,track : String, onSuccess : Function, onError : Function) : void {
      playdar.resolve(artist, track, onSuccess, onError);
    }

    public function play(uid : String, onComplete : Function, onError : Function) : void {
      _onComplete = onComplete;
      _onError = onError;
      playdar.play(uid);
      _currentlyPlaying = uid;
    }

    public function stop() : void {
      playdar.stop(_currentlyPlaying);
    }

    private function onSongComplete(event : Event) : void {
      playdar.stop(_currentlyPlaying);
      if (_onComplete != null) {
        _onComplete();
      }
    }

    private function onError(event : Event) : void {
      trace("Something failed: "+event.toString());
    }


    public function playOGG(uid : String) : void {
    }
  }
		
}
