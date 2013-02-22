package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class Global 
	{
		public static var PLAYER_CLASS:Player;	
		public static var LIGHT_PLAYER:LightSource;
		public static const DOWN:String = "D";
		public static const LEFT:String = "L";
		public static const RIGHT:String = "R";
		public static const UP:String = "U";
		public static var curLevel = 0;
		public static const LEVELARRAY:Array = new Array(Assets.level0, Assets.level1, Assets.level2);
		
		// Track which doors have been unlocked
		//	(could use a BETTER fix, of course)
		public static var unlockedDoors:Array = [[false], [false], [false]];
	}

}