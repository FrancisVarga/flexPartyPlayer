package cc.varga.mvc.commands.data
{
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	import cc.varga.utils.logging.Logger;
	import org.robotlegs.mvcs.Command;
	
	public class LoadArtistDataCommand extends Command
	{
		public function LoadArtistDataCommand()
		{
			super();
		}
		
		override public function execute() : void{
			
			Logger.tracing("load artist command", this.toString());
			
			var service : HTTPService = new HTTPService();
			service.url = "http://aludose/web/artists.json";
			service.method = "GET";
			service.contentType = "text";
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
			service.send();
			
		}
		
		private function onFault(event : FaultEvent):void{
			
			Logger.tracing("cant load arsist list", this.toString());
			
		}
		
		private function onResult(event : ResultEvent):void{
			
			Logger.tracing("Get Artist", this.toString());
			
		}
		
		public function toString():String{
			return "cc.varga.mvc.commands.data.LoadArtistDataCommand";
		}
		
	}
}