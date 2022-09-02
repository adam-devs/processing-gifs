//Day 2
class Dot {
  float amount = 2;
  float speed;
  float index;
  float radius;
  
  color[] colours = {#3D75B0, #3DB0A4, #3DB063, #92D051, #FBFF2E, #FFC500, #F7402F, #A1170B};
  
  Dot(float speed, float radius) {
    this.speed = speed;
    this.index = speed;
    this.radius = radius;
  }
  
  void turn() {
    translate(width/2, height/2);
    rotate(radians(speed)/8);
    translate(-width/2, -height/2);
    display();
       
    speed += amount;
  }
  
  void display() {    
    fill(colours[int(index)]);
    
    //4 arcs
    arc(width/2, height/2, radius*2, radius*2, radians(247.5), radians(292.5));
    arc(width/2, height/2, radius*2, radius*2, radians(-22.5), radians(22.5));
    arc(width/2, height/2, radius*2, radius*2, radians(67.5), radians(112.5));
    arc(width/2, height/2, radius*2, radius*2, radians(157.5), radians(202.5));
        
    //single arc
    //arc(width/2, height/2, radius*2, radius*2, radians(245), radians(295), CHORD);
    
    fill(45);
    circle(width/2, height/2, (radius-25)*2);
  }
}

Dot[] dots;

void setup() {
  size(800, 800);
  frameRate(60);
  noStroke();
  
  dots = new Dot[8];
  
  for (int i = 0; i < 8; i++) {
    Dot d = new Dot(i, 75+i*25);
    dots[i] = d;
  }
}

void draw() {
  //saveFrame("frames/line-######.tif");
  background(45);
  fill(255);
  for (int i = 7; i >= 0; i--) {
    dots[i].turn();
  }
}
