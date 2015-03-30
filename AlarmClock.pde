
class AlarmClock extends Clock
{
  private ClockTime mAlartTime;
  private color mAlartColor;
  private boolean mAlart=false;
  private SoundFile mSoundFile;
  private boolean mSoundStart=false;
  AlarmClock() {
    super();
    mAlartTime = new ClockTime();
    mAlartColor = color(255, 0, 0);
  }

  void setSoundFile(SoundFile file)
  {
    mSoundFile = file;
  }

  void setTimer()
  {
    this.mAlart =true;
  }

  void setAlartTime(final int hour, final int minute, final int second)
  {
    this.mAlartTime.setTime(hour, minute, second);
  }

  void draw()
  {
    super.draw();

    if (this.mAlart)
    {
      if (this.mAlartTime.time() < this.mClockTime.time())
      {
        clear();
        textSize(this.mTextSize);
        fill(this.mAlartColor);
        text( "@Alart", mPos.x, mPos.y);

        if (!this.mSoundStart)
        {
          mSoundFile.play();
          this.mSoundStart =true;
        }
      }
    }
  }
}
