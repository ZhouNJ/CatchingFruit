package Classes
{
	import flash.geom.*;
	import flash.display.*;

	public class Fruits extends MovieClip
	{
		public const FRUIT_WIDTH:int = 80;
		public const FRUIT_NUM:int = 11;
		private var bitmap:BitmapData = null;
		public var mx:int = 0;
		public var my:int = 0;
		public var typeStr:int = 0; 
		
		private var fruitImgPosY:int = 0;
		
		public function Fruits(fruitType:int)
		{
			
			fruitImgPosY = fruitType*FRUIT_WIDTH;
		}
		//7
		[Embed(source="../Images/Fruits.png")] private var fruitsImg:Class;
	
		public function draw(screenBuffer:BitmapData):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(FRUIT_WIDTH,FRUIT_NUM*FRUIT_WIDTH,true,0x00000000);
				bitmap.draw(new fruitsImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,fruitImgPosY,FRUIT_WIDTH,FRUIT_WIDTH),
                                    new Point(mx-80,my));  
		}
	}
}