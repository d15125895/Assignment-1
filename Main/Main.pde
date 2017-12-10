import ddf.minim.*;


Space_field s;
Cabin  c;
Radar radar;
Minim minim;
AudioPlayer player;
AudioPlayer alarmSound;
Alarm alarm;


void setup() {

  size (800, 600);
  background (0);
  stroke(255);
  //noCursor();
  minim = new Minim(this);

  s = new Space_field();
  c = new Cabin();
  radar = new Radar(width/2, height/1.16, 75, 0.5, 200);
  alarm = new Alarm(width/1.3, height/1.2, 75, 0.5, 200);

  player = minim.loadFile("spaceship-atmosphere.wav");
  alarmSound = minim.loadFile("alarm.mp3");
}
void draw () {

  background (0);
  noFill();
  stroke(17, 255, 41);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 50, 50); 
  ellipse(mouseX, mouseY, 15, 15);
  ellipse(mouseX, mouseY, 5, 5);


  s.looping();
  c.draw_cabin();
  radar.display_Radar();
  radar.movement();
  //alarm.botton();
  //alarm.mousePressed();
  alarm.movement1();
  alarm.display_Alarm();
}




void keyPressed()
{
  if ( player.isPlaying() )
  {
    player.pause();
  }
  // if the player is at the end of the file,
  // we have to rewind it before telling it to play again
  else if ( player.position() == player.length() )
  {
    player.loop();
    player.play();
  } else
  {
    player.play();
  }
}