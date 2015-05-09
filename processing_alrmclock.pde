import processing.sound.*;

// sound  http://www.hmix.net/
SoundFile file;

AlarmClock clock = new AlarmClock();

int hour = 6;
int minute = 0;

String musicFilePath;
String musicFileName;

void setup()
{
  selectInput("Select Alart File", "fileSelected");
    size(400, 400);
}

void clocksetup()
{
  clock.setColor(color(255, 255, 255));
  clock.setTitleFont(loadFont("Serif-32.vlw"));
  clock.setSoundFile(new SoundFile(this, musicFilePath), musicFileName);
  clock.start();
  clock.setAlartTime(hour, minute, 0);
  clock.setTimer();

}

void draw()
{
  clear();
  clock.draw();
}

void fileSelected(File selection) 
{
  if (selection == null) {
    println("Default Music");
    musicFilePath ="n99.mp3";
    musicFileName = musicFilePath;
  } else {
    musicFilePath =selection.getAbsolutePath();
    musicFileName = selection.getName();
    println("select " + musicFilePath);
  }
  clocksetup();
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

