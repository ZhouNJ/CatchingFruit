private static const GAME_SHOW:int = 1;
private static const GAME_PLAY:int = 2;
private static const GAME_TIMES_UP:int = 3;

private static const GAME_TIME:int = 60;

private var gameState:int = GAME_SHOW;
private var gameTime:Number = 0;

private var pressBegin:int = -1;


private function Draw_Game(elapsedTime:Number):void
{
  gameTime += elapsedTime;
 
  switch (gameState)
  {
	case GAME_SHOW:
		Draw_GameBackground();
		Draw_ToBegin();
		Draw_TimeAndScore(); 
		
		//
		Apply_FadeEffect(FADE_EFFECT_TIME - gameTime); 
		
		if (pressBegin == 0)
			ChangeState_Game(GAME_PLAY);
		break;
	case GAME_PLAY:
		Draw_GameBackground();
		Draw_TimeAndScore(); 
		//game code
		break;

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

private function ChangeState_Game(newState:int):void
{
//add sound effect here

  gameState = newState;
  gameTime = 0;
}

// draw times and score of the game
private var timeAndScoreBitmap:BitmapData = null;
private function Draw_TimeAndScore():void
{
  if (timeAndScoreBitmap == null)
  {
    timeAndScoreBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,true,0x00000000);
    timeAndScoreBitmap.draw(new timeAndScoreImg()); 
  }

  screenBuffer.copyPixels(timeAndScoreBitmap, 
                          new Rectangle(0, 0, SCREEN_WIDTH, 150),
                          new Point(0,0)); 
}

// draw times up message of the game
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

//draw "press button to begin" of the game
private var timesUpBitmap:BitmapData = null;
private function Draw_ToBegin():void
{
  if (toBeginBitmap == null)
  {
    toBeginBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,true,0x00000000);
    toBeginBitmap.draw(new toBeginImg()); 
  }

  screenBuffer.copyPixels(toBeginBitmap, 
                          new Rectangle(0, 200, SCREEN_WIDTH, 400),
                          new Point(0,200)); 
}

//draw background of the game
private var gameBackgroundBitmap:BitmapData = null;
private function Draw_GameBackground():void
{
  if (toBeginBitmap == null)
  {
    gameBackgroundBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,true,0x00000000);
    gameBackgroundBitmap.draw(new gameBackgroundImg()); 
  }

  screenBuffer.copyPixels(gameBackgroundBitmap, 
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
	pressBegin = 0;
}

//handling mouse event according to different stage
private function MouseMoved_Game(event:MouseEvent):void 
{

}