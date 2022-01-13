import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/player/player.dart';

class PlayerPage extends StatefulWidget {
  final AudioHandler audioHandler;
  PlayerPage({Key? key, required this.audioHandler}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Player(
        audioHandler: widget.audioHandler,
      ),
    );
  }
}
