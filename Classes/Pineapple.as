//Pineapple_6
package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class Pineapple extends MovieClip
	{
		public function Pineapple()
		{
			
		
		}
		//7
		[Embed(source="../Images/Pineapple.png")] private var pineappleImg:Class;
		private var bitmap:BitmapData = null;
		public var x:int = 0;
		public var y:int = 0;		
		public function draw(screenBuffer:BitmapData):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(60,60,true,0x00000000);
				bitmap.draw(new pineappleImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,0,60,60),
                                    new Point(x-80,y));  
		}
	}
}