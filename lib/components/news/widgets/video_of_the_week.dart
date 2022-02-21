import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoOfTheWeek extends StatefulWidget {
  const VideoOfTheWeek({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoOfTheWeek> createState() => _VideoOfTheWeekState();
}

class _VideoOfTheWeekState extends State<VideoOfTheWeek> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: context.read<FirestoreService>().audiovisuales.semanal,
      flags: const YoutubePlayerFlags(
          autoPlay: false, mute: false, controlsVisibleAtStart: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Vídeo de la semana",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey[600],
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.green,
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
