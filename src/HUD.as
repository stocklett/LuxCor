package  
{
	import net.flashpunk.Entity;
//	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Text;
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	//import flash.display.BitmapData
	//import net.flashpunk.graphics.Graphiclist
	
	public class HUD extends Entity
	{
		public static var heartText:Text;
	//	private var display:Graphiclist;
	//	private var square:Entity;
		
		public function HUD()
		{
			layer = -44;
			
			heartText = new Text(new String(Global.PLAYER_CLASS.heartRate.toString() + " bpm") , FP.screen.width - 100, 0);
			
			heartText.font = "upheavtt";
			heartText.size = 20;
			heartText.color = 0xffffffff;
			
			heartText.y = FP.screen.height - (1.5 * heartText.textHeight);
			
			
			graphic = heartText;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}	
		
		override public function update():void
		{
			//updates the score
			heartText.text = String(Global.PLAYER_CLASS.heartRate.toString() + " BPM");
		}
	}
}