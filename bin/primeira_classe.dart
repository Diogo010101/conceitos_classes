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
  print("\nComo base nas informações fornecidas, temos a seguinte resposta:\n");
  isMadura = fruta1.estaMadura(diasDesdeColheita, nome);

  print(
      "\n--------------------------------Fruto: ${fruta1.nome}--------------------------------\n"
      "Peso: ${fruta1.peso.toStringAsPrecision(3)}Kg\n"
      "Cor: ${fruta1.cor}\n"
      "Sabor: ${fruta1.sabor}\n"
      "Foi colhido à ${fruta1.diasDesdeColheita} dias\n"
      "O frutO está maduro? $isMadura");

  //instânciando os objetos

  print(
      "\n--------------------------------Tentando as novas classes--------------------------------\n");
  Legumes brocolis = Legumes("Blocolis", 240, "verde", true);
  Citricas laranja = Citricas("Larannja", 80, "Laranja", "Doce", 15, 6);
  FrutasSecas castanha = FrutasSecas("Castanha", 5, "Marrom", "Suave", 8, 0.38);

  brocolis.printAlimento();
  laranja.printAlimento();
  castanha.printAlimento();

  brocolis.cozinhar();
  laranja.fazerSuco();
  laranja.estaMadura(diasDesdeColheita, "Laranja");
}

/*FIM MAIN */

//Classe Fruta
class Fruta extends Alimento {
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
          "O fruto $nome precisa de $diasParaMadura dias para amadurecer e já fazem $diasDesdeColheita dias que ele foi colhido, então, $nome está madura");
      return true;
    } else {
      print(
          "O fruto $nome foi colhidO a $diasDesdeColheita, mas precisa de $diasParaMadura dias para amadurecer, ainda faltam ${diasParaMadura - diasDesdeColheita} dias para que $nome esteja completamente madura");
      return false;
    }
  }

  void fazerSuco() {
    print(
        "$nome é um ótimo fruto para fazer suco, você concerteza vai adorar!");
  }
}

//Função Cadastrar fruta
List cadastrarFruta() {
  print("Digite os dados do Fruto\n");
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
class Legumes extends Alimento {
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
}
