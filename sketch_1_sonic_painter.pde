void setup() {
  background(0);
  size(800, 600);
}

void mouseDragged() {
  // find rgb red
  float red = map(mouseX, 0, width, 0, 255);
  // find rgb green
  float green = map(mouseY, 0, width, 0, 255);
  //find rgb blue
  float blue = dist(mouseX, mouseY, width/2, height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  // the faster the speed, the thinner the width
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 20);
  println(lineWidth);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
