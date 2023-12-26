class Spielfeld {
  private ArrayList<Wuerfel> wuerfel; //Idee: ArrayList mit den 16 Standartwürfeln zu machen, um daraus größeres Spielfeld mit mehr würfeln erstellen, durch kopien der würfel
  private int groesse;   //Wenn groesse = 4 -> 4x4 Spielfeld
  private String spielfeld;      //Speichert das zuletzt gewürfelte Spielfeld
  
  Spielfeld() {
    wuerfel = new ArrayList<Wuerfel>();
    set_Standartwuerfel();
    spielfeld = "";
  }
  
  public void set_Standartwuerfel() {
    groesse = 4;
    wuerfel.add(new Wuerfel("dampec"));
    wuerfel.add(new Wuerfel("tirbal"));
    wuerfel.add(new Wuerfel("elruwi"));
    wuerfel.add(new Wuerfel("oaixrf"));
    wuerfel.add(new Wuerfel("seeifh"));
    wuerfel.add(new Wuerfel("snhrie"));
    wuerfel.add(new Wuerfel("etgvni"));
    wuerfel.add(new Wuerfel("unglye"));
    wuerfel.add(new Wuerfel("ataeio"));
    wuerfel.add(new Wuerfel("raisom"));
    wuerfel.add(new Wuerfel("alcrse"));
    wuerfel.add(new Wuerfel("knouet"));
    wuerfel.add(new Wuerfel("ontdse"));
    wuerfel.add(new Wuerfel("sepult"));
    wuerfel.add(new Wuerfel("baqomj"));
    wuerfel.add(new Wuerfel("devazn"));
  }
  
  void print_alle_wuerfel() {
    for(Wuerfel w : wuerfel) {
      w.print_wuerfel(); 
    }
  }
  
  String wuerfel_Spielfeld() {
    char[] alle_buch = new char[groesse * groesse]; //Erstellt char-array für die gewürfelten Buchstaben
    for(int i = 0; i < alle_buch.length; i++) {
      alle_buch[i] = wuerfel.get(i).wuerfeln(); //Alle Wuerfel werden gewürfelt und in Array gespeichert
    }
    spielfeld = new String(alle_buch);
    return spielfeld;
  }
  
  public String get_Spielfeld() {
    return spielfeld; 
  }
}
