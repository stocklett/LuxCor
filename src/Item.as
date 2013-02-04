package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Item extends Entity 
	{
		public var interactsWith:String;
		public var itemType:String;
		
		public function Item(x:Number, y:Number, interactsWith:String, image:Class, itemType:String) 
		{
			var tempImage:Image = new Image(image);
			this.x = x;
			this.y = y;
			this.interactsWith = interactsWith;
			type = "item";
			graphic = tempImage;
			setHitbox(tempImage.width, tempImage.height);
			this.itemType = itemType;
		}
	}
}