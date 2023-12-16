Spaceship bob = new Spaceship();
Star[] sky = new Star[75];
ArrayList<Asteroid> cl = new ArrayList<Asteroid>();
ArrayList<Bullets> ab = new ArrayList<Bullets>();
public void setup() {
   
  size(500, 500);
  for (int i = 0; i < sky.length; i++) {
    sky[i] = new Star();
  }
  for (int i = 0; i < 25; i++) {
    cl.add(new Asteroid());
  }
}
public void draw() {
   
  background(170, 51, 106);
  bob.show();
  bob.move();
  for (int i = 0; i < sky.length; i++) {
    sky[i].show();
    fill(255);
  }
  for (int i = 0; i < cl.size(); i++) {
    cl.get(i).show();
    cl.get(i).move();


    float d = dist((float)bob.getX(), (float)bob.getY(), (float)cl.get(i).getX(), (float)cl.get(i).getY());
    if (d<13) {
      cl.remove(i);
      i--;
    }
  }
  for (int i = 0; i< ab.size(); i++) {
    for (int e = 0; e < cl.size(); e++) {
      float d = dist((float)ab.get(i).getX(), (float)ab.get(i).getY(), (float)cl.get(e).getX(), (float)cl.get(e).getY());
      if (d<10)
      {
        ab.remove(i);
        cl.remove(e);
        break;
      }
    }
  }
}
public void keyPressed() {
  if (key == 'w') {
    bob.accelerate(1);
  }
  if (key == 'a') {
    bob.turn(-10 );
  }
  if (key == 'd') {
    bob.turn(10 );
  }
  if (key == 's') {
    bob.setXspeed(0);
    bob.setYspeed(0);
    bob.turn((int)(Math.random()*300+100));
    bob.setXCenter((int)(Math.random()*300+100));
    bob.setYCenter((int)(Math.random()*300+100));
  }
  if (key == ' ') {
    ab.add(new Bullets(bob));
  }
}
