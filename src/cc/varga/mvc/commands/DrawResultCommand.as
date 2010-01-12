package cc.varga.mvc.commands
{
	import org.robotlegs.mvcs.Command;
	import cc.varga.mvc.ApplicationStateList;
	import mx.events.StateChangeEvent;
	import cc.varga.mvc.views.search.SearchSiteEvent;
	import cc.varga.mvc.views.result.ResultItem;
	import mx.events.FlexEvent;
	import mx.controls.Alert;
	import cc.varga.mvc.service.*;
	
	public class DrawResultCommand extends Command
	{
		
		[Inject]
		public var event : SearchSiteEvent;
		
		[Inject]
		public var stageService : StateChangerService;
		
		private var resultArray : Array;
		private var mainView : Jukebox;
		private var currentPos : uint = 0;
		
		public function DrawResultCommand(){ super(); }
		
		override public function execute() : void{
		
			mainView = contextView as Jukebox;
			
			mainView.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, onChange);
			mainView.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGING, onChanging);
			
			stageService.switchToStage(ApplicationStateList.RESULT_STATE);
			
		}
		
		private function onChange(stateEvent : StateChangeEvent):void{
			
			resultArray = event.resultJSON as Array;
			drawResults();
				
		}
		
		private function drawResults(event : * = null):void{
			
			if(resultArray.length > 0){	
				drawItem(resultArray.shift());
			}
			
		}
		
		private function drawItem(jsonItem : Object):void{
			
			var item : ResultItem = new ResultItem();
			item.jsonObj = event.resultJSON[currentPos];
			item.position = currentPos;
			item.addEventListener(FlexEvent.CREATION_COMPLETE, drawResults);
			mainView.listContainer.addElement( item );
			
		}
		
		private function onChanging(event : StateChangeEvent):void{
			trace("State Changing");	
		}
		
	}
}