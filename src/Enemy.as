package  
{
	/**
	 * ...
	 * @author John Stockwell
	 * 
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Enemy extends Entity
	{
		private var facing:String;
		private var moving:Boolean = false;
		private var time:Number = 0;
		private var attackSpeed:int;
		private var moveSpeed:int;
		private var sprEnemy:Spritemap;
		
		public function Enemy(_x:Number, _y:Number, sprEnemy:Spritemap, attackSpeed:int = 1, moveSpeed:int = 1, scale:Number = 2)
		{
			this.sprEnemy = sprEnemy;
			graphic = sprEnemy;
			sprEnemy.scale = scale;
			this.attackSpeed = attackSpeed;
			this.moveSpeed = moveSpeed;
			type = "enemy";
			layer = 1;
			x = _x;
			y = _y;
			facing = Global.DOWN;
		}
				
		override public function update():void 
		{
			var anim:String = "";
			var playerX:Number;
			var playerY:Number;
			var enemyX:Number = x;
			var enemyY:Number = y;
			
			playerX = Global.PLAYER_CLASS.centerX;
			playerY = Global.PLAYER_CLASS.centerY;
			
			// Moves towards the bottom right corner NEEDS FIXED!!??
					
			
			if ((playerX == centerX) && ((Global.PLAYER_CLASS.y - (y + height) == 0)))
			{
				
			}
			else if (moving == true)
				moveTowards(Global.PLAYER_CLASS.x, Global.PLAYER_CLASS.y, moveSpeed, "wall", true);
	
				
			
			// Collision
			var moveX:Number = x - enemyX;
			var moveY:Number = y - enemyY;
			/*x -= moveX;
			y -= moveY;
			
			if (moveX != 0 && !collide("wall", x - moveSpeed, y)) 
				x -= moveX;	// Left
			if (moveX != 0 && !collide("wall", x + moveSpeed, y)) 
				x += moveX;	// Right
			if (moveY != 0 && !collide("wall", x, y - moveSpeed)) 
				y -= moveY;	// Up
			if (moveY != 0 && !collide("wall", x, y + moveSpeed)) 
				y += moveY;	// Down*/

			if (playerX < this.centerX) 
			{
				facing = Global.LEFT;
				moving = true;
			}
			if (playerX > this.centerX) { 
				facing = Global.RIGHT;
				moving = true;
			}
			if (playerY < this.centerY) { 
				facing = Global.UP;
				moving = true;
			}
			if (playerY > this.centerY) { 
				facing = Global.DOWN;
				moving = true;
			}
		
			if (collide("light", x, y))
				moving = true;
			else
				moving = false;
			
			if (collide("player", x, y))
			{
				time += FP.elapsed;
			
				if(time >= attackSpeed)
				{
					time = 0;
					Global.PLAYER_CLASS.hurtPlayer();
				}
				moving = false;
			}
			
				
			if (moving) {
				anim = "walk_" + facing;
			} else {
				anim = "idle_" + facing;	
			}
			sprEnemy.play(anim);
		}
	}
		}
		