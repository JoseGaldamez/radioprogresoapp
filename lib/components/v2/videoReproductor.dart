import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class VideoReproductor extends StatelessWidget {
  final String videoId;
  const VideoReproductor(this.videoId, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String html = '<iframe width="560" height="315" src="https://www.youtube.com/embed/'+
        videoId +
        '?modestbranding=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';

    return Container(
      width: double.infinity,
      child: Html(data: html.toString()),
    );
  }

}