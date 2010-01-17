package cc.varga.mvc.service
{
	import cc.varga.mvc.views.player.PlayerEvent;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import org.robotlegs.mvcs.*;
	import com.automatastudios.audio.audiodecoder.AudioDecoder;
	
	import cc.varga.mvc.service.*;
	
	public class PlayMultimediaObjService extends Mediator
	{
		
		[Inject]
		public var playerEvent : PlayerEvent;
		
		private var soundObj : Sound;
		private var soundChannel : SoundChannel;
		private var oggDecoder : AudioDecoder;
		
		public function PlayMultimediaObjService()
		{
			super();
		}
		
		public function playObject(item:Object):void{
			
		}
		
		private function checkFileType():void{
			
		}
		
	}
}