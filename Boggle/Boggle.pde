char[][] buchstaben = new char[][] {
  {'*', '*', '*', '*', '*', '*'}, 
  {'*', 'h', 'a', 'u', 's', '*'}, 
  {'*', 'd', 'e', 's', 't', '*'}, 
  {'*', 'd', 'h', 'g', 'n', '*'}, 
  {'*', 'g', 'a', 'i', 'n', '*'}, 
  {'*', '*', '*', '*', '*', '*'}
};


String[] datenbank;
int index;
StringList usefulWords = new StringList();
StringList possibleWords  = new StringList();
StringList finalWords  = new StringList();


void setup() {
  size(1400, 760);
  frameRate(2);
  datenbank = loadStrings("Datenban.txt"); 
  usefulWords.append(datenbank);


  findPosWords();
  kaestchen();

  for (int i = 0; i < possibleWords.size(); i++) {
    String test = possibleWords.get(i);
    checkWord(test);
  }
  //checkWord("haus");

  drawFinalWords();
}

void draw() {
}




void findPosWords() {
  possibleWords = usefulWords;
  //Erstellt String aller Buchstaben auf dem Feld
  StringList Char = new StringList();
  for (int j = 1; j < 5; j++) {
    for (int k = 1; k < 5; k++) {
      String u = "";
      u = u + buchstaben[k][j];
      Char.append(u);
    }
  }
  //Durchsucht jedes Wort
  for (int i = usefulWords.size()-1; i > -1; i--) {
    String strg = usefulWords.get(i);


    //Erstellt String der alle möglichen Buchstaben enthält
    String posChar = "";

    for (int l = 0; l < Char.size(); l++) {
      String s = Char.get(l);
      posChar = posChar + s;
    }

    //Durchsucht jeden Buchstaben
    for (int j = 0; j < strg.length(); j++) {

      String c = "";
      c = c + strg.charAt(j);  

      //guckt, ob sich der Buchstabe in der Liste der Buchstaben auf dem Feld befindet
      if (posChar.contains(c)) {
        //falls ja: überprüfe welcher buchstabe es ist und entferne ihn aus der Liste der Buchstaben

        String h =  posChar.replaceFirst(c, "*");
        posChar = h;
      } else {
        // falls sich der Buchstabe nicht im wort befindiet: entferne Wort aus der Liste
        // der möglichen Wörter
        possibleWords.remove(i);
        j = strg.length();
      }
    }
  }
}

String getChars() {
  StringList Char = new StringList();
  for (int j = 0; j < 6; j++) {
    for (int k = 0; k < 6; k++) {
      String u = "";
      u = u + buchstaben[j][k];
      Char.append(u);
    }
  }
  String posChar = "";

  for (int l = 0; l < Char.size(); l++) {
    String s = Char.get(l);
    posChar = posChar + s;
  }


  return posChar;
}



void checkWord(String posW) {
  //Erstellt ein String mit allen Buchstaben auf dem Feld
  String allChars = getChars();
  
  //Estellt einen String mit dem AnfangsBuchstaben des Wortes
  String anfangsbuchstabe = posW.substring(0, 1);
  
  //Erstellt eine Liste mit allen Indexen des Anfangsbuchstaben
  IntList indexes = getIndexes(allChars, anfangsbuchstabe);


  //Checkt das Wort für jeden Anfangsbuchstaben
  for (int j = 0; j < indexes.size(); j ++) {
    
    //Nimmt sich einen Index aus der IndexListe der Anfangsbuchstaben
    int uIndexOfChar = indexes.get(j);
    
    //Loopt durch alle ausßer dem Letzten Buchstaben des Wortes
    for (int i = 0; i < posW.length()-1; i++) {
      
      //Hohlt sich den nächsten Buchstaben des Wortes
      String nextChar = posW.substring(i+1, i+2);


      //Hohlt sich die Position des Nächsten Buchstabens
      int indexOfChar = uIndexOfChar;
      
      //Erstellt eine Liste mit allen Positionen des näschsten Buchstaben
      IntList indexOfNextChar = getIndexes(allChars, nextChar);

      //Erstellt eine Liste mit allen Indexen der Nachbarbuchstben des Jeweiligen
      int[] nachbarChar = moeglicheChar(indexOfChar);
      
      //Überprüft, ob sich der nächste Buchstabe in der Liste befindet
      if (contain(nachbarChar, indexOfNextChar)) {
        
        //ersetzt den aktuellen Buchstaben durch ein Sternchen, damit er nicht nochmal benutzt wird
        String h = allChars.substring(0, indexOfChar);
        String h2 = allChars.substring(indexOfChar + 1);
        allChars = h + "*" + h2;

        uIndexOfChar = nextCharIndex(nachbarChar, indexOfNextChar); 
        
        //falls alle Nachbarbuchstaben des Wortes nebeneinander liegen,
        //füge das Wort der Liste mit den möglichen Wörtern hinzu
        if (i == posW.length()-2) {
          finalWords.append(posW);
          return;
        }
        
        //Falls die Buchstaben nicht nebeneinander liegen: Das Wort ist nicht möglich
      } else {
        i = posW.length()-1;
      }
    }
  }
}



IntList getIndexes(String buchstaben, String nextChar) {
  IntList indexes = new IntList();
  for (int i = 0; i < buchstaben.length(); i ++) {
    String currChar = buchstaben.substring(i, i+1);
    if (currChar.contains(nextChar)) {
      indexes.append(i);
    }
  }
  return indexes;
}




boolean contain(int[] liste, IntList index) {
  for (int i = 0; i < liste.length; i++) {
    if (index.hasValue(liste[i])) {
      return true;
    }
  }
  return false;
}


int nextCharIndex(int[] liste, IntList index) {
  for (int i = 0; i < liste.length; i++) {
    for (int j = 0; j <index.size(); j++) {
      int eIndex = index.get(j);
    if (eIndex == liste[i]) {
      return eIndex;
    }
    }
  }
  return 0;
}

int[] moeglicheChar(int index) {
  int[] posChar = new int[8];
  int posCharIndex = 0;
  for (int i = index-6; i < index +7; i = i + 6) {
    for (int j = -1; j < 2; j++) {
      if (i != index || j != 0) {
        posChar[posCharIndex] = i+j;
        posCharIndex = posCharIndex +1;
      }
    }
  }

  return posChar;
}


void kaestchen() {
  int groesse = 4;
  int kGroesse = height/groesse;
  for (int i = 0; i <  height; i = i + kGroesse) {
    for (int a = 0; a <  height; a = a + kGroesse) {
      fill(255);
      rect(i, a, kGroesse, kGroesse);
      int x = i/kGroesse;
      int y = a/kGroesse;
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text(buchstaben[y+1][x+1], i + kGroesse/2, a + kGroesse/2);
    }
  }
}

void drawFinalWords() {
  for (int i = 0; i < finalWords.size(); i++) {
    String s = finalWords.get(i);
    textAlign(CORNER);
    textSize(40);
    int spaltenlaenge = 14;
    int reihe =  i/spaltenlaenge;
    int x = -150 + 200 * (reihe+1);
    int j = i-reihe*spaltenlaenge;
    text(s, height + x, 50+50*j);
  }
}
