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
StringList all_words = new StringList();
Suchalgorithmus suchi;


void setup() {
  size(1400, 760);
  frameRate(2);
  datenbank = loadStrings("Datenbank2.0.txt"); 
  all_words.append(datenbank);
  suchi = new Suchalgorithmus();
  
  StringList gefunden = new StringList();
  for(String wort : all_words) if(suchi.search_word(wort)) gefunden.append(wort);
  printArray(gefunden);

}

void draw() {
}
