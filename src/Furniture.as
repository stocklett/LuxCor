package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.TiledImage;
	
	public class Furniture extends Entity
	{		
		public function Furniture(x:Number, y:Number, _image:Class) 
		{
			super(x, y);
			var image:Image = new Image(_image);
			setHitbox(image.width, image.height);
			graphic = image;
			type = "wall";
		}	
	}

}