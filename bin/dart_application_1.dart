import 'dart:ffi';

void main(List<String> arguments) {
  String nome = "Laranja";
  double peso = 100.3;
  String cor = "Verde";
  String sabor = "Doce e citrica";
  int diaDesdedeColheta = 10;
  bool isMadura = funcEstamadura(diaDesdedeColheta);

  Fruta fruta01 = Fruta(nome, peso, cor, sabor, diaDesdedeColheta);
  Fruta fruta02 = Fruta("Pessego", 50, "Laranja", "Doce", 15);

  //fruta01.estarMaduro(10);
  //fruta02.estarMaduro(40);
  Legumes mandioca1 = Legumes('Macaxeira', 1200, 'Marrom', true);
  Fruta banana1 = Fruta('Banana', 75, 'Amarela', 'Doce', 12);
  Nozes macadamia1 = Nozes('Macadâmia', 2, 'Branco Amarelado', 'Doce', 20, 35);
  Citricas limao1 = Citricas('Limão', 100, 'Verde', 'Azedo', 5, 9);
  Citricas maracuja1 = Citricas('Maracujá', 120, 'Amarelo', 'Azedo', 6, 10);

  macadamia1.printAlimento();
  banana1.printAlimento();
  mandioca1.printAlimento();
  limao1.printAlimento();
  mandioca1.printAlimento();

  mandioca1.cozinhar();
  limao1.fazerSuco();
  maracuja1.fazerSuco();

  maracuja1.separarIngredientes();
  maracuja1.fazerMassa();
  maracuja1.assar();
}

funcQuantosDias(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura");
  } else {
    print("A/O $nome não está madura");
  }
  if (cor != null) {
    print("A $nome é $cor");
  }
}

bool funcEstamadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('Este(a) $nome pesa $peso e é $cor');
  }
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  estarMaduro(int diasparamadura) {
    isMadura = diasDesdeColheita >= diasparamadura;
    print(
        'A sua $nome foi colhida há $diasDesdeColheita e precisa de $diasparamadura para poder comer. Ela está madura? $isMadura');
  }

  void fazerSuco() {
    print('Você fez um ótimo suco de $nome');
  }

  @override
  void assar() {
    print("Colocando Bolo de $nome para assar!!!");
  }

  @override
  void fazerMassa() {
    print("Misturando ingrediantes para fazer a massa de Bolo de  $nome!!!");
  }

  @override
  void separarIngredientes() {
    print("Separando os ingredientes para o Bolo de  $nome!!!");
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;
  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando!');
    } else {
      print('Nem precisa cozinhar!');
    }
  }

  @override
  void assar() {
    print("Colocando Bolo de $nome para assar!!!");
  }

  @override
  void fazerMassa() {
    print("Misturando ingrediantes para fazer a massa de Bolo de  $nome!!!");
  }

  @override
  void separarIngredientes() {
    print("Separando os ingredientes para o Bolo de  $nome!!!");
  }
}

class Citricas extends Fruta {
  double nivelAzedo;
  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe refrigerante de $nome');
    } else {
      print('Não existe refri de $nome');
    }
  }
  @override
  void fazerMassa() {
    print('Fazendo o suco da $nome!!!');
    super.fazerMassa();
  }
  
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);
  
  @override
  void fazerMassa() {
    print('Descascando a noz $nome!!!');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();

  void fazerMassa();

  void assar();
}
