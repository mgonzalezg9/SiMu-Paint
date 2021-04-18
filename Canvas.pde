public class Canvas {
  private final color CANVAS_COLOR = color(255);
  private final color DRAW_COLOR = color(0);

  private PVector leftCorner, rightCorner;
  private PGraphics pg;
  
  public Canvas(float x1, float y1, float x2, float y2) {
    this.leftCorner = new PVector(x1, y1);
    this.rightCorner = new PVector(x2, y2);
    int w = (int) (x2 - x1);
    int h = (int) (y2 - y1);
    this.pg = createGraphics(w, h);
  }
  
  public void drawLine(float x1, float y1, float x2, float y2) {
    pg.beginDraw();
    pg.fill(DRAW_COLOR);
    pg.line(x1, y1, x2, y2);
    pg.endDraw();
  }
  
  public void erase(float x, float y) {
    pg.beginDraw();
    pg.fill(CANVAS_COLOR);
    pg.noFill();
    pg.line(x, y, x, y);
    pg.endDraw();
  }
  
  public void save() {
    pg.save("prueba.png");
  }
  
  public void display() {
    fill(CANVAS_COLOR);
    rectMode(CORNERS);
    rect(leftCorner.x, leftCorner.y, rightCorner.x, rightCorner.y);
    rectMode(CORNER);
    image(pg, leftCorner.x, leftCorner.y);
  }
}
