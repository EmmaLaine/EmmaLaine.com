package  {
	
	import CollisionObject;
	import flash.events.Event;
	
	public class Enemy extends CollisionObject {
		private var enemyAboutToDie:Boolean;
		private var xMovement:Number ;
		private var speedVar:int;
		public var enemyIsAttacking:Boolean;
				
		public function Enemy(speed:int) {
			// constructor code
			trace("I am an enemy");
			enemyAboutToDie = false;
			enemyIsAttacking = false;
			speedVar = speed;
			xMovement = speedVar;
			//listen for ENTER_FRAME event
			addEventListener(Event.ENTER_FRAME, enterFrameHandler );
		}//end constructor function
		
		private function enterFrameHandler (e:Event):void {
			this.x -= xMovement; //this moves enemy across the stage to the left
		} // end function enterFrameHandler
		
		public function makeEnemyDie() {
			this.gotoAndStop( "dead" )
			enemyAboutToDie = true;
			xMovement = 0;
		}//end function
		public function makeEnemyAttack() {
			this.gotoAndStop( "attack" )
			enemyIsAttacking = true;
			xMovement = 0;
		}//end function
		public function makeEnemyStopAttacking() {
			this.gotoAndStop( "stop" )
			enemyIsAttacking = false;
			xMovement = speedVar;
		}//end function
		
		override public function positionOnLanding() { //use this to establish pose on land
		if (enemyAboutToDie == true) {
			this.gotoAndStop("dead");
		} else if (enemyIsAttacking == true ) {
			this.gotoAndStop("attack");
		} else {
			this.gotoAndStop("run");
		}//end else
		//this sends the movieClip instance to the "run" position on its timeline
		}//end function position
	}//end class
	
}//end package
