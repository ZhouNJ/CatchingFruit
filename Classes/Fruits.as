package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class Fruits extends MovieClip
	{
		private var bitmap:BitmapData = null;
		public var mx:int = 0;
		public var my:int = 0;
		public var typeStr:int = 0; 
		
		private var fruitImgPosY:int = 0;
		
		public function Fruits(fruitType:int)
		{
			
			fruitImgPosY = fruitType*60;
		}
		//7
		[Embed(source="../Images/Fruits.png")] private var fruitsImg:Class;
	
		public function draw(screenBuffer:BitmapData):void
		{
			if (bitmap == null)
			{
				bitmap = new BitmapData(60,600,true,0x00000000);
				bitmap.draw(new fruitsImg());
			}
			screenBuffer.copyPixels(bitmap,
                                    new Rectangle(0,fruitImgPosY,60,60),
                                    new Point(mx-80,my));  
		}
	}
}