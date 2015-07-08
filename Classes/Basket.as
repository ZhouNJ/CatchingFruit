package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class Basket extends MovieClip
	{
		public var boomOrNot:Boolean = false;
		
		// hit must set to false at the begining
		public var hit:Boolean = false;
		public function Basket()
		{
			
		
		}
		//7
		[Embed(source="../Images/Basket.png")] private var basketImg:Class;
		[Embed(source="../Images/BoomedBasket.png")] private var boomedBasketImg:Class;
		private var bitmap:BitmapData = null;
		public var mx:int = 0;
		public var my:int = 0;
		public function draw(screenBuffer:BitmapData):void
		{
			//if it catch a boom, it draw the boomed version of basket
			if ( bitmap == null || hit == true )
			{
				bitmap = new BitmapData(160,120,true,0x00000000);
				if ( (hit == true) && (boomOrNot == true) )
				{
						bitmap.draw(new boomedBasketImg());
				}else{
						bitmap.draw(new basketImg());
				}
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,0,160,120),
                                    new Point(mx-80,my+(hit == true ? -2 : 0))); 
		}
	}
}