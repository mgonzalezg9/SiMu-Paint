public class ColorPicker {
  private static final int RECT_SIZE = 50;
  
  private PVector leftCorner;
  private float w, h;
  
  public ColorPicker(float x1, float y1, float x2, float y2) {
    this.leftCorner = new PVector(x1, y1);
    this.w = (int) (x2 - x1);
    this.h = (int) (y2 - y1);
  }
  
  public void display() {
    noStroke();
    colorMode(HSB, w - leftCorner.x);
    for (int i = (int) leftCorner.x; i < w; i += RECT_SIZE) {
      fill(i - leftCorner.x, w - leftCorner.x, w - leftCorner.x);
      rect(i, leftCorner.y, RECT_SIZE, h);
      /*stroke(i, j, 100);
      point(i, j);*/
    }
    stroke(0);
  }
}
