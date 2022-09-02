//Day 3
class Ball {
  float index, offset, pos;
  float scale = 1;
  
  color[] colours = {#f94144, #f9844a, #f9c74f, #90be6d, #43aa8b, #577590, #277da1};
  
  Ball(float index) {
    this.index = index;
    this.offset = -(index + 1)/2;
  }
  
  void move() {
    if (offset > 0 && pos == 420/2
     || offset < 0 && pos == -420/2) {
      offset *= -1;
    }
    
    pos += offset;
  }
  
  void display() {
    color c = colours[int(index)];
    fill(60);
    if (index == 0) {
      rect(-15, -225, 30, 450, 30);
      
      fill(c);
      circle(index, pos, 20);
    } else {
      rect(-15 -index * 40, -225, 30, 450, 30);
      rect(-15 +index * 40, -225, 30, 450, 30);
      
      fill(c);
      circle(-index * 40, pos, 20);
      circle(index * 40, pos, 20);
    } 
  }
}

Ball[] balls;
float speed = 3;

void setup() {
  size(800, 800);
  background(45);
  noStroke();
  
  balls = new Ball[7];
  
  for (int i = 0; i < 7; i++) {
    Ball b = new Ball(i);
    balls[i] = b;
  }
}

void draw() {
  translate(width/2, height/2);
  background(45);
  
  for (Ball b : balls) {
    b.display();
    for (int i = 0; i < speed; i++) {
      b.move();
    }
  }
  
  //saveFrame("images/frame-######.png");
}
