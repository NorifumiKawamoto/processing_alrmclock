class ClockTime 
{
  private int mHour=0;
  private int mMinute=0;
  private int mSecond=0;

  ClockTime()
  {
    this.setHour(hour());
    this.setMinute(minute());
    this.setSecond(second());
  }

  public String toString()
  {
    return nf(this.mHour, 2)+':'+nf(this.mMinute, 2)+':'+nf(this.mSecond, 2);
  }

  public void setTime(int hour, int min, int sec)
  {
    this.setHour(hour);
    this.setMinute(min);
    this.setSecond(sec);
  }

  public void setHour(int hour)
  {
    this.mHour = hour;
  }

  public void setMinute(int min)
  {
    this.mMinute = min;
  }

  public void setSecond(int sec)
  {
    this.mSecond = sec;
  }
}
