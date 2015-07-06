//activation state:fade in, wait, and fade out
private static const ACTIVATION_SHOW:int = 1;
private static const ACTIVATION_WAIT:int = 2;
private static const ACTIVATION_HIDE:int = 3;

//game level is 1 from begining
private static const ACTIVATION_GAME_LEVEL:int = 1;

//activationState = fade in / wait / fade out
private var activationState:int = ACTIVATION_SHOW;

//count the time from new state of activation
private var activationTime:Number = 0;

//check if Go button is pressed
private var pressedOption:int = -1;



private function Draw_Activation(elapsedTime:Number):void
{ 
  activationTime += elapsedTime;

  Draw_TitleScreen();
  Draw_ActivationButton(); 

  switch (activationState)
  {
	case ACTIVATION_SHOW: 
		//fade in effect
		Apply_FadeEffect(FADE_EFFECT_TIME - activationTime); 
		
		//fade effect last for 1 sec ( set in Effect.as )
		if (activationTime >= FADE_EFFECT_TIME)
			ChangeState_Activation(ACTIVATION_WAIT);
		break;
	
	case ACTIVATION_WAIT:
		break; 
	
	case ACTIVATION_HIDE: 
		
		if (activationTime >= 1) // should not wait 1 sec
		{
			//change state to Game
			state = GAME;
			//initial Game, level 1 from begining
			New_Game(ACTIVATION_GAME_LEVEL);
		} 
		break; 
  } 
}

//activationState = fade in / wait / fade out
private function ChangeState_Activation(newState:int):void
{  
  activationState = newState;
  activationTime = 0;
}



private function MouseDown_Activation(event:MouseEvent):void 
{ 

	if (activationState == ACTIVATION_WAIT)
	{
		
	}	

}

private function MouseUp_Activation(event:MouseEvent):void 
{ 
	var mx:int = event.localX;
	var my:int = event.localY;
	
    if (activationState == ACTIVATION_WAIT)
	{
		ChangeState_Activation(ACTIVATION_HIDE);
		PlaySound(PRESSBUTTON); 
		//button pressed 
		pressedOption = 0;
	}
}

