package cc.varga.mvc.service
{
	import cc.varga.mvc.views.player.PlayerEvent;
  import flash.events.Event;	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import org.robotlegs.mvcs.*;
	
	import cc.varga.mvc.service.*;
	
	public class DisorderStylePlayer extends Actor implements IPlayerService
	{
	  public static const CONTINUOUS : String = "continuous";
// MAYBE LATER    public static const FADE_IN = "fading_in";
    public static const FADE_OUT : String = "fading_out";
    public static const STALLED : String = "stalled";

	  [Inject]
    public var playdar : ISoundService;

    private var _state : String = STALLED;


    private var _current : String;
    private var _beforeNext : Function;



		public function DisorderStylePlayer()
		{
			super();
		}

		public function set state(newState : String) : void{
      if (newState != _state) {
        switch(newState) {
          case "continuous":
            if(_state == "stalled") {
              if(hasCallback) {
                _beforeNext();
              }
              else {
                throw new Error("U Failed!");
              }
            }
          break;
          case "stalled":
            playdar.stop();
          break;
        }
      }
    }

    public function play(id : String) : void { 
      if(hasCallback) {
        playdar.play(id, _beforeNext, function() : void { trace("U FAILED"); });
      }
      else {
        trace("AARG");
      }
    }

    public function get state() : String {
      return _state;
    }

    public function get hasCallback() : Boolean {
      return _beforeNext != null;
    }

    public function set beforeNext(callback : Function) : void {
      _beforeNext = callback;
    }
  }
}
