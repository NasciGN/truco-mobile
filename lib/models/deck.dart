// Cartas do Baralho de truco
import 'dart:math';

final cards = [
  cardsA,
  cards2,
  cards3,
  cards4,
  cards5,
  cards6,
  cards7,
  cardsQ,
  cardsJ,
  cardsK,
];
final cardsA = ['AD', 'AS', 'AH', 'AC'];
final cards2 = ['2D', '2S', '2H', '2C'];
final cards3 = ['3D', '3S', '3H', '3C'];
final cards4 = ['4D', '4S', '4H', '4C'];
final cards5 = ['5D', '5S', '5H', '5C'];
final cards6 = ['6D', '6S', '6H', '6C'];
final cards7 = ['7D', '7S', '7H', '7C'];
final cardsQ = ['QD', 'QS', 'QH', 'QC'];
final cardsJ = ['JD', 'JS', 'JH', 'JC'];
final cardsK = ['KD', 'KS', 'KH', 'KC'];

void getDeck() {
  print(cards);
}

List<String> validaCarta(String vira) {
  final listcards = cards;
  List<String> manilhas = [];
  int cont = 0;
  for (final x in listcards) {
    if (x.contains(vira)) {
      if (cont == 9) {
        manilhas = listcards[0];
        break;
      } else {
        manilhas = listcards[cont + 1];
        break;
      }
    } else {
      cont = cont + 1;
    }
  }
  return manilhas;
}

String getRandomCard(List<List<String>> cards) {
  final random = Random();
  // Gere um índice aleatório para selecionar um dos conjuntos de cartas
  int randomSetIndex = random.nextInt(cards.length);

  // Obtenha o conjunto de cartas correspondente ao índice gerado
  List<String> selectedCardSet = cards[randomSetIndex];

  // Gere um índice aleatório para selecionar uma carta do conjunto
  int randomCardIndex = random.nextInt(selectedCardSet.length);

  // Obtenha a carta aleatória
  String randomCard = selectedCardSet[randomCardIndex];

  return randomCard;
}
