package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	[SWF(width = "1024", height = "576", Framerate = "60", backgroundCaller = "#FFFFFF")]
	public class Main extends Engine
	{
		/*
		[Embed(source = 'assets/MainAcidTheme44.wav')] private const MAINTHEME:Class;
		public var MainAcidTheme:Sfx = new Sfx(MAINTHEME);
		*/
		public function Main()
		{
			super(1024, 576, 60, false);
			FP.world = new MainMenu;
			//FP.console.enable();
		}
	}
}