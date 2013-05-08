class Controller {
  
  color c1, c2;
  color c1Saved, c2Saved;

  SwitchBank bankSelector;
  SelectorBox shapeSelector;
  ColorWheel colorWheel1, colorWheel2;
  
  Box colorBox1, colorBox2;
  Box fileControlBox, textControlBox;
  Box lightsOutBox;
  
  // switches
  boolean lightsAreOut;
  
  Slider radiusSlider, speedSlider, alphaSlider, maxLevelSlider, minLevelSlider;


  Controller (int numberOfControlBanks) {

    colorBox1 = new Box(20, height - 50, 30, 30, "");
    colorBox2 = new Box(20, height - 10, 30, 30, "");

    bankSelector = new SwitchBank(numberOfControlBanks);

    fileControlBox = new Box(960, height - 50, 30, 30, "F");
    textControlBox = new Box(960, height - 10, 30, 30, "T");
    fileControlBox.setRGBAColor(0, 0, 200, 255);
    textControlBox.setRGBAColor(0, 0, 200, 255);
    
    lightsOutBox = new Box(20, height - 50, 30, 30, "B");
    lightsAreOut = false;

    String particleLabels[] = { 
      "C", "T", "Q", "L", "W"
    };

    shapeSelector = new SelectorBox(260, height - 20, 150, 40, particleLabels.length, particleLabels); 
    
    colorWheel1 = new ColorWheel(70, height-20, 60, "Color 1");  colorWheel1.bg = color(0);
    colorWheel2 = new ColorWheel(145, height-20, 60, "Color 2");  colorWheel2.bg = color(0);

    speedSlider = new Slider(480, height - 20, 200, 40, 100, "fps", "Framerate");
    radiusSlider = new Slider(720, height - 20, 200, 40, MAXRADIUS, "r", "Radius");

    alphaSlider = new Slider(20, height - 25, 200, 40, maxAlpha, "a", "Alpha");
    maxLevelSlider = new Slider(460, height - 25, 200, 40, 1.0, "max", "Maximum Level");
    minLevelSlider = new Slider(240, height - 25, 200, 40, 1.0, "min", "Minimum Level");

    speedSlider.setValue(baseFrameRate);  
    radiusSlider.setValue(INITIAL_RADIUS);
    alphaSlider.setValue(frameAlpha);
    maxLevelSlider.setValue(maxLevel);
    minLevelSlider.setValue(minLevel);
  }



  void displayBank1 () {

    colorWheel1.display();
    colorWheel2.display();

    colorBox1.display(); 
    colorBox2.display();

    shapeSelector.display();

    fileControlBox.display();
    textControlBox.display();

    radiusSlider.display();
    speedSlider.display();

    radiusSlider.read();
    speedSlider.read();
  }

  void displayBank2() {

    alphaSlider.display();
    alphaSlider.read();

    minLevelSlider.display();
    maxLevelSlider.display();
  }
  
   void displayBank3() {

    lightsOutBox.display();
  }

  void displayBank(int k) 
  {
    switch(k) {
    case 0:
      displayBank1();
      break;
    case 1:
      displayBank2();
      break;
    case 2:
      displayBank3();
      break;
    default:
      println("Invalid bank selected: "+k);
      break;
    }
  }

  void display() {


    if (switchA == 1) { 
      colorBox1.display();   
      colorBox2.display();
    }

    int b = bankSelector.activeSwitch();
    if (b > -1)
    {
      hide();
      displayBank(b);
    } 
    else {
      hide();
    }
  }

  void hide () {

    if (screenControlsOn) {
      fill(0);
      rectMode(CORNER);
      // rect(0,0, WIDTH, controlMargin);
      rect(0, HEIGHT - controlMargin + displayMargin -10, displayWidth, 200);
    }
  }

  void setColor1 ( color c)
  {
    c1 = c;
  }
  
  void setColor2 (color c)
  {
    c2 = c;
  }
  
  color readColorWheel1 ()
  {
    
    // read color wheel, set c1, and set color of corresponging box
 
    color c = colorWheel1.read();
    printColor(c, "readColorWheel(1)");
    colorBox1.setColor(c);
    colorMode(RGB, 255, 255, 255, 255); 
    return c; 
   
  }
  
  color readColorWheel2 ()
  {
     // read color wheel, set c2, and set color of corresponging box
    
    // read color wheel, set c1, and set color of corresponging box

    color c = colorWheel2.read();
    printColor(c, "readColorWheel(2)");
    colorBox2.setColor(c);
    colorMode(RGB, 255, 255, 255, 255); 
    return c;       
   
  }
  
  void updateColorBoxes() {
    
    colorMode(RGB,255,255,255);
    colorBox1.setColor(frameSet.c1);
    colorBox2.setColor(frameSet.c2);
    
  }
  
}  // controller
