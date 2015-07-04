package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class Basket
	{
		public function Basket()
		{
			
		
		}
		//7
		[Embed(source="../Images/Basket.png")] private var basketImg:Class;
		private var bitmap:BitmapData = null;
		public var x:int = 0;
		public var y:int = 0;
		public function draw(screenBuffer:BitmapData):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(160,80,true,0x00000000);
				bitmap.draw(new basketImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,0,160,80),
                                    new Point(x-80,y)); 
		}
	}
}