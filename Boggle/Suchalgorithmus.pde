class Suchalgorithmus {
  private String feld;
  private int line_length; //Gibt Anzahl Buchstaben/Linie an bei 16-Buch-Feld: line_length = 4;
  
  
  public void Suchalgorithmus() { //Konstruktor
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
  
  
}
