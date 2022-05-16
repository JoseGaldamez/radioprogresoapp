import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/components/player/player.dart';
import 'package:radioprogresoappoficial/components/player/widgets/button_voting.dart';
//import 'package:radioprogresoappoficial/components/player/widgets/image_current_program_radio.dart';
//import 'package:radioprogresoappoficial/components/player/widgets/like_button_radio.dart';
//import 'package:radioprogresoappoficial/components/player/widgets/name_program_radio.dart';
import 'package:radioprogresoappoficial/components/player/widgets/tittle_radio.dart';
import 'package:radioprogresoappoficial/services/radio_service.dart';

class PlayerPage extends StatefulWidget {
  final AudioHandler audioHandler;
  const PlayerPage({Key? key, required this.audioHandler}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: context.watch<RadioService>().playing
                          ? [Colors.green, Colors.white10]
                          : [Colors.green.withOpacity(0.2), Colors.white10])),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.82,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.green,
                  width: 5,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: context.watch<RadioService>().playing ? 0.5 : 0,
                    child: Image.asset("img/animation/playing.gif")),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TittleRadioOnLine(),
                    Container(
                      child: Player(
                        audioHandler: widget.audioHandler,
                      ),
                    ),
                    ButtonVoting(),
                  ],
                ),
              )),
          //const NameOfProgramRadio(),
          //const LikeButtonRadio()
        ],
      ),
    );
  }
}
