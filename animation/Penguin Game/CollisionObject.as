package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class CollisionObject extends MovieClip{

		protected var downwardVelocity:Number; 
		protected var isRunning:Boolean;
		protected var isJumping:Boolean;
		
		public function CollisionObject() {
			// constructor code
			trace ("i am any object that collides with the boundary" );
			
			//initialize velocity to zero and object is not running
			downwardVelocity = 0;
			isRunning = false;
			// Add an event listener for when Flash playback head enters a frame ( 30 fps)
			addEventListener(Event.ENTER_FRAME,handleEnterFrame);
			
		} // end constructor function
		
		// create function that takes care of what we want to happen 33 time per second
		private function handleEnterFrame(event:Event):void{
			//update by increasing the value of the velocity  variable
			downwardVelocity += 2;
			//update the y-position of the object according to an increasing velocity (move down faster)
			this.y += downwardVelocity; // the use of "this" refers to whatever object inherits
		} //end private function handleEnterFrame
		
		public function incrementUpward(){
			//increment the y up until not colliding
			this.y -= 0.1;			
		} // end public function incrementUpward() 

		public function keepOnBoundary(){
			downwardVelocity = 0; // stops object falling			
			positionOnLanding();			
		} //end public function keepOnBoundary() 
		
		public function positionOnLanding (){			
			// do nothing here -- let this be overridden by the subclasses			
		} // end public function positionOnLanding()

	} // end class
	
} // end package
