private static const GAME_SHOW:int = 1;
private static const GAME_PLAY:int = 2;
private static const GAME_TIMES_UP:int = 3;

private static const GAME_TOTAL_TIME:int = 6;

private var gameState:int = GAME_SHOW;
private var gameTime:Number = 0;

private var pressBegin:int = -1;

private	var basket:Basket = null;
private	var score:int = 0;
private	var speed:Number = 7.0
private var level:int = 0;

private function New_Game():void
{  
	level = 1;
	basket = new Basket(); 
	var nextObject:Timer;
	var fruits:Array = new Array();

	//ChangeState_Game(GAME_SHOW);
}

private function Draw_Game(elapsedTime:Number):void
{
  gameTime += elapsedTime;
   
  switch (gameState)
  {
	case GAME_SHOW:
		Draw_GameBackground();
		Draw_ToBegin();
		Draw_TimeAndScore(); 
		//fade in
		Apply_FadeEffect(FADE_EFFECT_TIME - gameTime); 
		if (pressBegin == 0)
			ChangeState_Game(GAME_PLAY);
			pressBegin = -1;
		break;
		
	case GAME_PLAY:
		Draw_GameBackground();
		Draw_TimeAndScore(); 
		//game code
		Catching(gameTime);		
		
		if (gameTime >= GAME_TOTAL_TIME)
			ChangeState_Game(GAME_TIMES_UP);
		break;

	case GAME_TIMES_UP:
		Draw_GameBackground();
		Draw_TimeAndScore();
		Draw_TimesUp();
		//fade out
		Apply_FadeEffect(gameTime);
		// Change to stage: showing results
		if (gameTime >= 1)
		{
			ChangeState_Game(GAME_PLAY);
			state = RESULT;
		}
		break;       
  }
}

private function ChangeState_Game(newState:int):void
{
//add sound effect here

  gameState = newState;
  gameTime = 0;
}

private function Catching(elapsedTime:Number):void
{
	var mx:int = mouseX;
	const my:int = SCREEN_HEIGHT -100;

	basket.draw(screenBuffer,mx,my);
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