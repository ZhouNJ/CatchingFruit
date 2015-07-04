//Mango_4
package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class Mango extends MovieClip
	{
		public function Mango()
		{
			
		
		}
		//7
		[Embed(source="../Images/Mango.png")] private var mangoImg:Class;
		private var bitmap:BitmapData = null;
		public var x:int = 0;
		public var y:int = 0;		
		public function draw(screenBuffer:BitmapData):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(60,60,true,0x00000000);
				bitmap.draw(new mangoImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,0,60,60),
                                    new Point(x-80,y)); 
		}
	}
}