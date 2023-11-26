Spaceship bob = new Spaceship();
Star[] sky = new Star[200];
public void setup() {
  size(400, 400);
  for (int i = 0; i < sky.length; i++) {
    sky[i] = new Star();
  }
}
public void draw() {
  background(0);
  bob.show();
  bob.move();
  for (int i = 0; i < sky.length; i++) {
    sky[i].show();
    fill(255);
  }
}
public void keyPressed() {
  if (key == 'w') {
    bob.accelerate(1);
  }
  if (key == 'a') {
    bob.turn(-10.0);
  }
  if (key == 'd') {
    bob.turn(10.0);
  }
  if (key == 's') {
    bob.setXspeed(0);
    bob.setYspeed(0);
    bob.turn((int)(Math.random()*300+100));
    bob.setXCenter((int)(Math.random()*300+100));
    bob.setYCenter((int)(Math.random()*300+100));
  }
}
class Spaceship extends Floater {
  public Spaceship() {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
    myColor = color(255, 0, 0);
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    myCenterX = 200;
    myCenterY = 200;
  }
  public void setXspeed(double x) {
    myXspeed = x;
  }
  public void setYspeed(double y) {
    myYspeed = y;
  }
  public void setXCenter(double x2) {
    myCenterX = x2;
  }
  public void setYCenter(double y2) {
    myCenterY = y2;
  }
}


class Star {
  private int myX, myY;
  public Star() {
    myX = ((int)(Math.random()*500));
    myY = ((int)(Math.random()*500));
  }
  public void show() {
    fill((int)(Math.random()*255));
    ellipse(myX, myY, 5, 5);
  }
}



class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 
