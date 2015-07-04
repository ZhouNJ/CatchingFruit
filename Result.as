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