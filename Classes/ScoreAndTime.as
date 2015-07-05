package Classes
{
	import flash.geom.*;
	import flash.display.*;
	
	public class ScoreAndTime
	{
		private var bitmap:BitmapData = null;
		public var mx:int = 0;
		public var my:int = 0;
		public var numberStr:String;
		public var digitPosX:int;
		public var digitPosY:int;
		public function ScoreAndTime(number:int,numPosX:int,numPosY:int)
		{
			numberStr	= number.toString();
			digitPosX	= numPosX;
			digitPosY	= numPosY;		
		}
		//7
		[Embed(source="../Images/ScoreAndTime.png")] private var scoreAndTimeImg:Class;
		public function draw(screenBuffer:BitmapData):void
		{
			for (var i:int =numberStr.length-1 ; i>=0 ; i--)
			{	
				var digit:int = numberStr.charCodeAt(i) - 48;
				var digitPos:int = digit*25;
				if (bitmap == null)
				{
					bitmap = new BitmapData(250,120,true,0x00000000);
					bitmap.draw(new scoreAndTimeImg());
				}
				screenBuffer.copyPixels(bitmap,
										new Rectangle( digitPos,0,25,60),
										new Point(digitPosX+i*25,digitPosY)); 
			}
		}
	}
}