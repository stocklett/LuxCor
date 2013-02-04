package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Player extends Entity
	{
		public var lightLevel:int;
		public var facing:String;
		public var heartRate:int;
		public var damage:int;
		public var inventory:Array;
		public static const speed:int = 4;
		public var sprPlayer:Spritemap = new Spritemap(Assets.PLAYER, 48, 48);
		
		public var healTime:Number = 0;
		public const HEAL_RATE:int = 5;
		
		public function Player(_x:Number, _y:Number)
		{
			setAnimations();
			graphic = sprPlayer;
			//sprPlayer.scale = 2;
			layer = 0;
			x = _x;
			y = _y;
			lightLevel = 0;
			facing = Global.DOWN;
			heartRate = 60;
			damage = 0;
			inventory = new Array();
			type = "player";
			
			Input.define("Down", Key.S, Key.DOWN);
			Input.define("Left", Key.A, Key.LEFT);
			Input.define("Right", Key.D, Key.RIGHT);
			Input.define("Up", Key.W, Key.UP);
			Input.define("Action", Key.ENTER, Key.X);
			setHitbox(30, 20, -8, -28);
		}
		
		private function setAnimations():void {
			var fspeed:int = 6;
			// lightLevel == 0
			sprPlayer.add("walk_D0", [1, 0, 2, 0], fspeed, true);
			sprPlayer.add("walk_L0", [4, 3, 5, 3], fspeed, true);
			sprPlayer.add("walk_R0", [7, 6, 8, 6], fspeed, true);
			sprPlayer.add("walk_U0", [10, 9, 11, 9], fspeed, true);
			sprPlayer.add("idle_D0", [0], 0, false);
			sprPlayer.add("idle_L0", [3], 0, false);
			sprPlayer.add("idle_R0", [6], 0, false);
			sprPlayer.add("idle_U0", [9], 0, false);
			sprPlayer.add("grab_D0", [36, 0], 2, false);
			sprPlayer.add("grab_L0", [37, 3], 2, false);
			sprPlayer.add("grab_R0", [38, 6], 2, false);
			sprPlayer.add("grab_U0", [39, 9], 2, false);
			// lightLevel == 1
			sprPlayer.add("walk_D1", [13, 12, 14, 12], fspeed, true);
			sprPlayer.add("walk_L1", [16, 15, 17, 15], fspeed, true);
			sprPlayer.add("walk_R1", [19, 18, 20, 18], fspeed, true);
			sprPlayer.add("walk_U1", [22, 21, 23, 21], fspeed, true);
			sprPlayer.add("idle_D1", [12], 0, false);
			sprPlayer.add("idle_L1", [15], 0, false);
			sprPlayer.add("idle_R1", [18], 0, false);
			sprPlayer.add("idle_U1", [21], 0, false);
			sprPlayer.add("grab_D1", [40, 12], 2, false);
			sprPlayer.add("grab_L1", [41, 15], 2, false);
			sprPlayer.add("grab_R1", [42, 18], 2, false);
			sprPlayer.add("grab_U1", [43, 21], 2, false);
			// lightLevel == 2
			sprPlayer.add("walk_D2", [25, 24, 26, 24], fspeed, true);
			sprPlayer.add("walk_L2", [28, 27, 29, 27], fspeed, true);
			sprPlayer.add("walk_R2", [31, 30, 32, 30], fspeed, true);
			sprPlayer.add("walk_U2", [34, 33, 35, 33], fspeed, true);
			sprPlayer.add("idle_D2", [24], 0, false);
			sprPlayer.add("idle_L2", [27], 0, false);
			sprPlayer.add("idle_R2", [30], 0, false);
			sprPlayer.add("idle_U2", [33], 0, false);
			sprPlayer.add("grab_D2", [44, 24], 2, false);
			sprPlayer.add("grab_L2", [45, 27], 2, false);
			sprPlayer.add("grab_R2", [46, 30], 2, false);
			sprPlayer.add("grab_U2", [47, 33], 2, false);
			// (Used to show the varying light)
			sprPlayer.add("vary", [0, 12, 24, 12], 10);
		}
		
		public function hurtPlayer():void
		{
			healTime = 0;
			damage++;
		}
		
		override public function update():void {
			var moving:Boolean = false;
			var key_count:int = 0;
			var move_speed:Number = speed;
			var anim:String = "";
			/*
			if (Input.check(Key.DIGIT_1)) lightLevel = 0;
			else if (Input.check(Key.DIGIT_2)) lightLevel = 1;
			else if (Input.check(Key.DIGIT_3)) lightLevel = 2;
			*/
			
			healTime += FP.elapsed;
			
			if (damage >= 4)
			{
				// DEAD
				Global.LIGHT_PLAYER.scale = 0;
				FP.world = new EndScreen("You are dead. You took to much damage.");
			}
			
			if (healTime >= HEAL_RATE)
			{
				healTime = 0;
				damage--;
				if (damage < 0)
					damage = 0;
			}
			
			if (Input.pressed("Action"))
			{	// (Need to check if there is an item to grab still!)
				var doorObj:Door;
				var usedItem:Boolean = false;
			
				if (collide("door", x, y))
				{
					doorObj = (Door)(collide("door", x, y));
					this.facing = doorObj.facing;
					
					for (var i:int = 0; i < inventory.length; i++)
					{
						if (((Item)(inventory[i]).interactsWith == "door") && usedItem == false)
						{
							// DOOR INTERACTED
							usedItem = true;
							inventory.splice(i, 1);
							Global.curLevel++;
							if (Global.curLevel >= Global.LEVELARRAY.length)
							{
								FP.world = new EndScreen("You won!");
							}
							else
								FP.world = new GameWorld(doorObj.level);
						}
					}
					usedItem = false;
				}
				
				anim = "grab_" + facing + lightLevel;
				sprPlayer.play(anim);
			} // Player can't move when making an action
			else 
			{
				// Used to the limit the movement if multiple keys are pressed (moving diagonally)
				if (Input.check("Left")) key_count++;
				if (Input.check("Right")) key_count++;
				if (Input.check("Up")) key_count++;
				if (Input.check("Down")) key_count++;
				if (key_count > 1) move_speed = speed * .65;
				
				// Interpret the key input
				if (Input.check("Left")) { 
					if (!collide("wall", x - speed, y)) {
						x -= move_speed; 
						moving = true;
					}
					facing = Global.LEFT;
				}
				if (Input.check("Right")) { 
					if (!collide("wall", x + speed, y)) {
						x += move_speed; 
						moving = true;
					}
					facing = Global.RIGHT;
				}
				if (Input.check("Up")) { 
					if (!collide("wall", x, y - speed)) {
						y -= move_speed;
						moving = true;
					}
					facing = Global.UP;
				}
				if (Input.check("Down")) {
					if (!collide("wall", x, y + speed)) {
						y += move_speed;	
						moving = true;
					}
					facing = Global.DOWN;
				}
				
				// Pick the animation for the player
				if (moving) {
					anim = "walk_" + facing + lightLevel;
				} else {
					anim = "idle_" + facing + lightLevel;
				}
				sprPlayer.play(anim);
				
				if (collide("item", x, y))
				{
					Global.PLAYER_CLASS.inventory.push(collide("item", x, y));
					world.remove(collide("item", x, y));
				}
			}
		}
	}
}