public static final int NUM_TOOLS = 9;
public static final int NUM_STROKES = 2;
public static final int NUM_FILTERS = 3;

public static final int PENCIL_TOOL = 0;
public static final int LINE_TOOL = 1;
public static final int RECT_TOOL = 2;
public static final int ELLIPSE_TOOL = 3;
public static final int SROKE_TOOL = 4;
public static final int FILL_TOOL = 5;
public static final int ERASER_TOOL = 6;
public static final int OPEN_TOOL = 7;
public static final int SAVE_TOOL = 8;

public static final int NEGATIVE_FILTER = 0;
public static final int BLUR_FILTER = 1;
public static final int ERODE_FILTER = 2;
public static final int DILATE_FILTER = 3;

public static final int LESS_STROKE = 0;
public static final int MORE_STROKE = 1;

public static final int MIN_STROKE = 0;
public static final int MAX_STROKE = 100;

public ArrayList<Button> createTools() {
  ArrayList<Button> tools = new ArrayList<Button>();
  
  float offset = 0;
  
  Button b = new Button(loadImage("./data/pencil.png"), new PVector(0, offset), BUTTON_SIZE);
  b.click();
  offset += BUTTON_SIZE;
  tools.add(b);
  
  b = new Button(loadImage("./data/line.png"), new PVector(0, offset), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  tools.add(b);
  
  b = new Button(loadImage("./data/rectangle.png"), new PVector(0, offset), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  tools.add(b);
  
  b = new Button(loadImage("./data/ellipse.png"), new PVector(0, offset), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  tools.add(b);
  
  b = new Button(loadImage("./data/color.png"), new PVector(0, offset), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  tools.add(b);
  
  b = new Button(loadImage("./data/paint_bucket.png"), new PVector(0, offset), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  tools.add(b);
  
  b = new Button(loadImage("./data/rubber.png"), new PVector(0, offset), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  tools.add(b);
  
  b = new Button(loadImage("./data/load.png"), new PVector(0, offset), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  tools.add(b);
  
  b = new Button(loadImage("./data/save.png"), new PVector(0, offset), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  tools.add(b);
  
  return tools;
}

public ArrayList<Button> createLineStrokes() {
  ArrayList<Button> strokes = new ArrayList<Button>();
  
  float offset = BUTTON_SIZE;
  
  Button b = new Button(loadImage("./data/line_sm.png"), new PVector(width - offset, 0), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  strokes.add(b);
  
  b = new Button(loadImage("./data/line_md.png"), new PVector(width - offset, 0), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  strokes.add(b);
  
  return strokes;
}

public ArrayList<Button> createFilters() {
  ArrayList<Button> filters = new ArrayList<Button>();
  
  float offset = (NUM_STROKES + 1) * BUTTON_SIZE + CANVAS_MARGIN;
  
  Button b = new Button(loadImage("./data/negative.png"), new PVector(width - offset, 0), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  filters.add(b);
  
  b = new Button(loadImage("./data/blur.png"), new PVector(width - offset, 0), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  filters.add(b);
  
  b = new Button(loadImage("./data/erode.png"), new PVector(width - offset, 0), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  filters.add(b);
  
  b = new Button(loadImage("./data/dilate.png"), new PVector(width - offset, 0), BUTTON_SIZE);
  offset += BUTTON_SIZE;
  filters.add(b);
  
  return filters;
}
