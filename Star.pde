class Star {
  private int myX, myY;
  public Star() {
    myX = ((int)(Math.random()*500));
    myY = ((int)(Math.random()*500));
  }
  public void show() {
    fill((int)(Math.random()*255));
int k=(int)(Math.random()*20)
    ellipse(myX, myY, k, k);
  }
}

