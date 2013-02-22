package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.TiledImage;
	
	public class Door extends Entity
	{
		protected var _image:TiledImage;
		public var facing:String;
		public var level:int;
		public var spawn:int;
		public var locked:Boolean;
		public var ID:int;
		
		public function Door(x:Number, y:Number, id:int, facing:String, level:int, spawn:int, lock:Boolean, returnDoor:Boolean) 
		{
			if (!returnDoor) {
				_image = new TiledImage(Assets.DoorTile, width, height);
				setHitbox(96, 96 + 20);
			}
			else {
				_image = new TiledImage(Assets.RDoorTile, width, height);
				setHitbox(96, 192);
			}
		
			type = "door";
			this.ID = id;
			this.locked = lock;
			this.facing = facing;
			this.level = level;
			this.spawn = spawn;
			super(x, y, _image);
		}	
	}

}