int minutehand = 90;
int hourhand = 60;
int secondhand = 100;
Button button1;
Button button2;

int bg = 30;

void setup() {
  size(300, 400);
  button1 = new Button(width/2 - 50, width/2 + 200, 50, 250);
  button2 = new Button(width/2 + 50, width/2 + 200, 50, 30);
}

void draw() {
  background(bg);
  //clock face
  fill(180);
  strokeWeight(4);
  ellipse(width/2, width/2, width-50, width-50);
  //clock hands
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  stroke(220);
  strokeWeight(1);
  line(width/2, width/2, width/2 + secondhand * cos(s), width/2 + secondhand * sin(s));
  strokeWeight(3);
  line(width/2, width/2, width/2 + minutehand * cos(m), width/2 + minutehand * sin(m));
  strokeWeight(5);
  line(width/2, width/2, width/2 + hourhand * cos(h), width/2 + hourhand * sin(h));

  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    if(a % 90 == 0) {
      stroke(1);
      strokeWeight(5);
      float x = width/2 + cos(angle) * (secondhand+10);
      float y = width/2 + sin(angle) * (secondhand+10);
      vertex(x, y);
    } else {
      stroke(250);
      strokeWeight(5);
      float x = width/2 + cos(angle) * (secondhand+5);
      float y = width/2 + sin(angle) * (secondhand+5);
      vertex(x, y);
    }
  }
  endShape();
  button1.update(mouseX, mouseY);
  button2.update(mouseX, mouseY);
}

void mousePressed() {
  if(button1.over(mouseX, mouseY)) {
    bg = button1.col;
  }
  if(button2.over(mouseX, mouseY)) {
    bg = button2.col;
  }
}
