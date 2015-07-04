//Watermelon_3
package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class Watermelon extends MovieClip
	{
		public function Watermelon()
		{
			
		
		}
		//7
		[Embed(source="../Images/Watermelon.png")] private var watermelonImg:Class;
		private var bitmap:BitmapData = null;
		public var x:int = 0;
		public var y:int = 0;		
		public function draw(screenBuffer:BitmapData):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(60,60,true,0x00000000);
				bitmap.draw(new watermelonImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,0,60,60),
                                    new Point(x-80,y));  
		}
	}
}