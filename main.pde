import processing.sound.*;

// sound  http://www.hmix.net/
SoundFile file;

AlarmClock clock = new AlarmClock();

void setup()
{
  clock.setColor(color(255, 255, 255));
  clock.setSoundFile(new SoundFile(this, "n99.mp3"));
  clock.start();
  clock.setAlartTime(6, 00, 0);
  clock.setTimer();
  size(400, 400);
}

void draw()
{
  clear();
  clock.draw();
}
  
