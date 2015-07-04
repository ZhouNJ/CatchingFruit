//activation state:fade in, wait, and fade out
private static const ACTIVATION_SHOW:int = 1;
private static const ACTIVATION_WAIT:int = 2;
private static const ACTIVATION_HIDE:int = 3;

private var activationState:int = ACTIVATION_SHOW;
private var activationTime:Number = 0;

private var pressedOption:int = -1;



private function Draw_Activation(ellapsedTime:Number):void
{ 
  activationTime += ellapsedTime;

  Draw_TitleScreen();
  Draw_ActivationButton(); 

  switch (activationState)
  {
	case ACTIVATION_SHOW: 
		Apply_FadeEffect(1 - activationTime); 
		if (activationTime >= 1)
			ChangeState_Activation(ACTIVATION_WAIT);
		break;
	
	case ACTIVATION_WAIT:
		break; 
	
	case ACTIVATION_HIDE: 
		if (activationTime >= 1)
		{
			state = GAME;
			ChangeState_Game(GAME_SHOW);
		} 
		break; 
  } 
}

private function ChangeState_Activation(newState:int):void
{  
  activationState = newState;
  activationTime = 0;
}

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


private var activationButtonBitmap:BitmapData = null;
private function Draw_ActivationButton():void
{
  if (activationButtonBitmap == null)
  {
    activationButtonBitmap = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,true,0x00000000);
    activationButtonBitmap.draw(new activationButtonImg());
  }
  
  screenBuffer.copyPixels(activationButtonImg,
						new Rectangle(300,300,200,200),
						new Point(300,300+(pressedOption != -1 ? -1:0) ));

 
}


private function MouseDown_Activation(event:MouseEvent):void 
{ 

	if (activationState == ACTIVATION_WAIT)
	{
		//PlaySound(OPTIONSELECTED_SOUND); 
	}	
}

private function MouseUp_Activation(event:MouseEvent):void 
{ 
	var mx:int = event.localX;
	var my:int = event.localY;
	
    if (activationState == ACTIVATION_WAIT)
	{
		ChangeState_Activation(ACTIVATION_HIDE);
		pressedOption = 0;
	}
}


