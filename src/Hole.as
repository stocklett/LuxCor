package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.TiledImage;
	
	public class Hole extends Entity
	{
		protected var _image:TiledImage;

		public function Hole(x:Number, y:Number)  {
			_image = new TiledImage(Assets.HoleTile, width, height);
			setHitbox(_image.width - 20, _image.height - 20, -10, -10);
			type = "hole";
			super(x, y, _image);
		}
		
	}

}