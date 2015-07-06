//three state in Game: show /play /time's up
private static const GAME_SHOW:int = 1;
private static const GAME_PLAY:int = 2;
private static const GAME_TIMES_UP:int = 3;

// define the play time here
private static const GAME_TOTAL_TIME:int = 60;

// initial Game state is show
private var gameState:int = GAME_SHOW;

//count different time from begining of each game state 
private var gameTime:Number = 0;

//fruit drop one by one when playing
private var timeBetweenFruits:Number = 0;

//the second lastest fruit
private var prevFruitTime:Number = 0;

//check if the palyer is ready 
private var pressBegin:int = -1;

//basket class
private	var basket:Basket 	= null;
//fruit class
private	var newFruit:Fruits = null;

//array holds all dropping fruits
private var fruits:Array = new Array();

//game parameters
private	var score:int ;
private	var speed:Number ;
private var level:int ;


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
		//game playing code
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

//three state in Game: show /play /time's up
private function ChangeState_Game(newState:int):void
{
//add sound effect here

  gameState = newState;
  gameTime = 0;
}

//function control the game playing
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

// set next fruit according to time elapsed since last fruit drop
private function Catching_SetNextFruit(elapsedTime:Number):void
{
	prevFruitTime += elapsedTime;
	if (prevFruitTime >= timeBetweenFruits)
	{
		Catching_NewFruit();
		prevFruitTime = 0;
	}
}

//create new fruit to drop down
private function Catching_NewFruit():void
{
	//good fruits has vit D
	var goodFruits:Array = [WATERMELON,STRAWBERRY,POMEGRANATE,PINEAPPLE,PEACH,
							ORANGE,NUT,MANGO,FLG];
	//bad fruit is a boom
	var badFruits:Array	=[BOOM];
	var r:int = 0;
	
	//create different fruit classes randomly
	if (Math.random()<.7){
		r = Math.floor(Math.random()*goodFruits.length);
		newFruit = new Fruits(goodFruits[r]);
		newFruit.typeStr = GOODOBJECT;
	} else {
		r = Math.floor(Math.random()*badFruits.length);
		newFruit = new Fruits(badFruits[r]);
		newFruit.typeStr = BADOBJECT;
	}
	
	timeBetweenFruits = 0.5+Math.random();
	newFruit.mx = Math.random()*800;
	//push new fruit to the  array of dropping fruits
	fruits.push(newFruit);
}

//control the movement of the fruits
// and remove fruits that dropped out of screen or collected by basket
// also count scores
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
			
		fruits.splice(i,1);
		}

	}	
}

// to see whether a fruit is collect by basket or not
private function Catching_HitTest(fruit:Fruits,basket:Basket):Boolean
{

	if (basket.mx <= fruit.mx && basket.mx+80 >=fruit.mx)
		if(basket.my <= fruit.my+25 && basket.my +20 >= fruit.my+25)
		{
			switch (fruit.typeStr)
			{
				case GOODOBJECT:
					PlaySound(GOODFRUITCATCHED); 
				break;
				case BADOBJECT:
					PlaySound(BOOMCATCHED); 
				break;
			}

			return true;
		}
	return false;
}

//draw Time and score
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
	if (gameState== GAME_SHOW)
	{	PlaySound(PRESSBUTTON); 
		pressBegin = 0;
	}
}

//handling mouse event according to different stage
private function MouseMoved_Game(event:MouseEvent):void 
{
//do nothing
}
