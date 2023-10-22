import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:truco_mobile/models/cart.dart';
import 'package:truco_mobile/services/deck_api.dart';

class MatchController extends ChangeNotifier {
  final controlDeck = DeckService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List> deliverCards(String deckID) async {
    List<dynamic> deck = await controlDeck.getThreeCards(deckID);

    return deck;
  }

  Future<void> newHand(String matchID) async {}

  Future<void> newRotate(String matchID, String deckID) async {
    await controlDeck.reshuffleDeck(deckID);
    MyCard vira = await controlDeck.getVira(deckID);

    List<dynamic> localPlayerDeck = await deliverCards(deckID);
    List<dynamic> remotePlayerDeck = await deliverCards(deckID);

    await _firestore
        .collection('matchs')
        .doc(matchID)
        .collection('rodada')
        .doc()
        .set({
      'id': FirebaseFirestore.instance
          .collection('matchs')
          .doc(matchID)
          .collection('rotate')
          .doc()
          .id,
      'number': 1,
      'Points': 1,
      'IsTruco': false,
      'WhoAsked': null,
      'WhoAccept': null,
      'Winner': null,
      'vira': vira.id,
      'player1': localPlayerDeck,
      'player2': remotePlayerDeck
    });
  }

  Future<void> playCard(String cardID, String player) async {}

  Future<void> updateTotalPoints(String player) async {}

  Future<void> updateCardVira(String cardID) async {}

  Future<void> updateTruco(String whoAsked, String whoAccept) async {}

  Future<void> updateWinnerHand(String player) async {}

  Future<void> updateWinnerMatch(String player) async {}

  Future<void> updatePlayerDeck(String player) async {}

  //Stream<QuerySnapshot> getOponentCard(String cardID, String player) {}
}
