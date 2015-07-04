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
		public function draw(screenBuffer:BitmapData,mx:int,my:int):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(160,80,true,0x00000000);
				bitmap.draw(new basketImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,0,160,80),
                                    new Point(mx-80,my)); 
		}
	}
}