package  {
	
	// Week 2 start file -- use this only id needed
	
	
	import flash.display.MovieClip;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class MainTimer extends MovieClip {
		// Init vars for class 
		private var currentMin:int;
		private var currentSec:int;
		// create a one second timer from Flash's Timer class
		private var oneSecTimer:Timer = new Timer(1000,1);

		public var timerHasStopped:Boolean = false;
		
		public function MainTimer() {
			// constructor code
			trace("the main timer is here");
			currentMin = 1;
			currentSec = 5;
			
			minBox.text = String(currentMin);
			if(currentSec < 10){
				secBox.text = "0" + String(currentSec); //concatenate with a leading zero
			}else{
				secBox.text = String(currentSec);
			} //end if
			
			oneSecTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			oneSecTimer.start();

		} // end public function MainTimer
		
		private function onTimerComplete(event:TimerEvent):void{

			currentSec = currentSec - 1;

			if (currentSec < 0){
				currentSec = 59;
				currentMin -=  1;
			} // end if
			if (currentMin < 0){
				currentMin =  0;
				currentSec =  0;
				timerHasStopped = true;
			}else{
				oneSecTimer.start();
			} // end else
			
			// update our display
			minBox.text = String(currentMin);
			secBox.text = String(currentSec);
			//Adjust display for seconds less than 10
			if (currentSec < 10){
				secBox.text = "0" + String(currentSec);
			} // end if

		}//ends onTimerComplete
		
		public function resetTimer():void{
			//update our display
			currentMin = 1;
			currentSec = 5;
			minBox.text = String(currentMin);
			secBox.text = String(currentSec);
			//Adjust display for seconfs less than 10
			if (currentSec < 10){
				secBox.text = "0" + String (currentSec);
			}//end if
			timerHasStopped = false;
			oneSecTimer.start();
		}//end function
		
	} // public class MainTimer
	
} //end package
