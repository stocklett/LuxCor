package  
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Jonathan Benkovic
	 * 
	 * Modified from the flashpunk lighting tutorial by Noel Berry
	 */
	public class LightSource extends Entity
	{
	//	public var x:int = 0;
	//	public var y:int = 0;
		public var scale:Number = 1;
		
		public function LightSource(x:int, y:int, scale:Number = 1) 
		{
			this.x = x;
			this.y = y;
			this.scale = scale;
		}
	}
}