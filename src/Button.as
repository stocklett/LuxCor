package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	public class Button extends Entity
	{
		//DECLARATIONS
		protected var normal:Graphic;
		protected var hover:Graphic;
		protected var down:Graphic;
		protected var clicked:Boolean = false;
		protected var label:Text;
		public var world1:World;
		
		[Embed(source='assets/button.png')]
		public static const BUTTON:Class;
		[Embed(source='assets/button_down.png')]
		public static const BUTTON_DOWN:Class;
		[Embed(source='assets/button_hover.png')]
		public static const BUTTON_HOVER:Class;
		
		//DEFAULT CONSTRUCTOR FOR BUTTONS
		public function Button(world2:World, x:Number = 0, y:Number = 0, text:String = "")
		{
			var normalImage:Image = new Image(BUTTON);
			label = new Text(text, 10, 20, {size: 30, color: 0xFFFFFF, width: normalImage.width - 30, wordWrap: true, align: "center"});
			//label.y = (normalImage.height - label.textHeight) * 0.5;
			
			super(x, y);
			this.world1 = world2;
			
			//VISUAL VALUES FOR HOVERING, CLICKING DOWN, AND DOING NOTHING TO THIS PARTICULAR BUTTON
			normal = new Graphiclist(normalImage, label);
			hover = new Graphiclist(new Image(BUTTON_HOVER), label);
			down = new Graphiclist(new Image(BUTTON_DOWN), label);
		
			graphic = normal;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
			setHitboxTo(normalImage);
		}
		
		//UPDATE FUNCTION WHICH CHANGES THE VISUAL VALUE OF BUTTONS
		override public function update():void
		{
			//CHANGES CLICKED BOOLEAN, AND CHANGES GRAPHIC TO THE DOWN PRESS
			if (collidePoint(x, y, world.mouseX, world.mouseY))
			{
				if (Input.mousePressed)
					clicked = true;
				
				if (clicked)
					graphic = down;
				else
					graphic = hover;
				
				if (clicked && Input.mouseReleased)
					click();
			}
			else
			{
				if (clicked)
					graphic = hover;
				else
					graphic = normal;
			}
			
			if (Input.mouseReleased)
				clicked = false;
		}
		
		protected function click():void
		{
			if (world1 != null)
			{
				if (FP.world is MainMenu) 
				{
					Assets.mainTheme.stop();
					Assets.mainLoop.loop();
				}
				else if (Global.curLevel > 0)
				{
					Assets.mainLoop.stop();
					Assets.mainTheme.loop();
				}
				FP.world = world1;
			}
			else
			{
				FP.screen.color = Math.random() * 0xFFFFFF;
			}
		}
	}
}