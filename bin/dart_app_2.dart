void main(List<String> args) {
  fruta();
}
fruta(){
  String nome = "Laranja";
  double peso = 0.30;
  int diasDesdeAColheita = 12;
  int diasAteFicarMadura = 40;
  chamarFruta(nome, peso, diasDesdeAColheita, diasAteFicarMadura);
}
String isMadura(int foiColhida, int diasParaAmadurecer) {
  if (foiColhida >= diasParaAmadurecer) {
    return "Está madura!";
  } else {
    return "Não está madura!";
  }
}

chamarFruta(String nome, double peso, int colhida, int ficarMadura) {
  String madura = isMadura(colhida, ficarMadura);
  print("A $nome pesa ${peso}kg!\n"
      "Ela foi colhida fazem $colhida dias e precisa de $ficarMadura para amadurecer!\n"
      "Logo, a $nome $madura");
}