import java.util.Arrays;

class Suchalgorithmus {
  private String spielfeld;
  private int line_length; //Gibt Anzahl Buchstaben/Linie an bei 16-Buch-Feld: line_length = 4;
  
  
  Suchalgorithmus() { //Konstruktor
    line_length = 4; // line-length wird standartmäßig auf 4 gesetzt.
    spielfeld = "*****haus**dest**dhgn**gain*****";  // Ein Beispiel-Feld, damit Suche nicht abstürzt.
  }
  
  public void setFeld(String f) { //Setter für Feld || TODO: Checken ob richtiges Format
    spielfeld = f;
  }
  
  public void setFeld(char[][] f) { //Erstellt den String Feld aus einem gegeben Buchstaben-Array
    String new_feld = "";
    int intern_length = line_length + 2; //Außen kommen jeweils die * dazu, da zwei Seiten -> +2
    String line_of_stars = "";
    for(int i = 0; i < intern_length; i++) line_of_stars += "*"; //String of stars
    new_feld += line_of_stars;
    new_feld += "**";
    for(char[] line_of_chars : f) {
      new_feld += Arrays.toString(line_of_chars);
      new_feld += "**";
    }
    new_feld += line_of_stars;
    spielfeld = new_feld;
  }
  
  public void set_line_length(int ll) { //Setter für line_length
    if(ll >= 2) {                        //line_length muss min. 2 sein. -> Weil sonst keinen Sinn
      line_length = ll; 
    }
  }
  
  //Gibt bool-Wert zurück, ob Wort in Feld zu finden ist
  public boolean search_word(String word) { //Für ersten Buchstaben
    char anfangsbuchstabe = word.charAt(0); //Holt sich den ersten Buchstaben
    IntList indexes_anBuchstabe = get_Indize(anfangsbuchstabe, spielfeld); //Holt alle Indexe des ersten Buchstaben aus Feld
    //Idee: Durch alle indexe Loopen und rekursiv alle Möglichkeiten für das Wort checken
    for(int index : indexes_anBuchstabe) {
      String search_field = String.valueOf(spielfeld); //String, der das Feld mit allen unbenutzten Buchstaben speichert
      search_field = replace(search_field, index, '*'); // Replaces index mit *
      word = word.substring(1, word.length());
      if(search_teilword(word, index, search_field)) return true;
    }
    return false;
  }
  

  
  public boolean search_teilword(String teil_word, int index, String field) {
    if(teil_word.length() == 0) return true; //Falls ein gesuchtes Teil-Wort leer ist, dann ist das ganze Wort gefunden
    char next_letter = teil_word.charAt(0);
    IntList indize_next_letter = get_Indize(next_letter, field); //Die Liste mit den Indize aller Felder, die den nächsten, gesuchten Buchstaben enthalten
    IntList surrounding_squares = get_accessible_squares(index); //Die Liste mit den Indize der umliegend Felder von dem aktuellen
    
    IntList ueberschneidene_Indize = new IntList();
    //Wir schauen, ob sich indize in beiden Listen befinde, denn dann kann das Wort so weitergebildet werden
    for(int in : indize_next_letter) {
      if(surrounding_squares.hasValue(in)) {
        ueberschneidene_Indize.append(in);
      }
    }
    
    //Bei allen Indize, die sich überschneiden, suchen wir weiter
    for(int in : ueberschneidene_Indize) {
      String updated_field = replace(field, in, '*'); // Replaces index mit *
      String new_teil_word = teil_word.substring(1, teil_word.length()); //Schneidet den vordersten Buchstaben raus, da schon gefunden
      if(search_teilword(new_teil_word, in, updated_field)) return true;
    }
    
    return false;
  }
  
  
  private IntList get_accessible_squares(int index) { //Gibt die Indize aller Nachberbuchstaben eines Indexes wieder
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
  
  
  
  private IntList get_Indize(char c, String feld) { //Returnt eine Liste mit allen Indexen eines Buchstaben auf einem Feld
  IntList rueck = new IntList();
    for(int i = 0; i < feld.length(); i++) {
      if(feld.charAt(i) == c) rueck.append(i);
    }
    return rueck;
  }
  
}
