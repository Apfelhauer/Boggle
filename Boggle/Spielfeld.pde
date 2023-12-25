class Spielfeld {
  private ArrayList<Wuerfel> wuerfel;
  private int groesse;   //Wenn groesse = 4 -> 4x4 Spielfeld
  
  Spielfeld() {
    wuerfel = new ArrayList<Wuerfel>();
    set_Standartspielfeld();
  }
  
  public void set_Standartspielfeld() {
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
  
  
  
}
