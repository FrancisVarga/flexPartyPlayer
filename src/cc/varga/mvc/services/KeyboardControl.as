package cc.varga.mvc.services
{
  import cc.varga.mvc.events.player.PlayerEvent;
  import cc.varga.mvc.models.playlist.PlaylistModel;
  import cc.varga.utils.logging.Logger;

  import com.automatastudios.audio.audiodecoder.AudioDecoder;
  import com.automatastudios.audio.audiodecoder.decoders.OggVorbisDecoder;

  import flash.events.KeyboardEvent;
  import flash.events.MouseEvent;
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


  public class AppMediator extends Mediator
  {
  

    public function listen() :void{

     contextView.addEventListener(MouseEvent.CLICK, clickHandler);

     contextView.addEventListener(KeyboardEvent.KEY_DOWN,keyPressed);
    }

    private function clickHandler(event:MouseEvent):void {

      //stage.focus = contextView;

    }



    private function keyPressed(evt:KeyboardEvent):void{

      if(evt.ctrlKey && evt.keyCode == 65)

        trace("CTRL A is pressed");

      if(evt.ctrlKey && evt.keyCode == 66)

        trace("CTRL B is pressed");

    }
  }
}
