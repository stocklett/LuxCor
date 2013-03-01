package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx
	import net.flashpunk.tweens.sound.SfxFader
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author John Stockwell
	 */
	
	public class SoundHandler extends Entity
	{
		public var soundHandler:Sfx;
		
		public function SoundHandler(_x:Number, _y:Number, world:String)
		{
			x = _x;
			y = _y;
			
			switch(world)
			{
				case "world1":
					soundHandler.play(Assets.ACIDTHEME);
					break;
				case "world2":
					soundHandler.play(Assets.MAINTHEMELOOP);
					break;
			}
			
		}
		
		public function SetSoundPan(panValue:Number)
		{
			snd:Sfx;
		}
		public function SetSong()
		{
		}
		private function PlaySound()
		{
		}
	}
	
}