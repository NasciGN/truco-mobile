import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truco_mobile/services/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultpd * 4, vertical: defaultpd * 25),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
            onTap: () {
              Get.offNamed('/createMatch');
            },
            child: Container(
              height: 40,
              width: double.infinity * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultpd),
                color: const Color.fromARGB(255, 46, 105, 153),
              ),
              child: const Center(
                child: Text(
                  'Entrar em uma partida',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed('/joinMatch');
            },
            child: Container(
              height: 40,
              width: double.infinity * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultpd),
                color: const Color.fromARGB(255, 46, 105, 153),
              ),
              child: const Center(
                child: Text(
                  'Entrar em uma Partida',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
