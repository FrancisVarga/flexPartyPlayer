package cc.varga.mvc.commands
{
	import org.robotlegs.mvcs.Command;
	import cc.varga.mvc.ApplicationStateList;
	import mx.events.StateChangeEvent;
	import cc.varga.mvc.views.search.SearchSiteEvent;
	import cc.varga.mvc.views.result.ResultItem;
	import cc.varga.mvc.views.result.ResultItemEvent;

	import mx.events.FlexEvent;
	import mx.controls.Alert;
	import cc.varga.mvc.service.*;
  import spark.components.Label;
  import mx.collections.ArrayCollection;
  import cc.varga.utils.Logger;
	
	public class DrawResultCommand extends Command
	{
		
		[Inject]
		public var event : SearchSiteEvent;

    [Inject]
		public var stageService : StateChangerService;
		
		private var resultArray : ArrayCollection;
		private var mainView : Jukebox;
		private var currentPos : uint = 0;
		
		public function DrawResultCommand(){ super(); }
		
		override public function execute() : void{
		
			mainView = contextView as Jukebox;
			
			//mainView.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, onChange);
//			mainView.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGING, onChanging);
			
			stageService.switchToStage(ApplicationStateList.RESULT_STATE, drawResults);
    }
			
		
		private function onChange(stateEvent : StateChangeEvent):void{
//			resultArray = ;
		}
		
		private function drawResults(invocationEvent: * = null):void{
      Logger.log("passing Results on","Draw Result Command");
      var item : ResultItem = new ResultItem();
      item.dg.dataProvider = new ArrayCollection(event.result);
      mainView.listContainer.removeAllElements();
      mainView.listContainer.addElement( item );
      
		//	if(resultArray.length > 0){	
		//
		//	var item : ResultItem = new ResultItem();
		//	item.results = resultArray;
//  //    trace("Item: "+item.jsonObj.track[0]);
 // //    item.currentState = "playdar";
		//	item.position = currentPos;
//	//		item.addEventListener(FlexEvent.CREATION_COMPLETE, drawResults);
		//	mainView.listContainer.addElement( item );
    //  }
    //  else {
    //    trace("Nothing happens");
    //  }
		}
		
		private function onChanging(event : StateChangeEvent):void{
			
		}
		
	}
}
