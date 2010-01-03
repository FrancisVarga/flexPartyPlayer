package cc.varga.mvc.events.sound
{
	import flash.events.Event;
	
	public class SoundEvent extends Event
	{
		
		public static const SOUND_END : String = "sound_end";
		public static const SOUND_START : String = "sound_start";
		
		public function SoundEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}