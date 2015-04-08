import processing.sound.*;

// sound  http://www.hmix.net/
SoundFile file;

AlarmClock clock = new AlarmClock();

int hour = 6;
int minute = 0;

void setup()
{
  clock.setColor(color(255, 255, 255));
  clock.setSoundFile(new SoundFile(this, "n99.mp3"));
  clock.start();
  clock.setAlartTime(hour, minute, 0);
  clock.setTimer();
  size(400, 400);
}

void draw()
{
  clear();
  clock.draw();
}

void keyPressed()
{
  switch (key) {
  case 'A':
  case 'a':
    hour--;
    hour = (hour < 0)? 23: hour;
    break;
  case 'D':
  case 'd':
    hour++;
    hour = (hour > 23)? 0: hour;
    break;
  case 'w':
  case 'W':
    minute++;
    minute = (minute>=60)? 0:minute;
    break;
  case 'S':
  case 's':
    minute--;
    minute = (minute<0)? 59:minute;
    break;
  }

  clock.setAlartTime(hour, minute, 0);
}
