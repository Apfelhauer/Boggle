class Suchalgorithmus {

  ArrayList<Integer> safeVerzweigungen = new ArrayList<Integer>();
  ArrayList<String> safeVerzweigungenString = new ArrayList<String>();







  void findPosWords() {
    possibleWords = usefulWords;
    //Erstellt Liste aller Buchstaben auf dem Feld
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

          uIndexOfChar = nextCharIndex(nachbarChar, indexOfNextChar, i, allChars); 

          //falls alle Nachbarbuchstaben des Wortes nebeneinander liegen,
          //füge das Wort der Liste mit den möglichen Wörtern hinzu
          if (i == posW.length()-2) {
            finalWords.append(posW);
            safeVerzweigungen.clear();
            safeVerzweigungenString.clear();
            return;
          } 

          //Falls die Buchstaben nicht nebeneinander liegen: Das Wort ist nicht möglich
        } else {
          if (safeVerzweigungen.size() > 0) {
            i = safeVerzweigungen.get(safeVerzweigungen.size()-2);
            uIndexOfChar =  safeVerzweigungen.get(safeVerzweigungen.size()-1);
            allChars =  safeVerzweigungenString.get(safeVerzweigungenString.size()-1);
            safeVerzweigungen.remove(safeVerzweigungen.size()-1);
            safeVerzweigungen.remove(safeVerzweigungen.size()-1);
            safeVerzweigungenString.remove(safeVerzweigungenString.size()-1);
            //println("Repeeeet!!!!");
          } else {
            i = posW.length()-1;
          }
        }
      }
    }
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

  int nextCharIndex(int[] liste, IntList index, int posI, String allChars) {
    IntList alleNaechstenBuchstaben = new IntList();
    for (int i = 0; i < liste.length; i++) {
      for (int j = 0; j <index.size(); j++) {
        int eIndex = index.get(j);
        if (eIndex == liste[i]) {
          alleNaechstenBuchstaben.append(eIndex);
        }
      }
    }
    if (alleNaechstenBuchstaben.size() > 1 ) {
      for (int i = 0; i < alleNaechstenBuchstaben.size()-1; i++) { 

        storePositionOfVerzweigung(posI, alleNaechstenBuchstaben.get(i+1), allChars);
      }
    } 
    return alleNaechstenBuchstaben.get(0);
  }

  void storePositionOfVerzweigung(int posI, int uIndexOfNextChar, String allChars) {
    safeVerzweigungen.add(posI);
    safeVerzweigungen.add(uIndexOfNextChar);
    safeVerzweigungenString.add(allChars);
  }

  void initialUBuchstaben() {
    for (int i = 0; i < 4; i ++) {
      for (int j = 0; j < 4; j++) {
        uBuchstaben[i][j] = "";
      }
    }
  }






  void uebertrageBuchstaben() {
    for (int i = 1; i < 5; i ++) {
      for (int j = 1; j < 5; j++) {
        buchstaben[i][j] = uBuchstaben[i-1][j-1];
      }
    }
  }

  void showWord(String word) {
    reihenfolge.clear();
    
    //Erstellt ein String mit allen Buchstaben auf dem Feld
    String allChars = getChars();

    //Estellt einen String mit dem AnfangsBuchstaben des Wortes
    String anfangsbuchstabe = word.substring(0, 1);

    //Erstellt eine Liste mit allen Indexen des Anfangsbuchstaben
    IntList indexes = getIndexes(allChars, anfangsbuchstabe);


    //Checkt das Wort für jeden Anfangsbuchstaben
    for (int j = 0; j < indexes.size(); j ++) {

      //Nimmt sich einen Index aus der IndexListe der Anfangsbuchstaben
      int uIndexOfChar = indexes.get(j);

      //Loopt durch alle ausßer dem Letzten Buchstaben des Wortes
      for (int i = 0; i < word.length()-1; i++) {

        //Hohlt sich den nächsten Buchstaben des Wortes
        String nextChar = word.substring(i+1, i+2);


        //Hohlt sich die Position des Nächsten Buchstabens
        int indexOfChar = uIndexOfChar;

        //Erstellt eine Liste mit allen Positionen des näschsten Buchstaben
        IntList indexOfNextChar = getIndexes(allChars, nextChar);

        //Erstellt eine Liste mit allen Indexen der Nachbarbuchstben des Jeweiligen
        int[] nachbarChar = moeglicheChar(indexOfChar);

        //Überprüft, ob sich der nächste Buchstabe in der Liste befindet
        if (contain(nachbarChar, indexOfNextChar)) {
          
            reihenfolge.set(i, indexOfChar);
            
          //ersetzt den aktuellen Buchstaben durch ein Sternchen, damit er nicht nochmal benutzt wird
          allChars = charErsetzen(allChars, indexOfChar);

          uIndexOfChar = nextCharIndex(nachbarChar, indexOfNextChar, i, allChars); 

          //falls alle Nachbarbuchstaben des Wortes nebeneinander liegen,
          //füge das Wort der Liste mit den möglichen Wörtern hinzu
          if (i == word.length()-2) {
            reihenfolge.set(i+1, uIndexOfChar);            
            allChars = charErsetzen(allChars, uIndexOfChar);
            leuchten(allChars);

            safeVerzweigungen.clear();
            safeVerzweigungenString.clear();
            return;
          } 

          //Falls die Buchstaben nicht nebeneinander liegen: Das Wort ist nicht möglich
        } else {
          if (safeVerzweigungen.size() > 0) {
            printArray(safeVerzweigungenString  );
            i = safeVerzweigungen.get(safeVerzweigungen.size()-2);
            uIndexOfChar =  safeVerzweigungen.get(safeVerzweigungen.size()-1);
            allChars =  safeVerzweigungenString.get(safeVerzweigungenString.size()-1);
            safeVerzweigungen.remove(safeVerzweigungen.size()-1);
            safeVerzweigungen.remove(safeVerzweigungen.size()-1);
            safeVerzweigungenString.remove(safeVerzweigungenString.size()-1);
            //println("Repeeeet!!!!");
          } else {
            i = word.length()-1;
          }
        }
      }
    }
  }

  void leuchten(String chars) {
    resetLeuchten();
    String felderChars = prepare(chars);
    for (int i = 0; i < felderChars.length(); i++) {
      char c = felderChars.charAt(i);
      if (c == '*') {
        int x =  i%4;
        int y =  i/4;
        leuchten[y][x] = true;
      }
    }
    printArray(reihenfolge);
  }

  void resetLeuchten() {
  for(int i = 0; i < 6; i++) {
   for(int j = 0; j < 6; j++) {
    leuchten[i][j] = false; 
   }
  }
    
  }

  String prepare(String allChars) {
    String firstRow = allChars.substring(7, 11);
    String secondRow = allChars.substring(13, 17);
    String thirdRow = allChars.substring(19, 23);
    String fourthRow = allChars.substring(25, 29);
    String prepared = firstRow + secondRow + thirdRow + fourthRow; 
    return prepared;
  }

  String charErsetzen(String allChars, int index) {

    String h = allChars.substring(0, index);
    String h2 = allChars.substring(index + 1);
    allChars = h + "*" + h2;

    return allChars;
  }
}
