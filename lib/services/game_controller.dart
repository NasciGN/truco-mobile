import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GameControl extends ChangeNotifier {
  final FirebaseFirestore _Firestore = FirebaseFirestore.instance;

  String generateMatchCode() {
    final random = Random();
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(Iterable.generate(
        8, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  Future<void> createMatch(String player1) async {
    String matchID = generateMatchCode();
    final matchData = {'matchID': matchID, 'player1': player1, 'player2': null};
    await _Firestore.collection('matchs').doc(matchID).set(matchData);
  }

  Future<void> joinMatch(String player2, String matchID) async {
    final matchRef =
        FirebaseFirestore.instance.collection('matchs').doc(matchID);
    final matchSnapshot = await matchRef.get();

    if (matchSnapshot.exists) {
      final matchData = matchSnapshot.data() as Map<String, dynamic>;

      if (matchData['player2'] == null) {
        // A sala tem um slot vazio para o jogador 2
        await matchRef.update({'player2': player2});
      } else {
        print('Sala cheia');
      }
    } else {
      print('Sala não existe');
    }
  }
}
