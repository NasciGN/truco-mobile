import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truco_mobile/services/firebase/firebase_options.dart';
import 'package:truco_mobile/view/createMatch/pages/create_match.dart';
import 'package:truco_mobile/view/home/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:truco_mobile/view/joinMatch/pages/join_match.dart';

Future<void> main() async {
  try {
    await Firebase.initializeApp(
      name: "truco-mobile",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Erro ao inicializar o Firebase: $e');
  }
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => const HomePage()),
      GetPage(name: '/createMatch', page: () => const CreateMatchPage()),
      GetPage(name: '/joinMatch', page: () => const JoinMatchPage())
    ],
  ));
}
