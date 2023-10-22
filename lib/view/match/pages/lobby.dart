import 'package:flutter/material.dart';
import 'package:truco_mobile/services/constants.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  bool remotePlayer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
            child: Text(
          'Lobby',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: defaultpd * 2),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultpd * 2),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                remotePlayer
                    ? Text('Remote Player')
                    : Text('Aguardando o outro jogador'),
                Text('Local Player')
              ]),
        ),
      ),
    );
  }
}
