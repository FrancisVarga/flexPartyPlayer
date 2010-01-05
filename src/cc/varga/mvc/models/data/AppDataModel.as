package cc.varga.mvc.models.data
{
	import org.robotlegs.mvcs.Actor;
	import flash.utils.Dictionary;
	
	public class AppDataModel extends Actor
	{
		
		public var artistList : Dictionary = new Dictionary;
		
		public function AppDataModel()
		{
			super();
		}
		
	}
}