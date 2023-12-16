class Bullet extends Floater{
  Bullet(Spaceship theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = theShip.getPointDirection();
   
    // Accelerate the bullet
    accelerate(6.0);
  }
 
  public double getX(){
  return myCenterX;
  }
  public double getY(){
  return myCenterY;
  }

  // Override the show() method for circular bullets
  void show() {
    fill(255); // Set color to white (you can change this)
    ellipse((float)myCenterX, (float)myCenterY, 10, 10); // Adjust size as needed
  }
}
