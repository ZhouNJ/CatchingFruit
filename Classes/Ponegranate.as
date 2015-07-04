//Ponegranate_7
package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class Ponegranate extends MovieClip
	{
		public function Ponegranate()
		{
			
		
		}
		//7
		[Embed(source="../Images/Ponegranate.png")] private var ponegranateImg:Class;
		private var bitmap:BitmapData = null;
		public var x:int = 0;
		public var y:int = 0;		
		public function draw(screenBuffer:BitmapData):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(60,60,true,0x00000000);
				bitmap.draw(new ponegranateImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,0,60,60),
                                    new Point(x-80,y));  
		}
	}
}