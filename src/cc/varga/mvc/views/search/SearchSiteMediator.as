package cc.varga.mvc.views.search
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.api.jukebox.JukeboxAPI;
	import cc.varga.api.jukebox.JukeboxAPIEvent;
	import com.adobe.serialization.json.JSON;
	
	public class SearchSiteMediator extends Mediator
	{
		
		[Inject]
		public var view : SearchSite;
		
		private var service : JukeboxAPI = new JukeboxAPI();
		
		public function SearchSiteMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
			service.addEventListener(JukeboxAPIEvent.SEARCH_RESULT, drawResult);
			service.addEventListener(JukeboxAPIEvent.BLIP_FEED_RESULT, drawResult);			
			service.addEventListener(JukeboxAPIEvent.DOWNLAD_COMPLETE, onDownloadComplete);
			service.addEventListener(JukeboxAPIEvent.FAULT, onFaultService);
			
			eventMap.mapListener(view, SearchSiteEvent.SEARCH_CLICKED, onSearchedClicked);
			eventMap.mapListener(view, SearchSiteEvent.LOAD_BLIP_FM_FEED, onLoadBlipFmFeed);
			
		}
		
		private function onFaultService(event:JukeboxAPIEvent):void{
			trace("OnFaultService: " + event.fault.message);
		}
		
		private function onDownloadComplete(event:JukeboxAPIEvent):void{
			trace(event);
		}
		
		private function onDownloadSong(event : SearchSiteEvent):void{
			service.download({doc: JSON.encode(event.jsonObj)});
		}
		
		private function onLoadBlipFmFeed(event : SearchSiteEvent):void{
			service.loadBlipFMFeed(event.blipFM_Nick);
		}
		
		private function onSearchedClicked(event : SearchSiteEvent):void{
			service.search({query: event.search_query, limit:20});
		}
		
		private function drawResult(event : JukeboxAPIEvent):void{
			
			var searchEvent : SearchSiteEvent = new SearchSiteEvent(SearchSiteEvent.DRAW_RESULT);
			searchEvent.resultJSON = event.result;
			dispatch(searchEvent);
	
		}
		
		
	}
}