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

private var nextFruit:Timer;
private var fruits:Array = new Array();

private function New_Game():void
{  
	level = 1;
	basket = new Basket(); 

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
	basket.x = mouseX;
	basket.y = SCREEN_HEIGHT -100;
	
	basket.draw(screenBuffer);
	Catching_SetNextFruit();
	Catching_MoveFruits();
}

private function Catching_SetNextFruit():void
{

	nextFruit = new Timer (1000+Math.random()*1000,1);
	nextFruit.addEventListener(TimerEvent.TIMER_COMPLETE,Catching_NewFruit);
	nextFruit.start();

}

private function Catching_NewFruit(e:Event):void
{

	var goodFruits:Array = ["Flg",
							"Orange",
							"Peach",
							"Watermelon",
							"Mango"];
							
	var badFruits:Array = ["Nut",
							"Pineapple",
							"Ponegranate",
							"Strawberry",
							"PeachB"];
	if (Math.random()<.5){
		var r:int = Math.floor(Math.random()*goodFruits.length);
		var classRef:Class = getDefinitionByName("Classes."+goodFruits[r]) as Class;
		var newFruit:MovieClip = new classRef(); 
		newFruit.typestr = "good";
	} else {
		r = Math.floor(Math.random()*badFruits.length);
		classRef = getDefinitionByName(badFruits[r]) as Class;
		newFruit = new classRef(); 
		newFruit.typestr = "bad";
	}
	newFruit.x = Math.random()*800;
	fruits.push(newFruit);
	for(var i:int=0; i<fruits.length;i++)
	{
		fruits[i].draw(screenBuffer);
	}
	Catching_SetNextFruit();

}

private function Catching_MoveFruits():void
{
	for(var i:int=fruits.length-1;i>=0;i--) {
		fruits[i].y += speed;
		if (fruits[i].y > 400) {
			fruits.splice(i,1);
		}
		
		if (fruits[i].hitTestObject(basket)) {
			if (fruits[i].typestr == "good") {
				score += 5;
			} else {
				score -= 1;
			}
			if (score < 0) score = 0;
			
			//scoreDisplay.text = "Score: "+ score;
			fruits.splice(i,1);
		}
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
	pressBegin = 0;
}

//handling mouse event according to different stage
private function MouseMoved_Game(event:MouseEvent):void 
{

}