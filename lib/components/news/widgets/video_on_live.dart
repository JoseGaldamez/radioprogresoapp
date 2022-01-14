import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoOnLive extends StatefulWidget {
  const VideoOnLive({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoOnLive> createState() => _VideoOnLiveState();
}

class _VideoOnLiveState extends State<VideoOnLive> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: context.read<FirestoreService>().audiovisuales.live,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false, isLive: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
                Container(
                  width: 75,
                  child: Image.asset("img/streaming.png"),
                ),
              ],
            )),
      ),
    );
  }
}
