package cc.varga.mvc.service
{
	import cc.varga.mvc.*;
	import cc.varga.utils.Logger;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import flashx.textLayout.tlf_internal;
	
	import mx.events.StateChangeEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class StateChangerService extends Actor
	{
		
		[Inject]
		public var contextView : Jukebox;
		
		private var stateList : Array = ApplicationStateList.stateList;
		private var currentPos : int;
		
		public function StateChangerService(){ super(); }
	
		public function switchToStage(stageName : String, callBack : Function = null):void{
		
			getCurrentPostion(stageName);
			contextView.currentState = stageName;
			if(callBack != null){
				callBack();
			}
		}
		
		public function switchToLeft():void{
			currentPos--;
			
			if(currentPos <= 0){
				currentPos = 0;
			}
			
			contextView.currentState = stateList[currentPos];
		}
		
		public function switchToRight():void{
			
			currentPos++;
			
			if(currentPos >= stateList.length){
				currentPos = stateList.length;
			}
			
			contextView.currentState = stateList[currentPos];
			
		}
		
		private function getCurrentPostion(stageName:String):void{
			for(var i:uint=0; i < stateList.length; i++){
				if(stageName == stateList[i]){
					currentPos = i;
				}
			}
		}		
	}
}
