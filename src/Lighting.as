package  
{
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jonathan Benkovic
	 * 
	 * Modified from the flashpunk lighting tutorial by Noel Berry
	 */
	public class Lighting extends Entity
	{
		public var player:Player;
		public var canvas:BitmapData;
		public var colorTransform:ColorTransform = new ColorTransform(1, 1, 1, 1);
		
		public var lightToDraw:LightSource;
		public var light:Image = new Image(Assets.LIGHT);
		public var time:Number = 0;
		
		public function Lighting() 
		{
			layer = -42;
			canvas = new BitmapData(FP.width, FP.height, false, 0xFFFFFF);
			light.centerOO();
			type = "light";
			//setHitbox(100, 100);
		}
		
		public function add(l:LightSource):void
		{
			lightToDraw = l;
			type = "light";
		}
		
		override public function update():void
		{
			time += FP.elapsed;
			
			if (collide("enemy", x, y))
			{
				if(time >= .5)
				{
					Global.PLAYER_CLASS.heartRate += 3;
					time = 0;
				}
			}
			else
			{
				if (time >= 1)
				{
					Global.PLAYER_CLASS.heartRate -= 4;
					time = 0;
				}
				
				if (Global.PLAYER_CLASS.heartRate < 80)
					Global.PLAYER_CLASS.heartRate = 80;
			}
			
			if (Global.PLAYER_CLASS.heartRate >= 80 && Global.PLAYER_CLASS.heartRate <= 100)
			{
				switch(Global.PLAYER_CLASS.damage)
				{
					case 1:
						Global.LIGHT_PLAYER.scale = 2;
						break;
					case 2:
						Global.LIGHT_PLAYER.scale = 1.5;
						break;
					case 3:
						Global.LIGHT_PLAYER.scale = 1;
						break;
					default:
						Global.LIGHT_PLAYER.scale = 3;
				}
				
				Global.PLAYER_CLASS.lightLevel = 0; 
			}
			else if (Global.PLAYER_CLASS.heartRate > 100 && Global.PLAYER_CLASS.heartRate <= 120)
			{
				switch(Global.PLAYER_CLASS.damage)
				{
					case 1:
						Global.LIGHT_PLAYER.scale = 4.5;
						break;
					case 2:
						Global.LIGHT_PLAYER.scale = 5;
						break;
					case 3:
						Global.LIGHT_PLAYER.scale = 5.5;
						break;
					default:
						Global.LIGHT_PLAYER.scale = 4;
				}
				
				Global.PLAYER_CLASS.lightLevel = 0;
			}
			else if (Global.PLAYER_CLASS.heartRate > 120 && Global.PLAYER_CLASS.heartRate <= 140)
			{
				switch(Global.PLAYER_CLASS.damage)
				{
					case 1:
						Global.LIGHT_PLAYER.scale = 5.5;
						break;
					case 2:
						Global.LIGHT_PLAYER.scale = 6;
						break;
					case 3:
						Global.LIGHT_PLAYER.scale = 6.5;
						break;
					default:
						Global.LIGHT_PLAYER.scale = 5;
				}
				
				Global.PLAYER_CLASS.lightLevel = 1;
			}
			else if (Global.PLAYER_CLASS.heartRate > 140 && Global.PLAYER_CLASS.heartRate <= 200)
			{
				switch(Global.PLAYER_CLASS.damage)
				{
					case 1:
						Global.LIGHT_PLAYER.scale = 6.5;
						break;
					case 2:
						Global.LIGHT_PLAYER.scale = 7;
						break;
					case 3:
						Global.LIGHT_PLAYER.scale = 7.5;
						break;
					default:
						Global.LIGHT_PLAYER.scale = 6;
				}
				
				Global.PLAYER_CLASS.lightLevel = 2;
			}
			else
			{
				// Dead
				Global.LIGHT_PLAYER.scale = 0;
				FP.world = new EndScreen("You are dead. Your heart rate was too high.");
			}		
			
			
			var xDist:Number = light.scaledWidth * (2.5/3.0);
			var yDist:Number = light.scaledHeight * (2.5 / 3.0);
		
			setHitbox(xDist, yDist, ( -1 * (Global.PLAYER_CLASS.centerX)) + xDist / 2, ( -1 * (Global.PLAYER_CLASS.centerY)) + yDist / 2);
			super.update();
		}
		
		override public function render():void 
		{
			super.render();
			
			//redraw the canvas
			canvas.fillRect(canvas.rect, 0xFFFFFF);
			
			light.scale = lightToDraw.scale;
						
			light.render(canvas, new Point(lightToDraw.x, lightToDraw.y), FP.camera);
		
			// render the canvas to the screen, with
			FP.buffer.draw(canvas, null, colorTransform, BlendMode.SUBTRACT);
		}
	}

}