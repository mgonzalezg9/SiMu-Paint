private static int CANVAS_MARGIN;
private final color CANVAS_COLOR = color(255);

public class Canvas {
  
  public Canvas() {
    CANVAS_MARGIN = height/40;
  }
  
  void display() {
    fill(CANVAS_COLOR);
    rectMode(CORNERS);
    rect(BUTTON_SIZE + CANVAS_MARGIN, BUTTON_SIZE + CANVAS_MARGIN, width - CANVAS_MARGIN, height - CANVAS_MARGIN);
    rectMode(CORNER);
  }
}
