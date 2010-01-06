package cc.varga.mvc.commands.data
{
	import cc.varga.mvc.models.data.AppDataModel;
	import cc.varga.utils.logging.Logger;
	
	import com.adobe.serialization.json.JSON;
	
	import flash.utils.Dictionary;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	import cc.varga.mvc.services.KeyboardControl;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadArtistDataCommand extends Command
	{
		
		[Inject]
		public var model : AppDataModel;
		
    [Inject]
    public var keyboard : KeyboardControl;

		public function LoadArtistDataCommand()
		{
			super();
		}
		
		override public function execute() : void{
      keyboard.listen();
			Logger.tracing("load artist command", this.toString());
			
			var service : HTTPService = new HTTPService();
			service.url = "http://aludose/web/artists.json";
			service.method = "GET";
			service.contentType = "text";
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
			//service.send();
			
		}
		
		private function onFault(event : FaultEvent):void{
			
			Logger.tracing("cant load arsist list", this.toString());
			Alert.show("Something is wrong hit the developer!", "#LADC 1001");
			
		}
		
		private function onResult(event : ResultEvent):void{
			
			//Logger.tracing("Get Artist: " + event.result.toString(), this.toString());
			//model.artistList = JSON.decode(event.result.toString()) as Dictionary;
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.commands.data.LoadArtistDataCommand";
		}
		
	}
}
