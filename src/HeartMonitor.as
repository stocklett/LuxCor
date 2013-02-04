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
			
			super(x, y);
			sprHeart.scale = _scale;
			sprHeart.add("beat_slow", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 12, true);
			sprHeart.add("beat_mid", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 20, true);
			sprHeart.add("beat_fast", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 28, true);
			sprHeart.play("beat_slow");
			graphic = sprHeart;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}
		override public function update():void 
		{			
			if (Input.check(Key.DIGIT_1)) sprHeart.play("beat_slow");
			else if (Input.check(Key.DIGIT_2)) sprHeart.play("beat_mid");
			else if (Input.check(Key.DIGIT_3)) sprHeart.play("beat_fast");
		}
		
	}

}