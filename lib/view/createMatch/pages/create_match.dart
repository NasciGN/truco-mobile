// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truco_mobile/services/constants.dart';
import 'package:truco_mobile/services/deck_api.dart';

class CreateMatch extends StatefulWidget {
  const CreateMatch({super.key});

  @override
  State<CreateMatch> createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  final TextEditingController _nickController = TextEditingController();
  final controlDeck = DeckService();

  @override
  void dispose() {
    super.dispose();
    _nickController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultpd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Get.offNamed('/home');
                },
                icon: const Icon(Icons.arrow_back)),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: defaultpd * 10, horizontal: defaultpd * 4),
              child: Column(children: [
                const Text(
                  'Criar uma nova partida',
                  style: TextStyle(
                      fontSize: defaultpd * 2, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nickController,
                  decoration:
                      const InputDecoration(hintText: 'Insira seu nick'),
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 46, 105, 153),
                        borderRadius: BorderRadius.circular(defaultpd)),
                    child: const Center(
                      child: Text(
                        'Criar Sala',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
