Spaceship bob = new Spaceship();
Star[] nightSky = new Star[50];
ArrayList<Bullet> bullets;
ArrayList<Asteroid> ast = new ArrayList<Asteroid>();
public void setup()
{
size(400,400);
for(int b = 0; b < nightSky.length; b++){
  nightSky[b] = new Star();
  }
  for(int j = 0; j < 20; j++){
    ast.add(new Asteroid());
  }
  bullets = new ArrayList<Bullet>();
}
public void draw()
{
  background(0);
  bob.show();
  bob.move();
  for(int i = 0; i < nightSky.length; i++){
  nightSky[i].show();
  }
   for (int i = 0; i < ast.size(); i++){
    ast.get(i).move();
    ast.get(i).show();
    float dd = dist((float)bob.getX(), (float)bob.getY(), (float)ast.get(i).getX(), (float)ast.get(i).getY());
    if (dd < 10)
    ast.remove(i);
  }
  for (Bullet bullet : bullets) {
    bullet.show();
    bullet.move();
  }
  for (int a = 0; a < ast.size(); a++) {
    ast.get(a).move();
    ast.get(a).show();
  for (Bullet bullet : bullets) {
    float d = dist((float)bullet.getX(), (float)bullet.getY(), (float)ast.get(a).getX(), (float)ast.get(a).getY());
    if (d < 10) {
        ast.remove(a);
    }
}
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
  if(key == 'e')
  {
     bob.setXspeed(0);
     bob.setYspeed(0);
     bob.turn((int)(Math.random()*300+100));
     bob.setXCenter((int)(Math.random()*300+100));
      bob.setYCenter((int)(Math.random()*300+100));

 }
 if (key == ' ') {
    // Add a new Bullet to the ArrayList
    bullets.add(new Bullet(bob));
  }
}
