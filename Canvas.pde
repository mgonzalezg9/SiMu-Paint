import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.filechooser.FileNameExtensionFilter;

public class Canvas {
  private final color CANVAS_COLOR = color(255);
  private final color DRAW_COLOR = color(0);

  private PVector leftCorner, startPoint;
  private int w, h;
  private PGraphics graphics, preview;
  
  public Canvas(float x1, float y1, float x2, float y2) {
    this.leftCorner = new PVector(x1, y1);
    this.w = (int) (x2 - x1);
    this.h = (int) (y2 - y1);
    this.graphics = createGraphics(w, h);
    this.preview = createGraphics(w, h);
    this.preview.beginDraw();
    this.preview.endDraw();
  }
  
  public void setStartPoint(PVector point) {
    this.startPoint = point;
  }
  
  public void pencil(float x1, float y1, float x2, float y2) {
    graphics.beginDraw();
    graphics.stroke(0);
    graphics.strokeWeight(width * selectedStroke / 100);
    graphics.fill(DRAW_COLOR);
    graphics.line(x1, y1, x2, y2);
    graphics.endDraw();
  }
  
  public void line(float x, float y) {
    preview.beginDraw();
    preview.clear();
    preview.stroke(0);
    preview.strokeWeight(width * selectedStroke / 100);
    preview.fill(DRAW_COLOR);
    preview.line(startPoint.x, startPoint.y, x, y);
    preview.endDraw();
  }
  
  public void rectangle(float x, float y) {
    preview.beginDraw();
    preview.clear();
    preview.stroke(0);
    preview.strokeWeight(width * selectedStroke / 100);
    preview.fill(CANVAS_COLOR);
    preview.rectMode(CORNERS);
    preview.rect(startPoint.x, startPoint.y, x, y);
    preview.endDraw();
  }
  
  public void erase(float x, float y) {
    graphics.beginDraw();
    graphics.noStroke();
    graphics.fill(CANVAS_COLOR);
    graphics.rectMode(CENTER);
    graphics.rect(x, y, width/(50 / (selectedStroke + 1)), width/(50 / (selectedStroke + 1)));
    graphics.endDraw();
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

          graphics.beginDraw();
          graphics.image(image, 0, 0);
          graphics.endDraw();
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
            
        /*PGraphics aux = createGraphics(w, h);
        aux.beginDraw();
        aux.background(255);
        aux.image(graphics, 0, 0);
        aux.endDraw();
        aux.save(filename);*/
        
        graphics.save(filename);
    }
  }
  
  public void display() {
    fill(CANVAS_COLOR);
    rect(leftCorner.x, leftCorner.y, w, h);
    image(graphics, leftCorner.x, leftCorner.y);
    image(preview, leftCorner.x, leftCorner.y);
  }
  
  public void endPreview() {
    // Saves the preview layer
    graphics.beginDraw();
    graphics.image(preview, 0, 0);
    graphics.endDraw();
    
    // Resets the preview layer
    preview = createGraphics(w, h);
    preview.beginDraw();
    preview.endDraw();
  }
}
