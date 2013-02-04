package  
{
	import flash.display.Graphics;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author Jonathan Benkovic
	 */
	public class Inventory extends Entity
	{
		private var itemHeld:Item;
		private var slotText:Text;
		
		public function Inventory(x:Number, y:Number) 
		{
			layer = -44;
			//graphic = new Image(Assets.INVENTORY_SLOT);
			
			//if(Global.PLAYER_CLASS.inventory[0] != null)
			slotText = new Text("", x, y); 
			
			slotText.font = "upheavtt";
			slotText.size = 20;
			slotText.color = 0xffffffff;
			slotText.y = FP.screen.height - (1.5 * slotText.textHeight)
			
			graphic = slotText;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}
		
		override public function update():void
		{
			if (Global.PLAYER_CLASS.inventory.length > 0)
			{
				slotText.text = (Item)(Global.PLAYER_CLASS.inventory[0]).itemType + " x" + Global.PLAYER_CLASS.inventory.length;
				slotText.y = FP.screen.height - (1.5 * slotText.textHeight)
			}
			else
				slotText.text = "";
		}
	}

}