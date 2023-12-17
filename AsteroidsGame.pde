Spaceship bob = new Spaceship();
Star[] nightSky = new Star[200];
ArrayList <Asteroid> list = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();

public void setup()
{
size(500,500);
for(int i = 0; i < nightSky.length; i++){
nightSky[i] = new Star();
  }
 list.add(new Asteroid());
 list.add(new Asteroid());
 list.add(new Asteroid());
 list.add(new Asteroid());
 list.add(new Asteroid());
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
for(int i = 0; i < nightSky.length; i++){
nightSky[i].show();
  }
 for(int i = 0; i < list.size(); i++){
 list.get(i).move();
 list.get(i).show();
 if(dist((float)list.get(i).myCenterX, (float) list.get(i).myCenterY, (float)bob.myCenterX, (float)bob.myCenterY) < 20) {
 list.remove(i);
 list.add(new Asteroid());
 }
 }
 
 for(int j = 0; j < bullets.size(); j++){ 
 float d = 0; 
 for(int i = 0; i < list.size(); i++){ 
 d = dist((float)bullets.get(j).getMyCenterX(), (float)bullets.get(j).getMyCenterY(), (float)list.get(i).getX(), (float)list.get(i).getY()); 
 if(d < 30){ 
 bullets.remove(j); 
 list.remove(i); 
 break; 
 } 
 } 
 if(d < 30) break; 
 }
 
 for(int i = 0; i < bullets.size(); i++){
 bullets.get(i).move();
 bullets.get(i).show();

 }
}

public void keyPressed()
{
 
  if(key == 'w')
  {
      bob.accelerate(1);
     
  }
   if(key == 'a')
  {
     bob.turn(-10.0);
  }
   if(key == 'd')
  {
     bob.turn(10.0);
  }
  if(key == ' ')
  {
     bob.setXspeed(0);
     bob.setYspeed(0);
     bob.turn((int)(Math.random()*300+100));
     bob.setXCenter((int)(Math.random()*300+100));
     bob.setYCenter((int)(Math.random()*300+100));
     
 }
 if(key == 'r'){
 bullets.add(new Bullet(bob));
 }

}
