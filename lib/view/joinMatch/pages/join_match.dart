import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truco_mobile/services/constants.dart';
import 'package:truco_mobile/services/deck_api.dart';
import 'package:truco_mobile/services/game_controller.dart';

class JoinMatchPage extends StatefulWidget {
  const JoinMatchPage({super.key});

  @override
  State<JoinMatchPage> createState() => _JoinMatchPageState();
}

class _JoinMatchPageState extends State<JoinMatchPage> {
  final TextEditingController _nickController = TextEditingController();
  final TextEditingController _matchCode = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controlDeck = DeckService();
  final controlMatch = GameControl();

  @override
  void dispose() {
    super.dispose();
    _nickController.dispose();
    _matchCode.dispose();
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
                  'Entrar em uma partida',
                  style: TextStyle(
                      fontSize: defaultpd * 2, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nickController,
                        decoration:
                            const InputDecoration(hintText: 'Insira seu nick'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Preencha o campo corretamente!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _matchCode,
                        maxLength: 8,
                        decoration: const InputDecoration(
                            hintText: 'Insira o codigo da sala'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Preencha o campo corretamente!';
                          }
                          if (value.length < 8) {
                            return 'Insira um código válido';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            controlMatch.joinMatch(
                                _nickController.text, _matchCode.text);
                          }
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 46, 105, 153),
                              borderRadius: BorderRadius.circular(defaultpd)),
                          child: const Center(
                            child: Text(
                              'Entrar na sala',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
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
