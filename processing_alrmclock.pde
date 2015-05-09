//https://processing.org/reference/libraries/sound/SoundFile.html
import processing.sound.*;


AlarmClock clock = new AlarmClock();

int hour = 6;
int minute = 0;

String musicFilePath;
String musicFileName;

void setup()
{
    size(400, 400);
    clocksetup();
}

void clocksetup()
{
  clock.setColor(color(255, 255, 255));
  clock.setTitleFont(loadFont("Serif-32.vlw"));
  clock.start();
  clock.setAlartTime(hour, minute, 0);
  clock.setTimer();

}

void draw()
{
  clear();
  textSize(20);
  fill(color(255, 255, 255));
  text("hour: a:- d:+  minute: w:+ s:-", 50, 30);
  text("music: m play:p ",50,60);
    
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
  clock.setSoundFile(new SoundFile(this, musicFilePath), musicFileName);
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
  case 'm':
    selectInput("Select Alart File", "fileSelected");
    break;
  case 'p':
    clock.forcePlayMusic();
    break;
  }

  clock.setAlartTime(hour, minute, 0);
}

