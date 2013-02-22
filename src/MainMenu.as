
/* JOHN STOCKWELL
 * MAIN MENU WORLD
 * */

package
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.Screen;
	import net.flashpunk.graphics.Text;
	public class MainMenu extends World
	{	
		[Embed(source="assets/MainAcideTheme.swf", symbol="MainAcidTheme44.wav")]
		public var MAINACID:Class;
		public var mainAcid:Sfx = new Sfx(MAINACID);
		private var heartMonitor:HeartMonitor;
		private static var endText:Text;
	
		public function MainMenu()
		{	
			//MAKE ANY NEW MENU ITEMS AS DECLARATIONS HERE
				//mainAcid.loop();
				var heartWidth:Number = (new Image(Assets.HEART_RATE)).width;
				add(new HeartMonitor(FP.screen.width * .5 - ((heartWidth)*1.1), 0, 4.6451612903225806451612903225806));
				
				var buttonWidth:Number = (new Image(Assets.BUTTON)).width;
				var buttonHeight:Number = (new Image(Assets.BUTTON)).height;
				
				Global.curLevel = 0;
				
				var menuButton:Button = new Button(new GameWorld(Global.LEVELARRAY[Global.curLevel]), FP.screen.width * .5 - buttonWidth * .5, FP.screen.height * .5, "START GAME");
				add(menuButton);				
				
				endText = new Text("LUX COR", 0, FP.screen.height*.5 - (buttonHeight * 2));
				endText.font = "upheavtt";
				endText.size = 40;
				endText.x = menuButton.centerX;
				endText.centerOO()
				
				endText.color = 0xffffffff;
				
				this.addGraphic(endText);
				//FP.screen.height*.5
		}
	}
}