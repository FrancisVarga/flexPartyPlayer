package cc.varga.mvc.models.data
{
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	public class AppDataModel extends Actor
	{
		[Bindable]
		public var artistList : Array = new Array();
		
		[Bindable]
		public var albumList : Array = new Array();
		
		public function AppDataModel()
		{
			super();
		}
		
	}
}