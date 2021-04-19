//private final color BG_COLOR = color(252);
private float CANVAS_MARGIN;

ArrayList<Button> toolList, filterList;
Canvas c;
int selectedTool = 0;

// Aux methods
void drawTools() {
  line(BUTTON_SIZE, 0, BUTTON_SIZE, height);
  
  for(Button btn : toolList) {
    btn.display();
  }
}

void drawFilters() {
  line(width, BUTTON_SIZE, width - BUTTON_SIZE * NUM_FILTERS, BUTTON_SIZE);
  line(width - BUTTON_SIZE * NUM_FILTERS, BUTTON_SIZE, width - BUTTON_SIZE * NUM_FILTERS, 0);
  
  for(Button btn : filterList) {
    btn.display();
  }
}

// Processing methods
void setup() {
  size(720, 440);
  
  BUTTON_SIZE = height/NUM_TOOLS;
  CANVAS_MARGIN = height/40;
  
  toolList = createTools();
  filterList = createFilters();
  
  c = new Canvas(BUTTON_SIZE + CANVAS_MARGIN, BUTTON_SIZE + CANVAS_MARGIN, width - CANVAS_MARGIN, height - CANVAS_MARGIN);
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
  
  // Filter listener
  int filterNum = -1;
  for (int i = 0; i < filterList.size(); i++) {
    Button b = filterList.get(i);
    if (b.clicked()) {
      filterNum = i;
      break;
    }
  }
  
  // Control buttons
  switch (selectedTool) {
    case SAVE_TOOL:
      c.save();
      break;
    case OPEN_TOOL:
      c.open();
      break;
      
  }
}

/* Performing actions */
void mouseDragged() {
  switch (selectedTool) {
    case PENCIL_TOOL:
      c.drawLine(pmouseX - BUTTON_SIZE - CANVAS_MARGIN, pmouseY - BUTTON_SIZE - CANVAS_MARGIN, mouseX - BUTTON_SIZE - CANVAS_MARGIN, mouseY - BUTTON_SIZE - CANVAS_MARGIN);
      break;
    case LINE_TOOL:
      c.drawLine(pmouseX, pmouseY, mouseX, mouseY);
      break;
    case ERASER_TOOL:
      c.erase(mouseX - BUTTON_SIZE - CANVAS_MARGIN, mouseY - BUTTON_SIZE - CANVAS_MARGIN);
      break;
  }
}

void mousePressed() {
  
}

void draw() {
  // Reset
  //fill(BG_COLOR);
  //rect(0, 0, BUTTON_SIZE, height);
  //rect(width, 0, width - BUTTON_SIZE * NUM_FILTERS, BUTTON_SIZE);
  
  drawTools();
  drawFilters();
  c.display();
}
