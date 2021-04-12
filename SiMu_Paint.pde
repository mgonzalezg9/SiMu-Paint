ArrayList<Button> btnList;
int selectedTool = 0;

void setup() {
  size(720, 440);
  
  btnList = new ArrayList<Button>();
  float offset = 0;
  
  Button b = new Button(loadImage("./data/pencil.png"), new PVector(0, offset), height/NUM_TOOLS);
  b.click();
  offset += height/NUM_TOOLS;
  btnList.add(b);
  
  b = new Button(loadImage("./data/line.png"), new PVector(0, offset), height/NUM_TOOLS);
  offset += height/NUM_TOOLS;
  btnList.add(b);
  
  b = new Button(loadImage("./data/rectangle.png"), new PVector(0, offset), height/NUM_TOOLS);
  offset += height/NUM_TOOLS;
  btnList.add(b);
  
  b = new Button(loadImage("./data/ellipse.png"), new PVector(0, offset), height/NUM_TOOLS);
  offset += height/NUM_TOOLS;
  btnList.add(b);
  
  b = new Button(loadImage("./data/color.png"), new PVector(0, offset), height/NUM_TOOLS);
  offset += height/NUM_TOOLS;
  btnList.add(b);
  
  b = new Button(loadImage("./data/paint_bucket.png"), new PVector(0, offset), height/NUM_TOOLS);
  offset += height/NUM_TOOLS;
  btnList.add(b);
  
  b = new Button(loadImage("./data/rubber.png"), new PVector(0, offset), height/NUM_TOOLS);
  offset += height/NUM_TOOLS;
  btnList.add(b);
  
  b = new Button(loadImage("./data/load.png"), new PVector(0, offset), height/NUM_TOOLS);
  offset += height/NUM_TOOLS;
  btnList.add(b);
  
  b = new Button(loadImage("./data/save.png"), new PVector(0, offset), height/NUM_TOOLS);
  offset += height/NUM_TOOLS;
  btnList.add(b);
}

void mouseClicked() {
  int newTool = -1;
  
  for (int i = 0; i < btnList.size(); i++) {
    Button b = btnList.get(i);
    if (b.clicked()) {
      newTool = i;
      break;
    }
  }
  
  if (newTool != -1 && newTool != selectedTool) {
    btnList.get(selectedTool).unclick();
    selectedTool = newTool;
  }
}

void drawTools() {
  line(height/NUM_TOOLS, 0, height/NUM_TOOLS, height);
  
  for(Button btn : btnList) {
    btn.display();
  }
}

void draw() {
  background(255); // Reset
  
  drawTools();
}
