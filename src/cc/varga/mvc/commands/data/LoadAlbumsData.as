package cc.varga.mvc.commands.data
{
	import cc.varga.mvc.models.data.AppDataModel;
	import cc.varga.utils.logging.Logger;
	
	import com.adobe.serialization.json.JSON;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadAlbumsData extends Command
	{
		[Inject]
		public var model : AppDataModel;
		
		public function LoadAlbumsData()
		{
			super();
		}
		
		override public function execute() : void{
			
			Logger.tracing("execute", this.toString());
			
			var httpServ : HTTPService = new HTTPService();
			httpServ.url = "http://aludose/web/albums.json";
			httpServ.addEventListener(FaultEvent.FAULT, onFault);
			httpServ.addEventListener(ResultEvent.RESULT, onResult);
			httpServ.send();
			
		}
		
		private function onFault(event : FaultEvent):void{
			Logger.tracing("Fault: " + event .message, this.toString());
		}
		
		private function onResult(event : ResultEvent):void{
			
			Logger.tracing("Result", this.toString());
			model.albumList = JSON.decode(event.result as String) as Array;
			
		}
		
		public function toString():String{return "cc.varga.mvc.commands.data.LoadAlbumsData"; }
		
	}
}