package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.TiledImage;
	
	public class Door extends Entity
	{
		protected var _image:TiledImage;
		public var facing:String;
		public var level:Class;
		
		public function Door(x:Number, y:Number, facing:String, level:Class, returnDoor:Boolean) 
		{
			if (!returnDoor)
			{
				_image = new TiledImage(Assets.DoorTile, width, height);
				setHitbox(96, 96 + 20);
			}
			else
			{
				_image = new TiledImage(Assets.RDoorTile, width, height);
				//setHitbox(96, 192 );
			}
		
			type = "door";
			this.facing = facing;
			super(x, y, _image);
			this.level = level;
		}	
	}

}