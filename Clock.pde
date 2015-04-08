class Clock extends Thread
{
  protected color mColor;
  protected int mTextSize;
  protected PVector mPos;
  protected ClockTime mClockTime;

  Clock()
  {
    mClockTime = new ClockTime();
    mColor = color(50, 55, 100);
    mTextSize= 30;
    mPos = new PVector(130, 200);
  }
  public synchronized void run()
  {
    for (;; ) {
      try {
        mClockTime.setTime(hour(), minute(), second());
        Thread.sleep(1000);
      } 
      catch(InterruptedException e) {
        print(e);
      } 
      finally {
      }
    }
  }

  public void setColor(color c)
  {
    this.mColor = c;
  }

  public void draw()
  {
    textSize(this.mTextSize);
    fill(this.mColor);
    text( this.now(), mPos.x, mPos.y);
  }

  public String toString()
  {
    return mClockTime.toString();
  }

  public String now()
  {
    return this.toString();
  }
}
