//1
[Embed(source="Images/TitleScreen.png")] private var titleScreenImg:Class;
//2
[Embed(source="Images/ActivationButton.png")] private var activationButtonImg:Class;
//3
[Embed(source="Images/FadeEffect.png")] private var fadeEffectImg:Class;
//4
[Embed(source="Images/GameBackground.png")] private var gameBackgroundImg:Class;
//5
[Embed(source="Images/TimeAndScore.png")] private var timeAndScoreImg:Class;
//6
[Embed(source="Images/ToBegin.png")] private var toBeginImg:Class;

//7
[Embed(source="Images/TimesUp.png")] private var timesUpImg:Class;
//8
[Embed(source="Images/ResultScore.png")] private var resultScoreImg:Class;
//9
[Embed(source="Images/PlayAgain.png")] private var playAgainImg:Class;


//1
//stage: Activation
//Title
private var titleScreenBitmap:BitmapData = null;
private function Draw_TitleScreen():void
{
  if (titleScreenBitmap == null)
  {
    titleScreenBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT);
    titleScreenBitmap.draw(new titleScreenImg()); 
  }

  screenBuffer.copyPixels(titleScreenBitmap, 
                          new Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT),
                          new Point(0,0)); 
}

//2
//stage: Activation
//Activation button
private var activationButtonBitmap:BitmapData = null;
private function Draw_ActivationButton():void
{
  if (activationButtonBitmap == null)
  {
    activationButtonBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,true,0x00000000);
    activationButtonBitmap.draw(new activationButtonImg());
  }
  
  screenBuffer.copyPixels(activationButtonBitmap,
						new Rectangle(300,300,200,200),
						new Point(300,300+(pressedOption != -1 ? -1:0) ));

 
}

//3
// draw fade effect in Effect.as

//4
// Stage : game, 
// Game background
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

//5
// Stage : game,
// Time and Score
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

//6
// Stage : game, 
// Press any button to begin
private var toBeginBitmap:BitmapData = null;
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

//7
// Stage : game,
// Time's Up
private var timesUpBitmap:BitmapData = null;
private function Draw_TimesUp():void
{
  if (timesUpBitmap == null)
  {
    timesUpBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,true,0x00000000);
    timesUpBitmap.draw(new timesUpImg()); 
  }

  screenBuffer.copyPixels(timesUpBitmap, 
                          new Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT),
                          new Point(0,0)); 
}

//8
//stage: result
//Score
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


//9
//stage: result
//play again
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




