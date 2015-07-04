//Flg_0
package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class Flg extends MovieClip
	{
		public function Flg()
		{
			
		
		}
		//
		[Embed(source="../Images/Flg.png")] private var flgImg:Class;
		private var bitmap:BitmapData = null;
		public var x:int = 0;
		public var y:int = 0;
		public function draw(screenBuffer:BitmapData,x,y):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(60,60,true,0x00000000);
				bitmap.draw(new flgImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,0,60,60),
                                    new Point(x-80,y)); 
		}
	}
}