import java.util.Random;
class Wuerfel {
  private char[] seiten_des_w; //Speichert die 6 Buchstaben, die ein Bogglewürfel hat

  Wuerfel(char s0, char s1, char s2, char s3, char s4, char s5) { //Konstruktor, der die Werte der einzelnen Seiten empfängt
  seiten_des_w = new char[6];
    seiten_des_w[0] = s0;
    seiten_des_w[1] = s1;
    seiten_des_w[2] = s2;
    seiten_des_w[3] = s3;
    seiten_des_w[4] = s4;
    seiten_des_w[5] = s5;
  }
  
  Wuerfel(String s) { //Konstruktor, der die Werte alle zusammen in einem String empfängt
    seiten_des_w = new char[6];
    seiten_des_w[0] = s.charAt(0);
    seiten_des_w[1] = s.charAt(1);
    seiten_des_w[2] = s.charAt(2);
    seiten_des_w[3] = s.charAt(3);
    seiten_des_w[4] = s.charAt(4);
    seiten_des_w[5] = s.charAt(5);
  }
  
  void set_seite(int seite, char c) { //Man kann eine einzelne Seite des Würfels ändern
     if(seite >= 0 && seite <=5) {
       seiten_des_w[seite] = c; 
     }
  }
  
  char[] get_wuerfel() {
     return seiten_des_w.clone(); //Gibt eine Kopie des Würfelarrays zurück
  }
  
  char wuerfeln() {
    Random r = new Random();
    return seiten_des_w[r.nextInt(6)];
  }
  
  void print_wuerfel() {
    for(char c : seiten_des_w) print(c + " ");
    println();
  }
  
  
  
}
