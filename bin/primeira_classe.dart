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
      "Peso: ${fruta1.peso}Kg\n"
      "Cor: ${fruta1.cor}\n"
      "Sabor: ${fruta1.sabor}\n"
      "Foi colhida à ${fruta1.diasDesdeColheita} dias\n"
      "A fruta está madura? $isMadura");
}

/*FIM MAIN */

//Classe Fruta
class Fruta {
  String nome;
  double peso;
  String cor;
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;
//Construtor variado
  Fruta(
      {required this.nome,
      required this.peso,
      this.cor = "n/a",
      required this.sabor,
      required this.diasDesdeColheita,
      this.isMadura}) {
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
}
/*Fim Classe Fruta */

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
//Fim  Função Cadastrar Fruta
