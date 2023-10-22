import 'dart:math';

import 'package:flutter/material.dart';
import 'package:truco_mobile/models/deck.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> manilhas = [];
  String vira = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                vira = getRandomCard(cards);
                manilhas = validaCarta(vira);
                print('Vira: ${vira}');
                print('Manilhas: ${manilhas}');
              },
              child: Text('Clica em mim'))),
    );
  }
}
