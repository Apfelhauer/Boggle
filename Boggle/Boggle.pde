String[] datenbank;
int index;
StringList all_words = new StringList();
Suchalgorithmus suchi;
Spielfeld spielfeld;
String text1 = "";
boolean knowsPassword=false;


void setup() {
  //Datenbank laden
  datenbank = loadStrings("Datenbank2.5.txt"); 
  all_words.append(datenbank);
  
  //Objekte der Klassen deklarieren
  suchi = new Suchalgorithmus();
  spielfeld = new Spielfeld();
  
  //Spielfeld setzten
  println(spielfeld.wuerfel_Spielfeld());
  suchi.setFeld(spielfeld.get_Spielfeld());
  
  //*** Bei realem Spiel hier das Spielfeld setzten:
  //suchi.setFeld("________________");
  
  //Wörter suchen und drucken
  //search_and_print_words();

}

void draw() {
}

void search_and_print_words() {
  StringList gefunden = new StringList();
  for(String wort : datenbank) if(suchi.search_word(wort)) gefunden.append(wort);
  printArray(gefunden);
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT) {
      println ("left");
    } // if
    else {
      // message
      println ("unknown special key");
    } // else
  } // if
  else
  {
    if (key==BACKSPACE) {
      if (text1.length()>0) {
        text1=text1.substring(0, text1.length()-1);
      } // if
    } // if
    else if (key==RETURN || key==ENTER) {
      println ("ENTER");
      if (text1.equals("abcd")) {
        println("Hurra!");
        knowsPassword=true;
        text1="";
      } // if
      else {
        knowsPassword=false;
      }
    } // else if
    else {
      text1+=key;
    } // else
    // output
    println (text1);
  } // else
} // func
//
