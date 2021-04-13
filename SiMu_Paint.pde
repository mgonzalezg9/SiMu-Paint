ArrayList<Button> toolList, filterList;
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

/*void drawCanvas() {
  rectMode(CORNERS);
  rect(BUTTON_SIZE + CANVAS_MARGIN, BUTTON_SIZE + CANVAS_MARGIN, width - CANVAS_MARGIN, height - CANVAS_MARGIN);
}*/

// Processing methods
void setup() {
  size(720, 440);
  
  BUTTON_SIZE = height/NUM_TOOLS;
  toolList = createTools();
  filterList = createFilters();
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
  
  switch (filterNum) {
    case NEGATIVE_FILTER:
      negative();
      break;
  }
}

void draw() {
  background(255); // Reset
  
  drawTools();
  drawFilters();
  //drawCanvas();
}
