package  {
	
	import flash.display.MovieClip;
	import CollisionObject;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Player extends CollisionObject {
		private var xMovement:Number;
		public var isAttacking:Boolean;
		private var attackTimer:Timer = new Timer (500, 1);
		
		public function Player() {
			// constructor code
			trace("I am a player");
			xMovement = 0;
			isAttacking = false;
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler );
		}//end constructor
		
		private function enterFrameHandler (event:Event) :void {
			this.x += xMovement;
		}// end function enterFrameHandler
		
		public function attack(){
			isAttacking = true;
			this.gotoAndStop("attack"); //move down player timeline
			attackTimer.addEventListener(TimerEvent.TIMER_COMPLETE, doneAttacking);
			attackTimer.start();
			}//end funtion
			
			public function startJumping(){
				if (isJumping == false) {
					isJumping = true;
					this.gotoAndStop("jump");
					downwardVelocity = -20;
				}//end if
			}//end function
			
			public function doneAttacking (event:TimerEvent):void{
				isAttacking = false;
				this.gotoAndStop("stop");
			}
		
		
		public function moveLeft () :void {
			xMovement = -7;
			this.scaleX = -1;
			this.gotoAndStop("run");
			isRunning = true;
		}// end function moveLeft
		
		public function moveRight () :void {
			xMovement = 7;
			this.scaleX = 1;
			this.gotoAndStop("run");
			isRunning = true;
		}// end function moveRight
		
		public function standStill() :void {
			xMovement = 0;
			isRunning = false;
		}// end function standStill
		
		override public function positionOnLanding() {
			isJumping = false;
			if (isAttacking == true ) {
				//do nothing
			} else if (isRunning == true) {
				this.gotoAndStop("run");
			}else{
				this.gotoAndStop("stop");
			}//end else
		}//end override function
	}// end class
	

}//end package



