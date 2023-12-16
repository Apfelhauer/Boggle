String[][] buchstaben = new String[][] {
  {"*", "*", "*", "*", "*", "*"}, 
  {"*", "d", "j", "n", "r", "*"}, 
  {"*", "u", "k", "r", "l", "*"}, 
  {"*", "l", "n", "h", "n", "*"}, 
  {"*", "n", "i", "t", "m", "*"}, 
  {"*", "*", "*", "*", "*", "*"}
};

Hintergrund bg;
Suchalgorithmus searchy = new Suchalgorithmus();
boolean showWords = false;
String[] datenbank;
String[][] uBuchstaben = new String[4][4];
int index;
StringList usefulWords = new StringList();
StringList possibleWords  = new StringList();
StringList finalWords  = new StringList();
boolean[][] leuchten = new boolean[6][6];
IntList reihenfolge = new IntList();
int finalWordsY = 0;
int spaltenlaenge = 15;
int groesse = 4;
int kGroesse;
int indeX = 0;
int indeY = 0;



void setup() {
  size(1400, 760);
  kGroesse = height/groesse;
  frameRate(60);
  datenbank = loadStrings("Datenbank2.0.txt"); 
  spaltenlaenge = 15;
  usefulWords.append(datenbank);
  searchy = new Suchalgorithmus();
  bg = new Hintergrund();
  searchy.initialUBuchstaben();
}

void draw() {
  if (!showWords) {
    bg.hintergrund();
    bg.textEingeben();
  } else {
    background(255);
    bg.kaestchen();
    bg.drawFinalWords();
  }
}





void sucheWorter() {
  background(255);
  searchy.uebertrageBuchstaben();
  searchy.findPosWords();

  for (int i = 0; i < possibleWords.size(); i++) {
    String test = possibleWords.get(i);
    searchy.checkWord(test);
  }

  //println(finalWords.size());
  showWords = true;
}

void uShowWord(String word) {
  searchy.showWord(word);
}



void keyTyped() {

  if (indeY < 4 && key >= 'A' && key <= 'z') {
    uBuchstaben[indeY][indeX] = uBuchstaben[indeY][indeX] + key;

    indeX ++;
    if (indeX == 4 && indeY < 4) {
      indeX = 0;
      indeY ++;
    }
  } else if (key == BACKSPACE) {
    if (indeX != 0 || indeY != 0) {
      indeX --;
    }
    if (indeX == -1) {
      indeX = 3;
      indeY --;
    }
    uBuchstaben[indeY][indeX] = "";
  }
}

void mouseWheel(MouseEvent event) {
  int scrollen = event.getCount();
  finalWordsY = finalWordsY + scrollen;
  if (finalWordsY >= finalWords.size()-spaltenlaenge) {
    finalWordsY = finalWords.size()-spaltenlaenge;
  } else if (finalWordsY < 0) {
    finalWordsY = 0;
  }
}
