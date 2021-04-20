import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.filechooser.FileNameExtensionFilter;

public class Canvas {
  private final color CANVAS_COLOR = color(255);
  private final color DRAW_COLOR = color(0);

  private PVector leftCorner;
  private int w, h;
  private PGraphics pg;
  
  public Canvas(float x1, float y1, float x2, float y2) {
    this.leftCorner = new PVector(x1, y1);
    this.w = (int) (x2 - x1);
    this.h = (int) (y2 - y1);
    this.pg = createGraphics(w, h);
  }
  
  public void drawLine(float x1, float y1, float x2, float y2) {
    pg.beginDraw();
    pg.stroke(0);
    pg.strokeWeight(width * selectedStroke / 100);
    pg.fill(DRAW_COLOR);
    pg.line(x1, y1, x2, y2);
    pg.endDraw();
  }
  
  public void erase(float x, float y) {
    pg.beginDraw();
    pg.noStroke();
    pg.fill(CANVAS_COLOR);
    pg.rectMode(CENTER);
    pg.rect(x, y, width/(50 / (selectedStroke + 1)), width/(50 / (selectedStroke + 1)));
    pg.rectMode(CORNER);
    pg.endDraw();
  }
  
  public void open() {
    JFileChooser fileChooser = new JFileChooser();
    fileChooser.setDialogTitle("Open a file");
    fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
    fileChooser.setFileFilter(new FileNameExtensionFilter("Image (.gif, .jpg, .tga, .png)", "jpg", "jpeg", "png", "JPG", "JPEG", "PNG", "GIF", "gif", "TGA", "tga"));
    fileChooser.setAcceptAllFileFilterUsed(false);

    fileChooser.showDialog(new JFrame(), "Load");
    File selectedFile = fileChooser.getSelectedFile();
    if (selectedFile != null) {
        PImage image = loadImage(selectedFile.getAbsolutePath());
        
        if (image != null) {
          image.resize(w, h);

          pg.beginDraw();
          pg.image(image, 0, 0);
          pg.endDraw();
        }
    }
  }
  
  public void save() {
    JFileChooser fileChooser = new JFileChooser();
    fileChooser.setDialogType(JFileChooser.SAVE_DIALOG);
    fileChooser.setDialogTitle("Save Image");
    
    FileNameExtensionFilter filter = new FileNameExtensionFilter("Portable Network Graphics", "png");
    fileChooser.addChoosableFileFilter(filter);
    fileChooser.setFileFilter(filter);
    fileChooser.setAcceptAllFileFilterUsed(false);

    int option = fileChooser.showSaveDialog(new JFrame());
    if (option == JFileChooser.APPROVE_OPTION) {
        String filename = fileChooser.getSelectedFile().getPath();
        
        if (!filename.endsWith(".png")) {
            filename = filename + ".png";
        }
            
        pg.save(filename);
    }
  }
  
  public void display() {
    fill(CANVAS_COLOR);
    rect(leftCorner.x, leftCorner.y, w, h);
    image(pg, leftCorner.x, leftCorner.y);
  }
}
