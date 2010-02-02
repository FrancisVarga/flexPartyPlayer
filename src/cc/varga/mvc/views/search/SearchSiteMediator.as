package cc.varga.mvc.views.search
{
	import org.robotlegs.mvcs.Mediator;
	import cc.varga.api.jukebox.services.JukeboxService;
	import cc.varga.api.jukebox.JukeboxAPIEvent;
  import cc.varga.api.jukebox.JukeboxAPIVO;
	import cc.varga.api.jukebox.IRESTful;
	import com.adobe.serialization.json.JSON;
  import mx.controls.Alert;
	
	public class SearchSiteMediator extends Mediator
	{
		
		[Inject]
		public var view : SearchSite;
		
		private var searchService : IRESTful; 
		private var blipService : IRESTful; 
		
		public function SearchSiteMediator()
		{
			super();
		}
		
		override public function onRegister() : void{
			
//			service.addEventListener(JukeboxAPIEvent.SEARCH_RESULT, drawResult);
//			service.addEventListener(JukeboxAPIEvent.BLIP_FEED_RESULT, drawResult);			
//			service.addEventListener(JukeboxAPIEvent.DOWNLAD_COMPLETE, onDownloadComplete);
			
			eventMap.mapListener(view, SearchSiteEvent.SEARCH_CLICKED, onSearchedClicked);
			eventMap.mapListener(view, SearchSiteEvent.LOAD_BLIP_FM_FEED, onLoadBlipFmFeed);
			
		}
		
		private function onFaultService(vo: JukeboxAPIVO):void{
			Alert.show("OnFaultService: " + vo);
		}
		
		private function onDownloadComplete(event:JukeboxAPIEvent):void{
			trace(event);
		}
		
		private function onDownloadSong(event : SearchSiteEvent):void{
			//service.download({doc: JSON.encode(event.jsonObj)});
		}
		
		private function onLoadBlipFmFeed(event : SearchSiteEvent):void{
      var vo:JukeboxAPIVO = new JukeboxAPIVO({type: JukeboxAPIVO.BLIP_TYPE, path: [event.blipFM_Nick]});
      createAndRegisterService(vo,onFaultService,drawResult).fetch();
		}
		
		private function onSearchedClicked(event : SearchSiteEvent):void {
      var searchVO:JukeboxAPIVO = new JukeboxAPIVO({type: JukeboxAPIVO.SEARCH_TYPE, data: {query: event.search_query, limit: 20}});
      createAndRegisterService(searchVO,onFaultService,drawResult).post();
		}

    private function createAndRegisterService(vo: JukeboxAPIVO, fault: Function, complete: Function) : IRESTful {
      var service:IRESTful = JukeboxService.createService(vo);
      service.faultCallback = fault;
      service.completeCallback = complete;
      return service;
    }

		private function drawResult(vo: JukeboxAPIVO):void{
			var searchEvent : SearchSiteEvent = new SearchSiteEvent(SearchSiteEvent.DRAW_RESULT);
			searchEvent.result = vo.data;
			dispatch(searchEvent);
		}
		
		
	}
}
