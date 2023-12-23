class Suchalgorithmus {
  private String feld;
  private int line_length; //Gibt Anzahl Buchstaben/Linie an bei 16-Buch-Feld: line_length = 4;
  
  
  Suchalgorithmus() { //Konstruktor
    line_length = 4; // line-length wird standartmäßig auf 4 gesetzt.
    feld = "*****haus**dest**dhgn**gain*****";  // Ein Beispiel-Feld, damit Suche nicht abstürzt.
  }
  
  public void setFeld(String f) { //Setter für Feld || TODO: Checken ob richtiges Format
    feld = f;
  }
  
  public void setFeld(char[][] f) { //Erstellt den String Feld aus einem gegeben Buchstaben-Array
  }
  
  public void set_line_length(int ll) { //Setter für line_length
    if(ll >= 2) {                        //line_length muss min. 2 sein. -> Weil sonst keinen Sinn
      line_length = ll; 
    }
  }
  
  //Gibt bool-Wert zurück, ob Wort in Feld zu finden ist
  public boolean search_word(String word) { //Für ersten Buchstaben
    char anfangsbuchstabe = word.charAt(0); //Holt sich den ersten Buchstaben
    IntList indexes_anBuchstabe = get_Indexes(anfangsbuchstabe, feld); //Holt alle Indexe des ersten Buchstaben aus Feld
    //Idee: Durch alle indexe Loopen und rekursiv alle Möglichkeiten für das Wort checken
    for(int index : indexes_anBuchstabe) {
      String search_field = String.valueOf(feld); //String, der das Feld mit allen unbenutzten Buchstaben speichert
      search_field = replace(search_field, index, '*'); // Replaces index mit *
      word = word.substring(1, word.length());
      if(search_teilword(word, index, search_field)) return true;
    }
    return false;
  }
  

  
  public boolean search_teilword(String teil_word, int index, String feld) {
    char next_letter = teil_word.charAt(0);
    IntList indexe_next_letter = get_Indexes(next_letter, feld);
    
    return false;
  }
  
  
  private IntList get_accessible_chars(int index) { //Gibt die Indize aller Nachberbuchstaben eines Indexes wieder
    IntList rueck = new IntList();
    for (int i = index - (line_length + 2); i <= index + line_length+2; i = i + line_length+2) { //line_length+2 wegen der Sterne am Rand
      for (int j = -1; j < 2; j++) {
        if (i+j != index) {
          rueck.append(i+j); 
        }
      }
    }
    return rueck;
  }
  
  String replace(String s, int index, char c) { //Replaces a given index of a string with passed char c
    if(s.length() <= index) return s;
    String h = s.substring(0, index);
    String h2 = s.substring(index + 1);
    return h + c + h2;
  }
  
  
  
  private IntList get_Indexes(char c, String feld) { //Returnt eine Liste mit allen Indexen eines Buchstaben auf einem Feld
  IntList rueck = new IntList();
    for(int i = 0; i < feld.length(); i++) {
      if(feld.charAt(i) == c) rueck.append(i);
    }
    return rueck;
  }
  
}
