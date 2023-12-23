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
Suchalgorithmus suchi;


void setup() {
  size(1400, 760);
  frameRate(2);
  datenbank = loadStrings("Datenbank2.0.txt"); 
  usefulWords.append(datenbank);
  suchi = new Suchalgorithmus();

}

void draw() {
}
