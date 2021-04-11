final color BUTTON_COLOR = color(242, 242, 242);
final color BUTTON_ACCENT_COLOR = color(255, 178, 100);

class Button {
  PImage image;
  PVector location;
  boolean clicked;
  float radius;
  
  Button(PImage image, PVector location) {
    this.image = image;
    this.location = location;
    this.clicked = false;
    this.radius = width/15;
  }
  
  void click() {
    this.clicked = true;
  }
  
  void unclick() {
    this.clicked = false;
  }
  
  boolean clicked() {
    if (mouseX > location.x && mouseX < location.x + radius && mouseY > location.y && mouseY < location.y + radius) {
      this.clicked = true;
      return true;
    }
    return false;
  }
  
  void display() {
    if (clicked) {
      fill(BUTTON_ACCENT_COLOR);
    } else {
      fill(BUTTON_COLOR);
    }
    rect(location.x, location.y, radius, radius);
    image(image, location.x, location.y, radius, radius);
  }
}
