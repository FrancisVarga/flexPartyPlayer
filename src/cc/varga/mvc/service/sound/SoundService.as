package cc.varga.mvc.service.sound
{
	import org.robotlegs.mvcs.*;
	import com.automatastudios.audio.audiodecoder.AudioDecoder;
	import flash.media.SoundChannel;
	import flash.media.Sound;
	
	public class SoundService extends Mediator
	{
		
		private var oggDecoder : AudioDecoder = new AudioDecoder();
		private var soundChannel : SoundChannel = new SoundChannel();
		private var mp3Decoder : Sound = new Sound();
		
		public function SoundService()
		{
			super();
		}
		
	}
}