//private final color BG_COLOR = color(252);
private float CANVAS_MARGIN;

ArrayList<Button> toolList, lineStrokeList;

Canvas c;
ColorPicker cp;

int selectedTool = 0;
int selectedStroke = 0;
color fillColor = color(255);
color strokeColor = color(0);
boolean colorPickerActive = false;

// Aux methods
void drawTools() {
  line(BUTTON_SIZE, 0, BUTTON_SIZE, height);
  
  for(Button btn : toolList) {
    btn.display();
  }
}

void drawLineStroke() {
  line(width, BUTTON_SIZE, width - BUTTON_SIZE * NUM_FILTERS, BUTTON_SIZE);
  line(width - BUTTON_SIZE * NUM_FILTERS, BUTTON_SIZE, width - BUTTON_SIZE * NUM_FILTERS, 0);
  
  for(Button btn : lineStrokeList) {
    btn.display();
  }
}

void drawCurrentColors() {
  fill(fillColor);
  rect(BUTTON_SIZE + CANVAS_MARGIN, 0, BUTTON_SIZE, BUTTON_SIZE);
  fill(strokeColor);
  rect(2 * BUTTON_SIZE + CANVAS_MARGIN, 0, BUTTON_SIZE, BUTTON_SIZE);
}

// Processing methods
void setup() {
  size(720, 440);
  
  BUTTON_SIZE = height/NUM_TOOLS;
  CANVAS_MARGIN = height/40;
  
  toolList = createTools();
  lineStrokeList = createLineStrokes();
  
  c = new Canvas(BUTTON_SIZE + CANVAS_MARGIN, BUTTON_SIZE + CANVAS_MARGIN, width - CANVAS_MARGIN, height - CANVAS_MARGIN);
  cp = new ColorPicker(BUTTON_SIZE + CANVAS_MARGIN, BUTTON_SIZE + CANVAS_MARGIN, width - CANVAS_MARGIN, height - CANVAS_MARGIN);
}

void mouseClicked() {
  int newTool = -1;
  
  // Tool listener
  for (int i = 0; i < toolList.size(); i++) {
    Button b = toolList.get(i);
    if (b.clicked()) {
      newTool = i;
      break;
    }
  }
  
  if (newTool != -1 && newTool != selectedTool) {
    toolList.get(selectedTool).unclick();
    selectedTool = newTool;
  }
  
  // Line stroke listener
  int strokeNum = -1;
  
  for (int i = 0; i < lineStrokeList.size(); i++) {
    Button b = lineStrokeList.get(i);
    if (b.clicked()) {
      strokeNum = i;
      break;
    }
  }
  
  if (strokeNum != -1 && strokeNum != selectedStroke) {
    lineStrokeList.get(selectedStroke).unclick();
    selectedStroke = strokeNum;
  }
  
  // Control buttons
  switch (selectedTool) {
    case SAVE_TOOL:
      c.save();
      break;
    case OPEN_TOOL:
      c.open();
      break;
    case COLOR_TOOL:
      cp.display();
      colorPickerActive = !colorPickerActive;
      break;
  }
  
  //performAction();
}

/* Performing actions */
void mouseDragged() {
  performAction();
}

void mouseReleased() {
  switch (selectedTool) {
    case LINE_TOOL:
    case RECT_TOOL:
    case ELLIPSE_TOOL:
      c.endPreview();
      break;
  }
}

void mousePressed() {
  switch (selectedTool) {
    case LINE_TOOL:
    case RECT_TOOL:
    case ELLIPSE_TOOL:
      c.setStartPoint(new PVector(mouseX - BUTTON_SIZE - CANVAS_MARGIN, mouseY - BUTTON_SIZE - CANVAS_MARGIN));
      break;
  }
}

void performAction() {
  switch (selectedTool) {
    case PENCIL_TOOL:
      c.pencil(pmouseX - BUTTON_SIZE - CANVAS_MARGIN, pmouseY - BUTTON_SIZE - CANVAS_MARGIN, mouseX - BUTTON_SIZE - CANVAS_MARGIN, mouseY - BUTTON_SIZE - CANVAS_MARGIN);
      break;
    case LINE_TOOL:
      c.line(mouseX  - BUTTON_SIZE - CANVAS_MARGIN, mouseY  - BUTTON_SIZE - CANVAS_MARGIN);
      break;
    case RECT_TOOL:
      c.rectangle(mouseX  - BUTTON_SIZE - CANVAS_MARGIN, mouseY  - BUTTON_SIZE - CANVAS_MARGIN);
      break;
    case ELLIPSE_TOOL:
      c.ellipse(mouseX  - BUTTON_SIZE - CANVAS_MARGIN, mouseY  - BUTTON_SIZE - CANVAS_MARGIN);
      break;
    case ERASER_TOOL:
      c.erase(mouseX - BUTTON_SIZE - CANVAS_MARGIN, mouseY - BUTTON_SIZE - CANVAS_MARGIN);
      break;
  }
}

void draw() {
  // Reset
  //fill(BG_COLOR);
  //rect(0, 0, BUTTON_SIZE, height);
  //rect(width, 0, width - BUTTON_SIZE * NUM_FILTERS, BUTTON_SIZE);
  
  drawTools();
  drawLineStroke();
  drawCurrentColors();
  
  if (colorPickerActive) {
    cp.display();
  } else {
    c.display();
  }
}
