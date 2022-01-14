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
      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vídeo de la semana",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                Divider(),
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ],
            )),
      ),
    );
  }
}
