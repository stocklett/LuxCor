package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class HeartMonitor extends Entity
	{
		public var sprHeart:Spritemap = new Spritemap(Assets.HEART_RATE, 164, 124);
		
		public function HeartMonitor(_x:Number, _y:Number, _scale:Number) 
		{
			x = _x;
			y = _y;

			sprHeart.add("beat_slow", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 12, true);
			sprHeart.add("beat_mid", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 20, true);
			sprHeart.add("beat_fast", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 28, true);
			
			graphic = sprHeart;
			sprHeart.scale = _scale;
			
			sprHeart.play("beat_slow");
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			super(x, y);
		}
		
	}

}