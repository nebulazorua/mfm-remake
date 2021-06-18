package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;

class AfterImage extends FlxSprite {
  public function new(character:Character){
    super();

    frames = character.frames;
    var curAnim = character.animation.curAnim;
    alpha = .75;
    setGraphicSize(Std.int(character.width),Std.int(character.height));
    scrollFactor.set(character.scrollFactor.x,character.scrollFactor.y);
    updateHitbox();
    animation.add("current",curAnim.frames,0,false);
    flipX = character.flipX;
    flipY = character.flipY;
    animation.play('current',true);
    animation.curAnim.curFrame=curAnim.curFrame;
    x = character.x;
    y = character.y;
    offset.x = character.offset.x;
    offset.y = character.offset.y;

    switch(character.curCharacter){
      case 'bf':
        color = 0x34B4EB;
      case 'sarvente-dark':
        color = 0xF54589;
      case 'sarvente':
        color = 0xF595BA;
      case 'ruv':
        color = 0x7F43BA;
      default:
        color = 0xAAAAAA;
    }

    var increment = FlxG.random.float(.075,.1);
    new FlxTimer().start(.025, function(tmr:FlxTimer)
    {
      alpha -= increment;
      if(alpha>0){
        tmr.reset(.025);
      }else{
        kill();
        destroy();
      }
    });


  }
}
