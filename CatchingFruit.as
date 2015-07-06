import flash.display.*;
import flash.events.*;
import mx.events.*;
import mx.controls.*;
import flash.external.ExternalInterface;
import Classes.*;


import flash.text.*;

include "Game.as";
include "Effect.as";
include "Result.as";
include "Image.as";
include "Sounds.as";
include "Activation.as"

//define width and height of the content window
private static const SCREEN_WIDTH:int = 800;
private static const SCREEN_HEIGHT:int = 600;

private var initializationCompleted:Boolean = false;
private var screenBuffer:BitmapData = null;

//three stage: activation, game, result.
private static const ACTIVATION:int = 0;
private static const GAME:int = 1;
private static const RESULT: int =2;




//initial stage:Activation
private var state:int =ACTIVATION;

//initialize screenBuffer
public function Init():void
{
	screenBuffer = new BitmapData(SCREEN_WIDTH,SCREEN_HEIGHT,false,0x00000000);
	initializationCompleted = true;
	if (ExternalInterface.available)
	state = ACTIVATION;
}

//update frame
private var prevTime:Date = null;
private function UpdateFrame():void
{
	if(!initializationCompleted)
		return;
	
	var currTime:Date = new Date();
	var elapsedTime:Number = 0;
	
	//get elapsedTime between two frames
	if(prevTime != null)
		elapsedTime = (currTime.getTime() - prevTime.getTime())/1000.0;
	
	prevTime = currTime;
	
	//draw the screen content
	Draw(elapsedTime);
	
	gamePanel.graphics.clear(); 
	gamePanel.graphics.beginBitmapFill(screenBuffer, null, false, false);
	gamePanel.graphics.drawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	gamePanel.graphics.endFill(); 
}

//draw screen content accoding to different state
private function Draw(elapsedTime:Number):void
{
  switch (state)
  {
	case ACTIVATION:
		Draw_Activation(elapsedTime);
		break;
	case GAME:
		Draw_Game(elapsedTime);
		break;
	case RESULT:
		Draw_Result(elapsedTime); 
		break; 

  }
}

//handling mouse event according to different stage
private function MouseDown(event:MouseEvent):void 
{ 
  switch (state)
  {
	case GAME:
		MouseDown_Game(event);
		break;
	case RESULT:
		MouseDown_Result(event);
		break;
  }
} 

//handling mouse event according to different stage
private function MouseUp(event:MouseEvent):void 
{ 
  switch (state)
  {
  case ACTIVATION:
    MouseUp_Activation(event);
    break;
  case GAME:
    MouseUp_Game(event);
    break;
  case RESULT:
	MouseUp_Result(event);
	break;
  }
}

//handling mouse event according to different stage
private function MouseMoved(event:MouseEvent):void 
{
  switch (state)
  {
	case GAME:
		MouseMoved_Game(event);
		break;
	case RESULT:
		MouseMoved_Result(event);
		break;
  }
}
