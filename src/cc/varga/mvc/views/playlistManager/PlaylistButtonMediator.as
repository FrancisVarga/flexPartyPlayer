package cc.varga.mvc.views.playlistManager
{
	import cc.varga.mvc.events.playlist.PlaylistEvent;
	import cc.varga.utils.logging.Logger;
	
	import com.adobe.serialization.json.JSON;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class PlaylistButtonMediator extends Mediator
	{
		
		[Inject]
		public var view : PlaylistButton;
		
		public function PlaylistButtonMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			eventMap.mapListener(view, PlaylistEvent.GET_ALBUM, getAlbum); 
			
		}
		
		private function getAlbum(event : PlaylistEvent):void{
		
			Logger.tracing("GET ALBUM", this.toString());
			
			var http : HTTPService = new HTTPService();
			http.addEventListener(FaultEvent.FAULT, onResult);
			http.addEventListener(ResultEvent.RESULT, onResult);
			http.url = "http://aludose/web/albums/" + event.albumID + "/tracks.json";
			http.send();
			
		}
		
		private function onFault(event : FaultEvent):void{
			Logger.tracing("onFault: " + event.message, this.toString());
		}
		
		private function onResult(event : ResultEvent):void{
			Logger.tracing("onResult: "	+ event.result, this.toString());
			
			var playlist : Object = JSON.decode(event.result as String);
			
		}
		
		public function toString():String{return "cc.varga.mvc.views.playlistManager.PlaylistButtonMediator"; }
		
	}
}