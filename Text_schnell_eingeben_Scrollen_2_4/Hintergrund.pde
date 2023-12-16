int[] saveBackground;
class Hintergrund {


  Hintergrund() {
    loadPixels();
    saveBackground = new int[pixels.length];
    updatePixels();
    gelberHintergrund();
  }

  void gelberHintergrund() {
    for (int i = 0; i < saveBackground.length; i++) {
      saveBackground[i] = color(random(127, 255), random(127, 255), 0);
    }
  }


  void hintergrund() {
    loadPixels();
    for (int i = 0; i < pixels.length; i++) {
      pixels[i] = saveBackground[i];
    }
    updatePixels();
  }



  void button() {
    rect(width/2-50, height*0.65, 100, 75, 10);
    fill(255);
    text("Start", width/2-47, height*0.67, 100, 75);
  }


  void startButton() {
    if (mouseX > width/2-50 && mouseX < width/2 + 50 &&
      mouseY > height*0.65 && mouseY < height*0.65+75
      && indeY == 4) {
      fill(100, 0, 255);
      button();
      if (mousePressed) {
        sucheWorter();
        printArray(finalWords);
      }
    } else if (indeY == 4) {
      fill(0, 0, 255);
      button();
    } else {
      fill(127);
      button();
    }
  }

  void textEingeben() {
    textAlign(CENTER);
    fill(0);
    textSize(40);

    for (int i = 0; i < 4; i ++) {
      for (int j = 0; j < 4; j ++) {
        text(uBuchstaben[i][j], width/2-75 + j*50, height/2-100+i*50);
      }
    }
    startButton();
  }


  void kaestchen() {

    felder();
    linien();
    buchstaben();
  }


  void felder() {

    for (int i = 0; i <  height; i = i + kGroesse) {
      for (int a = 0; a <  height; a = a + kGroesse) {
        int x = i/kGroesse;
        int y = a/kGroesse;
        farbe(x, y);
        stroke(0);
        rect(i, a, kGroesse, kGroesse);
      }
    }
  }
  
  void buchstaben() {
    int textsize = 100;
    int d = int(textsize * 0.3);
    for (int i = 0; i <  height; i = i + kGroesse) {
      for (int a = 0; a <  height; a = a + kGroesse) {
        int x = i/kGroesse;
        int y = a/kGroesse;
        fill(0);
        stroke(0);
        strokeWeight(3);
        textSize(textsize);
        textAlign(CENTER);
        text(buchstaben[y+1][x+1], i + kGroesse/2, a + kGroesse/2 + d);
      }
    }    
  }

  void farbe(int x, int y) {
    if (leuchten[y][x]) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
  }

  void linien() {
    int m = kGroesse/2;
    for (int i = 0; i < reihenfolge.size()-1; i ++) {
      int zelle = reihenfolge.get(i);
      int nextZelle = reihenfolge.get(i+1);
      int startX = zelle%6*kGroesse-m;
      int startY = zelle/6*kGroesse-m;
      int endX = nextZelle%6*kGroesse-m;
      int endY = nextZelle/6*kGroesse-m;
      stroke(250, 127, 0);
      strokeWeight(7);
      line(startX, startY, endX, endY);
    }
  }




  void drawFinalWords() {
    if (spaltenlaenge > finalWords.size()) {
      spaltenlaenge = finalWords.size();
    }
    for (int i = 0; i < spaltenlaenge; i++) {
      int posWord = i+finalWordsY+1;
      String s = finalWords.get(posWord-1);
      textAlign(CORNER);
      textSize(40);
      fill(0);
      text(s, height + 120, 50+50*i);
      textSize(20);
      text(posWord+".", height+50, 50+50*i);
      woerterUmrandung(i, s);
    }
  }


  void woerterUmrandung(int i, String wort) {
    noFill();
    int wortY = 15+50*i;
    float wortlength = textWidth(wort)*2;
    if (mouseX > height+115 & mouseX < height+115+ wortlength+20 & mouseY > wortY & mouseY < wortY+45) {
      rect(height+115, wortY, wortlength+20, 45);
      if (mousePressed) {
        uShowWord(wort);
      }
    }
  }
}
