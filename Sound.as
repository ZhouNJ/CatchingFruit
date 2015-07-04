/*
private static const OPTIONSIN_SOUND:int = 1;
private static const OPTIONSOUT_SOUND:int = 2;
private static const OPTIONSELECTED_SOUND:int = 3;

private var soundVolume:Number = 0.7;

//only optionSelected is need in this game
[Embed(source="Sounds/OptionSelected.mp3")] private var optionSelectedSnd:Class;

private function PlaySound(type:int) : void
{
  var sfx:Sound = null;

  switch (type)
  {
	case OPTIONSELECTED_SOUND:
		sfx = new optionSelectedSnd() as Sound;
    break; 
  }

  if (sfx != null)
    sfx.play(0,0,new SoundTransform(soundVolume));
}
*/