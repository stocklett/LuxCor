package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class EndScreen extends World 
	{
		private static var endText:Text;
	
		public function EndScreen(text:String) 
		{
			var buttonWidth:Number = (new Image(Assets.BUTTON)).width;
			var buttonHeight:Number = (new Image(Assets.BUTTON)).height;
			var menuButton:Button = new Button(new MainMenu, FP.screen.width * .5 - buttonWidth * .5, FP.screen.height * .5 - buttonHeight * .5, "MAIN MENU");
		
			endText = new Text(text, 0, FP.screen.height*.5 - (buttonHeight * 2));
			endText.font = "upheavtt";
			endText.size = 20;
			
			endText.x = menuButton.centerX;
			endText.centerOO()
			
			endText.color = 0xffffffff;
			
			this.addGraphic(endText);
			
			add(new Button(new MainMenu, FP.screen.width*.5 - menuButton.width*.5, FP.screen.height*.5 - menuButton.height*.5, "MAIN MENU"));
		}
		
	}

}