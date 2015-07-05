private static const GAME_SHOW:int = 1;
private static const GAME_PLAY:int = 2;
private static const GAME_TIMES_UP:int = 3;

private static const GAME_TOTAL_TIME:int = 6;

private var gameState:int = GAME_SHOW;
private var gameTime:Number = 0;
private var timeBetweenFruits:Number = 0;
private var prevFruitTime:Number = 0;

private var pressBegin:int = -1;

private	var basket:Basket 	= null;
private	var newFruit:Fruits = null;

private var fruits:Array = new Array();

private	var score:int ;
private	var speed:Number ;
private var level:int ;

private var nextFruit:Timer;

private static const WATERMELON:int		= 0;
private static const STRAWBERRY:int		= 1;
private static const POMEGRANATE:int	= 2;
private static const PINEAPPLE:int		= 3;
private static const PEACH:int			= 4;
private static const BOOM:int			= 5;
private static const ORANGE:int			= 6;
private static const NUT:int			= 7;
private static const MANGO:int			= 8;
private static const FLG:int			= 9;

private static const GOODOBJECT:int			= 0;
private static const BADOBJECT:int			= 1;

private static const TIME_POS_X:int			= 130;
private static const TIME_POS_Y:int			= 27;
private var playTime:ScoreAndTime	= null;

private static const SCORE_POS_X:int			= 680;
private static const SCORE_POS_Y:int			= 27;
private var playScore:ScoreAndTime	= null;


private function New_Game(gameLevel:int):void
{  
	level = gameLevel;
	score = 0;
	speed = 5.0+gameLevel*2;
	fruits.splice(0,fruits.length);
	basket = new Basket();
	timeBetweenFruits = Math.random();
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
		Catching(elapsedTime);
		DrawNumber_Game();
		
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
	basket.mx = mouseX;
	basket.my = SCREEN_HEIGHT -100;
	
	basket.draw(screenBuffer);
	Catching_SetNextFruit(elapsedTime);
	
	for(var i:int=0; i<fruits.length;i++)
	{
		fruits[i].draw(screenBuffer);
	}
	
	Catching_MoveFruits();
}

private function Catching_SetNextFruit(elapsedTime:Number):void
{
	prevFruitTime += elapsedTime;
	if (prevFruitTime >= timeBetweenFruits)
	{
		Catching_NewFruit();
		prevFruitTime = 0;
	}
}


private function Catching_NewFruit():void
{
	var goodFruits:Array = [WATERMELON,STRAWBERRY,POMEGRANATE,PINEAPPLE,PEACH,
							ORANGE,NUT,MANGO,FLG];
	var badFruits:Array	=[BOOM,BOOM,BOOM,BOOM,BOOM];
	var r:int = 0;
	
	if (Math.random()<.5){
		r = Math.floor(Math.random()*goodFruits.length);
		newFruit = new Fruits(goodFruits[r]);
		newFruit.typeStr = GOODOBJECT;
	} else {
		r = Math.floor(Math.random()*goodFruits.length);
		newFruit = new Fruits(badFruits[r]);
		newFruit.typeStr = BADOBJECT;
	}
	
	timeBetweenFruits = 0.5+Math.random();
	newFruit.mx = Math.random()*800;
	fruits.push(newFruit);
}

private function Catching_MoveFruits():void
{
	for(var i:int=fruits.length-1;i>=0;i--)
	{
		fruits[i].my += speed;
		if (fruits[i].my > 550)
		{
			fruits.splice(i,1);
		}
		
		if(fruits[i]!=null && basket!=null)
		if ( Catching_HitTest(fruits[i],basket) )
		{
			if (fruits[i].typeStr == GOODOBJECT) {
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

private function Catching_HitTest(fruit:Fruits,basket:Basket):Boolean
{

	if (basket.mx <= fruit.mx && basket.mx+80 >=fruit.mx)
		if(basket.my <= fruit.my+25 && basket.my +20 >= fruit.my+25)
			return true;
	return false;
}

private function DrawNumber_Game():void
{
		playTime = new ScoreAndTime(GAME_TOTAL_TIME-int(gameTime),
									TIME_POS_X,
									TIME_POS_Y);
		playTime.draw(screenBuffer);
		playScore = new ScoreAndTime(score,
									SCORE_POS_X,
									SCORE_POS_Y);
		playScore.draw(screenBuffer);
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