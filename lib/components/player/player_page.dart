import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/components/player/player.dart';
import 'package:radioprogresoappoficial/components/player/widgets/image_current_program_radio.dart';
import 'package:radioprogresoappoficial/components/player/widgets/like_button_radio.dart';
import 'package:radioprogresoappoficial/components/player/widgets/name_program_radio.dart';
import 'package:radioprogresoappoficial/components/player/widgets/tittle_radio.dart';
import 'package:radioprogresoappoficial/services/radio_service.dart';

class PlayerPage extends StatefulWidget {
  final AudioHandler audioHandler;
  PlayerPage({Key? key, required this.audioHandler}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        context.watch<RadioService>().playing
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("img/animation/playing.gif"),
                ],
              )
            : Container(),
        Column(
          children: [
            TittleRadioOnLine(),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CurrentProgramImage(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Player(
                        audioHandler: widget.audioHandler,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NameOfProgramRadio(),
            LikeButtonRadio()
          ],
        ),
      ],
    );
  }
}
