
AlarmClock clock = new AlarmClock();

void setup()
{
  clock.start();
  clock.setAlartTime(1,20,0);
  clock.setTimer();
  size(400,400);
}


void draw()
{
  clear();
  clock.draw();
}
  
