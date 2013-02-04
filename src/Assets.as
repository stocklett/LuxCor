package  
{
	import net.flashpunk.Sfx;
	public class Assets 
	{
		
		[Embed(source="levels/level_0.oel", mimeType="application/octet-stream")] public static const level0:Class;
		[Embed(source = "Levels/level_1.oel", mimeType = "application/octet-stream")] public static const level1:Class;
		[Embed(source="Levels/level_2.oel", mimeType="application/octet-stream")] public static const level2:Class;
		
		[Embed(source = "assets/objects/background_assets-forObjects.png")] public static const BackgroundTiles:Class;
		[Embed(source = "assets/foreground_assets_LG.png")] public static const ForegroundTiles:Class;
		
		[Embed(source = "assets/door.png")] public static const DoorTile:Class;
		[Embed(source = "assets/small_hole.png")] public static const HoleTile:Class;
		[Embed(source = "assets/light_pixel.png")] public static const LIGHT:Class;
		[Embed(source = "assets/key-LG.png")] public static const KEY:Class;
		[Embed(source = "assets/player_LG.png")] public static const PLAYER:Class;
		
		[Embed(source = "assets/objects/desk-LG.png")] public static const DESK:Class;
		[Embed(source = "assets/objects/table-mini-LG.png")] public static const SM_TABLE:Class;
		[Embed(source = "assets/objects/table-wide-LG.png")] public static const WIDE_TABLE:Class;
		[Embed(source = "assets/objects/table-LG.png")] public static const TABLE:Class;
		[Embed(source = "assets/objects/bookshelf-LG.png")] public static const BOOKCASE:Class;
		[Embed(source = "assets/objects/tube-short-LG.png")] public static const TUBE_TALL:Class;
		[Embed(source = "assets/objects/tube-tall-LG.png")] public static const TUBE_SHORT:Class;
		
		[Embed(source = 'assets/upheavtt.ttf', embedAsCFF = "false", fontFamily = 'upheavtt')] private const UPHEAVTT:Class;
		[Embed(source = 'assets/slime.png')] public static const SLIME:Class;
		[Embed(source = 'assets/button.png')]	public static const BUTTON:Class;
		
		[Embed(source = "assets/heart_rate.png")] public static const HEART_RATE:Class;
		[Embed(source="assets/heart_rate_img.png")] public static const HEART_RATE_IMG:Class;
		
		[Embed(source = "assets/return_door.png")] public static const RDoorTile:Class;
		
		[Embed(source = "assets/MUSIC.swf", symbol = "LOOP_ACIDTHEME.wav")] public static const ACIDTHEME:Class;
		public static const mainTheme:Sfx = new Sfx(ACIDTHEME);
		
		//[Embed(source = "assets/MUSIC.swf", symbol = "NOLOOP_BEN_gameTheme.wav")] public static const MAINTHEME:Class;
		
		//[Embed(source = "assets/MUSIC.swf", symbol = "NOLOOP_SAM_gameTheme.wav")] public static const MAINTHEME2:Class;
		
		[Embed(source = "assets/MUSIC.swf", symbol = "ScaryThemeLoop.wav")] public static const MAINTHEMELOOP:Class;
		public static const mainLoop:Sfx = new Sfx(MAINTHEMELOOP);
		
		//[Embed(source = "assets/MUSIC.swf", symbol = "ScarySound1.wav")] public static const NOISE:Class;
		
		
		
	}
}