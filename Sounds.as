private static const GOODFRUITCATCHED:int = 1;
private static const BOOMCATCHED:int = 2;
private static const PRESSBUTTON:int = 3;

private var soundVolume:Number = 0.7;

[Embed(source="Sounds/GoodFruitCatched.mp3")] private var goodFruitCatchedSnd:Class;
[Embed(source="Sounds/BoomCatched.mp3")] private var boomCatchedSnd:Class;
[Embed(source="Sounds/PressButton.mp3")] private var pressButtonSnd:Class;

private function PlaySound(type:int) : void
{
  var sfx:Sound = null;

  switch (type)
  {
	case GOODFRUITCATCHED:
		sfx = new goodFruitCatchedSnd() as Sound;
    break;
	
	case BOOMCATCHED:
		sfx = new boomCatchedSnd() as Sound;
	break;
	
	case PRESSBUTTON:
		sfx = new pressButtonSnd() as Sound;
	break;
  }

  if (sfx != null)
    sfx.play(0,0,new SoundTransform(soundVolume));
}

