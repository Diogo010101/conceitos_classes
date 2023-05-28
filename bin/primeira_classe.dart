import 'dart:io';

void main() {
  //Chama função que cria uma lista dinâmica com os dados da fruta
  List<dynamic> listaFruta = cadastrarFruta();
  //Adicionando os dados digitados dentro de variáveis
  String nome = listaFruta[0];
  double peso = listaFruta[1];
  String cor = listaFruta[2];
  String sabor = listaFruta[3];
  int diasDesdeColheita = listaFruta[4];
  //variavel para utilizar como método do classe
  bool? isMadura;

  Fruta fruta1 = Fruta(
      nome: nome,
      peso: peso,
      cor: cor,
      sabor: sabor,
      diasDesdeColheita: diasDesdeColheita,
      isMadura: isMadura);

  //Chamando o método
  isMadura = fruta1.estaMadura(diasDesdeColheita, nome);

  print("\nDados da fruta\n");
  print("Fruta: ${fruta1.nome}\n"
      "Peso: ${fruta1.peso.toStringAsPrecision(3)}Kg\n"
      "Cor: ${fruta1.cor}\n"
      "Sabor: ${fruta1.sabor}\n"
      "Foi colhida à ${fruta1.diasDesdeColheita} dias\n"
      "A fruta está madura? $isMadura");

  //instânciando os objetos
  Legumes brocolis = Legumes("Blocolis", 240, "verde", true);
  Citricas laranja = Citricas("Laranja", 80, "Laranja", "Doce", 15, 6);
  FrutasSecas castanha = FrutasSecas("Castanha", 5, "Marrom", "Suave", 8, 0.38);

  brocolis.printAlimento();
  laranja.printAlimento();
  castanha.printAlimento();

  brocolis.cozinhar();
  laranja.fazerSuco();
  laranja.estaMadura(diasDesdeColheita, "Laranja");

  //Usando o método da classe Abstrata Bolo que importamos para a classe Fruta,
  laranja.separarIngredientes();
  laranja.prepararMassa();
  laranja.assar();

  print("\n");
  castanha.prepararMassa();
}

/*FIM MAIN */

//Classe Fruta
class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;
//Construtor variado
  Fruta(
      {required String nome,
      required double peso,
      String cor = "n/a",
      required this.sabor,
      required this.diasDesdeColheita,
      this.isMadura})
      : super(nome, peso, cor) {
    nome = nome.toUpperCase();
    cor = cor.toUpperCase();
    sabor = sabor.toUpperCase();
  }

  //Métodos
  bool estaMadura(int diasDesdeColheita, String nomeFruta) {
    int? diasParaMadura;
    if (nomeFruta.toUpperCase() == "BANANA") {
      diasParaMadura = 20;
    } else if (nomeFruta.toUpperCase() == "GOIABA") {
      diasParaMadura = 6;
    } else if (nomeFruta.toUpperCase() == "MAÇÃ" ||
        nomeFruta.toUpperCase() == "MAÇA") {
      diasParaMadura = 6;
    } else {
      diasParaMadura = 25;
    }
    isMadura = diasDesdeColheita >= diasParaMadura;

    if (isMadura == true) {
      print(
          "A fruta $nome precisa de $diasParaMadura dias para amadurecer e já fazem $diasDesdeColheita dias que ela foi colhida, então a $nome está madura");
      return true;
    } else {
      print(
          "A $nome foi colhida a $diasDesdeColheita, mas precisa de $diasParaMadura dias para amadurecer, ainda faltam ${diasParaMadura - diasDesdeColheita} dias para que a $nome esteja completamente madura");
      return false;
    }
  }

  void fazerSuco() {
    print(
        "$nome é um ótimo fruto para fazer suco, você concerteza vai adorar!");
  }

  //Métodos da classe abstrata Bolo na classe Fruta
  @override
  void separarIngredientes() {
    print(
        "Separar a(o) $nome o restante dos ingredientes para preparar o bolo");
  }

  @override
  void prepararMassa() {
    print(
        "Pré aquecer o forno e depois misture a(o) $nome com açucar, ovos, água e fermento");
  }

  @override
  void assar() {
    print("Colocar no forno de 30 a 40 minutos e você terá um bolo de $nome");
  }
}

//Função Cadastrar fruta
List cadastrarFruta() {
  print("Digite os dados da Fruta\n");
  print("Nome: ");
  String? inputNome = stdin.readLineSync();
  String nome = inputNome.toString();

  print("Peso em Kg: ");
  String? inputPeso = stdin.readLineSync();
  double peso = double.parse(inputPeso!); //Kg

  print("Cor: ");
  String? inputCor = stdin.readLineSync();
  String cor = inputCor.toString();

  print("Sabor: ");
  String? inputSabor = stdin.readLineSync();
  String sabor = inputSabor.toString();

  print("Dias desde a colheita: ");
  String? inputDiasColheita = stdin.readLineSync();
  int diasDesdeColheita = int.parse(inputDiasColheita!);

  List<dynamic> listaFruta = [
    nome,
    peso,
    cor,
    sabor,
    diasDesdeColheita,
  ];

  return listaFruta;
}

//Classe Alimento
class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este(a) $nome pesa $peso kg e é $cor.");
  }
}

//Classe Lugumes
class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  //construtor
  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  //Métodos
  void cozinhar() {
    if (isPrecisaCozinhar == true) {
      print("O legume está cozinhando!");
    } else {
      print("Não precisa cozinhar");
    }
  }

  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
  }

  @override
  void prepararMassa() {
    //TODO implement fazerMassa
  }

  @override
  void assar() {
    // TODO: implement assar
  }
}

//Classe Citricas
class Citricas extends Fruta {
  double nivelDeAzedo;

  //Construtor
  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelDeAzedo)
      : super(
            nome: nome,
            peso: peso,
            cor: cor,
            sabor: sabor,
            diasDesdeColheita: diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe = true) {
      print("Existe!");
    } else {
      print("Não existe.");
    }
  }
}

class FrutasSecas extends Fruta {
  double porcentagemDeOleoNatural;

  FrutasSecas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemDeOleoNatural)
      : super(
            nome: nome,
            peso: peso,
            cor: cor,
            sabor: sabor,
            diasDesdeColheita: diasDesdeColheita);

  @override
  void prepararMassa() {
    print(
        "Retirar as cascas se houver e depois misturar com a farinha, ovos, água, açucar e fermento");
  }
}

class FrutosDoMar extends Alimento {
  bool temEspinha;

  FrutosDoMar(String nome, double peso, String cor, this.temEspinha)
      : super(
          nome,
          peso,
          cor,
        );

  void pescar() {
    print("Pescou $nome de $peso kg");
  }
}

//Criando a classe Abstrata

abstract class Bolo {
  //Separo os ingredientes
  void separarIngredientes();
  //Preparo a massa
  void prepararMassa();
  //Assar
  void assar();
}
