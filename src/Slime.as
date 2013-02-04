package  
{
	import net.flashpunk.graphics.Spritemap;

	/**
	 * ...
	 * @author Jonathan Benkovic
	 */
	public class Slime extends Enemy 
	{
		
		public var sprSlime:Spritemap = new Spritemap(Assets.SLIME, 36, 22);
		
		public static const moveSpeed:int = 1;
		
		
		public function Slime(x:Number, y:Number) 
		{
			super(x, y, sprSlime, 1, 1, 2);
			setAnimations();
			setHitbox(40, 30, -16, -10);
		}
	
		
		private function setAnimations():void 
		{
			var fspeed:int = 6;
			sprSlime.add("walk_D", [0, 1, 2, 3], fspeed, true);
			sprSlime.add("walk_L", [24, 25, 26, 27], fspeed, true);
			sprSlime.add("walk_R", [8, 9, 10, 11], fspeed, true);
			sprSlime.add("walk_U", [16, 17, 18, 19], fspeed, true);
			sprSlime.add("idle_D", [0], 0, false);
			sprSlime.add("idle_L", [24], 0, false);
			sprSlime.add("idle_R", [8], 0, false);
			sprSlime.add("idle_U", [16], 0, false);
		}
		
		
	}

}