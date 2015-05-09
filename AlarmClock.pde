
class AlarmClock extends Clock
{
  private ClockTime mAlartTime;
  private color mAlartColor;
  private boolean mAlart=false;
  private SoundFile mSoundFile;
  private String mFileName;
  private boolean mSoundStart=false;

  private boolean mSkipFlag=false;
  private PFont mTitleFont;
  private PFont mFont;
  private boolean mInit=false;
  
  AlarmClock() {
    super();
    mAlartTime = new ClockTime();
    mAlartColor = color(255, 0, 0);
  }
  
  void fontset()
  {
    mFont = createFont("Times-Roman", 32);
    if (mFont != null) textFont(mFont);
    
    mInit = true;
  }
  
  void setSoundFile(SoundFile file,String fileName)
  {
    mSoundFile = file;
    mFileName = fileName;
  }

  void setTitleFont(PFont font)
  {
    mTitleFont = font;
  }
  
  void setTimer()
  {
    this.mAlart =true;
  }

  void setAlartTime(final int hour, final int minute, final int second)
  {
    this.mAlartTime.setTime(hour, minute, second);

    if (this.mAlartTime.time() < this.mClockTime.time())
    {
      this.mSkipFlag = true;
    } else {
      this.mSkipFlag = false;
    }
  }
  
  void draw()
  {
    if (mInit==false) fontset();
    
    super.draw();
    textSize(20);
    fill(color(255, 255, 255));
    text("hour: a:- d:+  minute: w:+ s:-", 50, 50);
    if (mFileName != null) {
      if ( mFont != null) {
        textFont(mTitleFont);
        textSize(12);
        text("Sound:" + mFileName,50,80);
        textFont(mFont);
      }
    }
    if (this.mClockTime.time() == 0) {
      this.mSkipFlag = false;
    }
    if (this.mAlart) {
      if (this.mAlartTime.time() < this.mClockTime.time() && !this.mSkipFlag) {
        textSize(this.mTextSize);
        fill(this.mAlartColor);
        text( "@Alart", mPos.x, mPos.y - 50);

        if (!this.mSoundStart) {
          mSoundFile.play();
          this.mSoundStart =true;
        }
      }

      textSize(this.mTextSize);
      fill(this.mColor);
      text ("Alart " + this.alartTime(), mPos.x - 50, mPos.y + 50);
    }
  }

  public String alartTime()
  {
    return this.mAlartTime.toString();
  }
}
