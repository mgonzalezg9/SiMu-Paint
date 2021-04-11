ArrayList<Button> btnList;
int selectedTool = 0;

void setup() {
  size(640, 360);
  
  btnList = new ArrayList<Button>();
  float offset = 0;
  Button b = new Button(loadImage("./data/pencil.png"), new PVector(0, offset));
  b.click();
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
  
  if (newTool != selectedTool) {
    btnList.get(selectedTool).unclick();
    selectedTool = newTool;
  }
}

void drawTools() {
  line(width/15, 0, width/15, height);
  
  for(Button btn : btnList) {
    btn.display();
  }
}

void draw() {
  background(255); // Reset
  
  drawTools();
}
