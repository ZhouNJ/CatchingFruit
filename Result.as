private var PressResult:int = -1;
private var resultTime:Number = 0;

private function Draw_Result(elapsedTime:Number):void
{
	resultTime += elapsedTime;
	
	Draw_GameBackground();
	Draw_ResultScore();
	Draw_PlayAgain();
	if (PressResult == 0)
		state = GAME;
		PressResult = -1;
}

//draw play again message
private var playAgainBitmap:BitmapData = null;
private function Draw_PlayAgain():void
{
  if (playAgainBitmap == null)
  {
    playAgainBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,true,0x00000000);
    playAgainBitmap.draw(new playAgainImg()); 
  }

  screenBuffer.copyPixels(playAgainBitmap, 
                          new Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT),
                          new Point(0,0)); 
}

private var resultScoreBitmap:BitmapData = null;
private function Draw_ResultScore():void
{
  if (playAgainBitmap == null)
  {
    resultScoreBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,true,0x00000000);
    resultScoreBitmap.draw(new resultScoreImg()); 
  }

  screenBuffer.copyPixels(resultScoreBitmap, 
                          new Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT),
                          new Point(0,0)); 
}

//handling mouse event according to different stage
private function MouseDown_Result(event:MouseEvent):void 
{ 

} 

//handling mouse event according to different stage
private function MouseUp_Result(event:MouseEvent):void 
{ 
	PressResult = 0;
}

//handling mouse event according to different stage
private function MouseMoved_Result(event:MouseEvent):void 
{

}