package cc.varga.mvc.service
{
	import cc.varga.mvc.*;
	
	import flash.display.DisplayObject;
	
	import org.robotlegs.mvcs.Actor;
	
	public class StateChangerService extends Actor
	{
		
		[Inject]
		public var contextView : Jukebox;
		
		private var stateList : Array = ApplicationStateList.stateList;
		private var currentPos : int;		
		
		public function StateChangerService()
		{
			super();
		}
		
		public function switchToStage(stageName : String):void{
		
			getCurrentPostion(stageName);
			contextView.currentState = stageName;
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