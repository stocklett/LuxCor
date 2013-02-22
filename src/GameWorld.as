package
{
	import net.flashpunk.*;
	import net.flashpunk.utils.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.Grid;
	
	public class GameWorld extends World
	{
		protected var _player:Player;
		protected var _loadRate:int;
		public var _lighting:Lighting;
		
		protected var _map:Entity;
		protected var _mapGrid:Grid;
		protected var _mapImage:Graphic;		
		
		public function GameWorld(level:Class, spawn:int = 0, h_rate:int = 60)
		{
			FP.screen.color = 0x000000;
			_loadRate = h_rate;
			loadMap(level, spawn);
			Global.PLAYER_CLASS = _player;
			
			
			add(new Slime(400, 400));
			add(_lighting = new Lighting());
			_lighting.add(Global.LIGHT_PLAYER = new LightSource(0, 0, 3));
			add(new HUD());
			add(new Inventory(20, 0));
		}
		
		override public function update():void 
		{
			super.update();
			// Have the camera follow the player
			camera.x = _player.x - FP.screen.width * 0.5;
			camera.y = _player.y - FP.screen.height * 0.5;
			
			if (_player.collide("door", _player.x, _player.y)) {
				//trace("overlap");
			}
			if (_player.collide("hole", _player.x, _player.y)) {
				trace("falling");
			}
			
			Global.LIGHT_PLAYER.x = Global.PLAYER_CLASS.centerX;
			Global.LIGHT_PLAYER.y = Global.PLAYER_CLASS.centerY;
		} 
		
		
		protected function loadMap(mapData:Class, spawn:int):void 
		{
			var mapXML:XML = FP.getXML(mapData);
			var node:XML;
			var doorLock:Boolean;
			
			// Create the map grid
			_mapGrid = new Grid(uint(mapXML.@width), uint(mapXML.@height), 96, 96, 0, 0);
			_mapGrid.loadFromString(String(mapXML.Grid), "", "\n");
			
			var tList:Graphiclist = new Graphiclist();
			
			// Add the background tiles for the grid
			if (String(mapXML.Background_tiles).length > 0) {
				var bm:Tilemap = new Tilemap(Assets.BackgroundTiles, _mapGrid.width, _mapGrid.height, 96, 96);
				bm.loadFromString(mapXML.Background_tiles, ",", "\n");
				// Save the tilemap as the map image
				tList.add(bm);
			}
			
			// Add entities that are behind the foreground tiles
			for each (node in mapXML.Entities.Desk) {
				add(new Furniture(int(node.@x), int(node.@y), Assets.DESK));
			}
			for each (node in mapXML.Entities.SmTable) {
				add(new Furniture(int(node.@x), int(node.@y), Assets.SM_TABLE));
			}
			for each (node in mapXML.Entities.WideTable) {
				add(new Furniture(int(node.@x), int(node.@y), Assets.WIDE_TABLE));
			}
			for each (node in mapXML.Entities.Table) {
				add(new Furniture(int(node.@x), int(node.@y), Assets.TABLE));
			}
			for each (node in mapXML.Entities.Bookcase) {
				add(new Furniture(int(node.@x), int(node.@y)-45, Assets.BOOKCASE));
			}
			for each (node in mapXML.Entities.ShortTube) {
				add(new Furniture(int(node.@x), int(node.@y)-12, Assets.TUBE_SHORT));
			}
			for each (node in mapXML.Entities.TallTube) {
				add(new Furniture(int(node.@x), int(node.@y), Assets.TUBE_TALL));
			}
			
			// Add the foreground tiles for the grid
			if (String(mapXML.Foreground_tiles).length > 0) {
				var fm:Tilemap = new Tilemap(Assets.ForegroundTiles, _mapGrid.width, _mapGrid.height, 96, 96);
				fm.loadFromString(mapXML.Foreground_tiles, ",", "\n");
				// Save the tilemap as the map image
				tList.add(fm);
			}
			
			_mapImage = tList;
			_map = new Entity(0, 0, tList, _mapGrid);
			_map.layer = 4;
			_map.type = "wall";
			add(_map);
			
			// Create a player at the start position
			for each (node in mapXML.Entities.PlayerStart) {
				if (int(node.@spawnID) == spawn) _player = new Player(int(node.@x), int(node.@y), _loadRate);
			}
			
			// Add entities that are above the foreground tiles
			for each (node in mapXML.Entities.DoorObj) {
				
				doorLock = (String(node.@locked) == "True");
				if (Global.unlockedDoors[Global.curLevel][int(node.@id)] != undefined) 
						doorLock = doorLock && !Global.unlockedDoors[Global.curLevel][int(node.@id)];
				//trace(Global.curLevel, int(node.@id), doorLock);
				add(new Door(int(node.@x), int(node.@y), int(node.@id), Global.UP, int(node.@dest), int(node.@spawn), doorLock, false));
			}
			for each (node in mapXML.Entities.Return_DoorObj) {
				doorLock = (String(node.@locked) == "True");
				if (Global.unlockedDoors[Global.curLevel][int(node.@id)] != undefined) 
						doorLock = doorLock && !Global.unlockedDoors[Global.curLevel][int(node.@id)];
				//trace(Global.curLevel, int(node.@id), doorLock);
				add(new Door(int(node.@x), int(node.@y), int(node.@id), Global.DOWN, int(node.@dest), int(node.@spawn), doorLock, true));
			}
			for each (node in mapXML.Entities.KeyObj) {
				add(new Item(int(node.@x), int(node.@y), "door", Assets.KEY, "Door Key"));
			}
			for each (node in mapXML.Entities.SlimeEnemy) {
				add(new Slime(int(node.@x) - 10, int(node.@y)));
			}
			for each (node in mapXML.Entities.HoleObj) {
				add(new Hole(int(node.@x), int(node.@y)));
			}
			
			Global.PLAYER_CLASS = _player;
			add(_player);
		}
	}
}