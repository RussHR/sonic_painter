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
  
  stroke(red, green, blue, 255);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

