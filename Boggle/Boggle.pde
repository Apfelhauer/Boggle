char[][] buchstaben = new char[][] {
  {'o', 'g', 't', 'r'}, 
  {'h', 'd', 'q', 'c'}, 
  {'s', 'e', 'k', 'e'}, 
  {'s', 't', 'u', 'n'}};


String[] datenbank;
int index;
StringList all_words = new StringList();
Suchalgorithmus suchi;
Spielfeld spielfeld;


void setup() {
  size(1400, 760);
  frameRate(2);
  datenbank = loadStrings("Datenbank2.5.txt"); 
  all_words.append(datenbank);
  suchi = new Suchalgorithmus();
  suchi.setFeld("ttuunalbsrohpdor");
  spielfeld = new Spielfeld();
  spielfeld.print_alle_wuerfel();
  

  StringList gefunden = new StringList();
  for(String wort : datenbank) if(suchi.search_word(wort)) gefunden.append(wort);
  printArray(gefunden);

}

void draw() {
}
