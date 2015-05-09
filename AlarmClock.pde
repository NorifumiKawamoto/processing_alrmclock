
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
    this.mAlartTime = new ClockTime();
    this.mAlartColor = color(255, 0, 0);
  }

  void fontset()
  {
    this.mFont = createFont("Times-Roman", 32);
    if (this.mFont != null) textFont(this.mFont);

    mInit = true;
  }

  void setSoundFile(SoundFile file, String fileName)
  {
    if (this.mSoundFile!=null) this.mSoundFile.stop();
    this.mSoundFile = file;
    this.mFileName = fileName;
    this.mSoundStart =false;
  }

  void setTitleFont(PFont font)
  {
    this.mTitleFont = font;
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
    if (this.mInit==false) fontset();

    super.draw();
    if (this.mFileName != null) {
      if ( this.mTitleFont != null) {
        textFont(this.mTitleFont);
      }
        textSize(12);
        text("Sound:" + this.mFileName, 50, 100);
        textFont(mFont);
    }
    if (this.mClockTime.time() == 0) {
      this.mSkipFlag = false;
    }
    if (this.mAlart) {
      drawAlart();
    }
  }
  
  void forcePlayMusic()
  {
    this.mSoundFile.stop();
    this.mSoundStart = false;
    playMusic();
    this.mSoundStart = false;
  }
  
  void playMusic()
  {
     if (!this.mSoundStart) {
        this.mSoundFile.play();
        this.mSoundStart =true;
      }
  }

  void drawAlart()
  {
    if (this.mAlartTime.time() < this.mClockTime.time() && !this.mSkipFlag) {
      textSize(this.mTextSize);
      fill(this.mAlartColor);
      text( "@Alart", this.mPos.x, this.mPos.y - 50);
      playMusic();
    }
    textSize(this.mTextSize);
    fill(this.mColor);
    text ("Alart " + this.alartTime(), this.mPos.x - 50, this.mPos.y + 50);
  }

  public String alartTime()
  {
    return this.mAlartTime.toString();
  }
}

