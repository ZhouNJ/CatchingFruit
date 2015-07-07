private var PressResult:int = -1;
private var resultTime:Number = 0;
private static const PLAY_AGAIN:int			= 0;
private static const NEXT_LEVEL:int			= 1;

private var resultScore:ScoreAndTime	= null;
private var resultLevel:ScoreAndTime	= null;
private static const SCORE_RESULT_POS_X:int			= 400;
private static const SCORE_RESULT_POS_Y:int			= 220;

private static const LEVEL_RESULT_POS_X:int			= 400;
private static const LEVEL_RESULT_POS_Y:int			= 150;

private static const BUTTON_PRESSED:Boolean = true;
private static const BUTTON_NOT_PRESSED:Boolean = false;

private function Draw_Result(elapsedTime:Number):void
{
	resultTime += elapsedTime;
	
	Draw_GameBackground();
	Draw_Score_Result();
	Draw_Level_Result();
	Draw_PlayAgain(BUTTON_NOT_PRESSED);
	Draw_NextLevel(BUTTON_NOT_PRESSED);
	
	// play same level again or play next level(speed is faster)
	// no level limits
	// !!!!-------------------------------------problem may occur when fruits drop too fast -------
	switch(PressResult)
	{
		case PLAY_AGAIN:
		{
			Draw_PlayAgain(BUTTON_PRESSED);
			state = GAME;
			New_Game(level);
			PressResult = -1;
			break;
		}
		case NEXT_LEVEL:
		{
			Draw_NextLevel(BUTTON_PRESSED);
			state = GAME;
			if(level >=10)
				New_Game(level);
			else 
				New_Game(++level);
			PressResult = -1;
			break;
		}
	}
}

// draw score in result page
private function Draw_Score_Result():void
{
		Draw_Score();
		resultScore = new ScoreAndTime(score,
									SCORE_RESULT_POS_X,
									SCORE_RESULT_POS_Y);
		resultScore.draw(screenBuffer);

}

private function Draw_Level_Result():void
{
		Draw_Level();
		resultLevel = new ScoreAndTime(level,
									LEVEL_RESULT_POS_X,
									LEVEL_RESULT_POS_Y);
		resultLevel.draw(screenBuffer);

}




//handling mouse event according to different stage
private function MouseDown_Result(event:MouseEvent):void 
{ 

		

} 

//handling mouse event according to different stage
private function MouseUp_Result(event:MouseEvent):void 
{
	var mx:int = mouseX;
	var my:int = mouseY;
	PlaySound(PRESSBUTTON); 

	if (mx>=0 && mx <= 300 && my >=300 && my <=500)
		PressResult = PLAY_AGAIN;
	else
	if (mx >= 500 && mx <= 800 && my>=300 && my <= 500)
		PressResult = NEXT_LEVEL;
}

//handling mouse event according to different stage
private function MouseMoved_Result(event:MouseEvent):void 
{

}
