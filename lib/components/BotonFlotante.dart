import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_radio/flutter_radio.dart';

class BotonFlotante extends StatefulWidget {
  BotonFlotante({Key key}) : super(key: key);

  @override
  _BotonFlotanteState createState() => _BotonFlotanteState();
}

class _BotonFlotanteState extends State<BotonFlotante> {
  static const streamUrl = "https://streamingcwsradio30.com:7045/stream";

  //"http://stream.zeno.fm/pzp3x99bd2zuv";
  bool isPlaying = true;

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }

  Future playingStatus() async {
    await FlutterRadio.isPlaying();
    setState(() {
      isPlaying = !isPlaying;
    });

    print("isPlaying");
    print(isPlaying);
  }

  @override
  void initState() {
    super.initState();
    audioStart();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print("Reproduciendo");
        FlutterRadio.playOrPause(url: streamUrl);
        playingStatus();
      },
      elevation: 40,
      child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: const Alignment(0.7, -0.5),
              end: const Alignment(0.6, 0.5),
              colors: [
                Color(0xFF017011),
                Color(0xFF029317),
              ],
            ),
          ),
          child: isPlaying ? Icon(Icons.play_arrow) : Icon(Icons.pause)),
    );
  }
}
