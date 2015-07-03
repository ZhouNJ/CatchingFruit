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
//    Draw_TitleScreen(); 
    
    Apply_FadeEffect(1 - gameMenuTime); 
    
    if (gameMenuTime >= 1)
		ChangeState_GameMenu(GAME_PLAY);
    break;
  case GAME_PLAY:
    Draw_TitleScreen();
    Draw_GameOptions();
    
    if (gameMenuTime >= 1)
		ChangeState_GameMenu(GAMEOPTIONS_WAIT);    
    break;   

  case GAME_TIMES_UP:
    Draw_TitleScreen();
    
    Apply_FadeEffect(gameMenuTime);
    
    if (gameTime >= 1)
      switch (selectedOption)
      {
      case OPTION_SINGLE:
        state = GAME;
        New_Game();
        break;       
      }
    break;  
 
  }


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