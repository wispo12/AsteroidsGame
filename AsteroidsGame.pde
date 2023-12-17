Spaceship bob = new Spaceship();
Star[] nightSky = new Star[200];
ArrayList list = new ArrayList (); 
ArrayList<Asteroid> ast = new ArrayList<Asteroid>();
public void setup() 
{
size(500,500); 
for(int i = 0; i < nightSky.length; i++)
{ 
nightSky[i] = new Star(); 
} 
list.add(new Asteroid()); 
list.add(new Asteroid()); 
list.add(new Asteroid()); 
list.add(new Asteroid()); 
list.add(new Asteroid());
} 
public void draw()
{ 
background(0); 
bob.show();
bob.move(); 
for(int i = 0; i < nightSky.length; i++)
{ 
nightSky[i].show(); 
}  
for(int i = 0; i < list.size(); i++)
{ 
list.get(i).move(); 
list.get(i).show(); 
if(dist((float)list.get(i).myCenterX, (float) list.get(i).myCenterY, (float)bob.myCenterX, (float)bob.myCenterY) < 20)
{ 
list.remove(i); 
list.add(new Asteroid());
}  
} 
}
public void keyPressed()
{    
if(key == 'w')   {       bob.accelerate(1);         }   
if(key == 'a')   {      bob.turn(-10.0);   }   
if(key == 'd')   {      bob.turn(10.0);   }  
if(key == ' ')  
{     
bob.setXspeed(0);    
bob.setYspeed(0);    
bob.turn((int)(Math.random()*300+100));     
bob.setXCenter((int)(Math.random()*300+100));   
bob.setYCenter((int)(Math.random()*300+100));     
}
}

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
    fill(0,255,0);
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
