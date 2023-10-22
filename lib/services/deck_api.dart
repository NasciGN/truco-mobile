import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:truco_mobile/models/cart.dart';
import 'package:truco_mobile/models/deck.dart';

class DeckService extends GetxController {
  String deckID = '';
  String url = 'https://deckofcardsapi.com/api/';

  List<String> personDeck = deck;

  Future<String> getNewDeck() async {
    final response =
        await http.get(Uri.parse('$url/deck/new/shuffle/?cards=$personDeck'));
    final jsonResponse = jsonDecode(response.body);
    final deckID = jsonResponse['deck_id'];
    return deckID;
  }

  Future<List<MyCard>> getThreeCards(String deck) async {
    final response = await http.get(Uri.parse('$url/$deck/draw/?count=3'));
    final jsonResponse = jsonDecode(response.body);
    final cardsData = jsonResponse['cards'] as List<dynamic>;

    final List<MyCard> cards = cardsData.map((cardData) {
      return MyCard(
        id: cardData['code'],
        cardPng: cardData['images']['png'],
      );
    }).toList();

    return cards;
  }

  Future<void> reshuffleDeck(deck) async {
    await http.get(Uri.parse('$url/deck/$deck/shuffle/'));
  }

  Future<MyCard> getVira(String deck) async {
    final response = await http.get(Uri.parse('$url/$deck/draw/?count=1'));
    final jsonResponse = jsonDecode(response.body);

    final cardsData = jsonResponse['cards'] as List<dynamic>;

    if (cardsData.isNotEmpty) {
      final cardData = cardsData[0];
      final card = MyCard(
        id: cardData['code'],
        cardPng: cardData['images']['png'],
      );

      return card;
    } else {
      throw Exception('Não há cartas disponíveis.');
    }
  }
}
