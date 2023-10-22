import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
}
