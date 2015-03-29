
AlarmClock clock = new AlarmClock();

void setup()
{
  clock.start();
  size(400,400);
}


void draw()
{
  clear();
  clock.draw();
}
  
