Spaceship bob = new Spaceship(); 
Star[] nightSky = new Star[200];
 public void setup() {
size(400,400); 
for(int i = 0; i < nightSky.length; i++)
{
nightSky[i] = new Star();  
} 
}
public void draw() 
{
background(0);
bob.show();
bob.move();
for(int i = 0; i < nightSky.length; i++)
{ 
  nightSky[i].show(); 
fill(255);

}  
}
public void keyPressed() 
{   
if(key == 'w') {bob.accelerate(1);}
if(key == 'a') {bob.turn(-10.0);} 
if(key == 'd')   {bob.turn(10.0);}  
if(key == ' ')   
{
bob.setXspeed(0);
bob.setYspeed(0);
bob.turn((int)(Math.random()*300+100));     
bob.setXCenter((int)(Math.random()*300+100));      
bob.setYCenter((int)(Math.random()*300+100));   
} 
} 
class Floater
{     public int corners;
   protected int[] xCorners;
 protected int[] yCorners;   
 protected int myColor;   
 protected double myCenterX,
 myCenterY; 
 protected double myXspeed, myYspeed; 
 protected double myPointDirection; 
 public void accelerate (double dAmount)     
 {            
 double dRadians =myPointDirection * (Math.PI/180);        
 myXspeed += ((dAmount) * Math.cos(dRadians));      
 myYspeed += ((dAmount) * Math.sin(dRadians));         
 }     
 public void turn (double degreesOfRotation)     
 {        
 myPointDirection+=degreesOfRotation;
 }  
 public void move ()   
 {      
 myCenterX += myXspeed;      
 myCenterY += myYspeed;     
 if(myCenterX >width) { myCenterX = 0; }        
 else if (myCenterX<0) { myCenterX = width; }        
 if(myCenterY >height) { myCenterY = 0; }        
 else if (myCenterY < 0)     { myCenterY = height; }    
 }  
 public void show ()  
 { 
 fill(myColor); 
 stroke(myColor);
 translate((float)myCenterX, (float)myCenterY);   
 float dRadians = (float)(myPointDirection*(Math.PI/180));    
 rotate(dRadians);       
 beginShape();    
 for (int nI = 0; nI < corners; nI++)     { vertex(xCorners[nI], yCorners[nI]);     }   
 endShape(CLOSE);
 rotate(-1*dRadians);  
 translate(-1*(float)myCenterX, -1*(float)myCenterY);  
 }  
 } 
 class Spaceship extends Floater
 {    
 public Spaceship()
 {  
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
 myColor = color(255,0,0);  
 myXspeed = 0;   myYspeed = 0; 
 myPointDirection = 0; 
 myCenterX = 200;   
 myCenterY = 200;  
 }     
 public void setXspeed(double x) {   myXspeed = x;   } 
 public void setYspeed(double y) {   myYspeed = y;   }  
 public void setXCenter(double x2) {   myCenterX = x2;   }    
 public void setYCenter(double y2) {   myCenterY = y2;   } 
 } 
 class Star 
 {  
 private int myX, myY; 
 public Star() 
 {   
 myX = (int)(Math.random()*500);    
 myY = (int)(Math.random()*500);   
 }  
 public void show()
 {   
 fill(255);  
 ellipse(myX, myY, 3, 3);  
 } 
 } 
