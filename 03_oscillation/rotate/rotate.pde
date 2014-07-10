int lineLength = 50;
int r = 20;
float angle = 0;

void setup() {
  size(400, 400);
  ellipseMode(CENTER);

  translate(width/2, height/2);
  line(r/2, 0, lineLength - r/2, 0);
}

void draw() {
  background(244);

  translate(width/2, height/2);
  rotate(radians(angle));
  ellipse(-lineLength - r/2, 0, r, r);
  line(-lineLength, 0, lineLength, 0);
  ellipse(lineLength + r/2, 0, r, r);
  angle += 2;
}
