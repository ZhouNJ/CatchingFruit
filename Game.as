private static const GAME_SHOW:int = 1;
private static const GAME_PLAY:int = 1;
private static const GAME_TIMES_UP:int = 3;

private var gameState:int = GAME_SHOW;
private var gameTime:Number = 0;


private function Draw_Game(elapsedTime:Number):void
{
  gameTime += elapsedTime;
 
  switch (gameState)
  {
	case GAME_SHOW:
		Draw_TimeAndScore(); 
		Draw_ToBegin();
		//
		Apply_FadeEffect(1 - gameTime); 
		
		if (gameTime >= 1)
		ChangeState_Game(GAME_PLAY);
		break;
	case GAME_PLAY:
		Draw_TimeAndScore(); 
		//game code

	case GAME_TIMES_UP:
		Draw_TimeAndScore();
		Draw_TimesUp();
		
		Apply_FadeEffect(gameTime);
		
		// Change to stage: showing results
		if (gameTime >= 1)
			state = RESULT;
		break;       
  }
}

private var timeAndScoreBitmap:BitmapData = null;
private function Draw_TimeAndScore():void
{
  if (timeAndScoreBitmap == null)
  {
    timeAndScoreBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT);
    timeAndScoreBitmap.draw(new timeAndScoreImg()); 
  }

  screenBuffer.copyPixels(timeAndScoreBitmap, 
                          new Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT),
                          new Point(0,0)); 
}

private var toBeginBitmap:BitmapData = null;
private function Draw_TimesUp():void
{
  if (toBeginBitmap == null)
  {
    timesUpBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT);
    timesUpBitmap.draw(new timesUpImg()); 
  }

  screenBuffer.copyPixels(timesUpBitmap, 
                          new Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT),
                          new Point(0,0)); 
}

private var timesUpBitmap:BitmapData = null;
private function Draw_ToBegin():void
{
  if (toBeginBitmap == null)
  {
    toBeginBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT);
    toBeginBitmap.draw(new toBeginImg()); 
  }

  screenBuffer.copyPixels(toBeginBitmap, 
                          new Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT),
                          new Point(0,0)); 
}


//handling mouse event according to different stage
private function MouseDown_Game(event:MouseEvent):void 
{ 
//do nothing 
} 

//handling mouse event according to different stage
private function MouseUp_Game(event:MouseEvent):void 
{ 
//do nothing
}

//handling mouse event according to different stage
private function MouseMoved_Game(event:MouseEvent):void 
{

}