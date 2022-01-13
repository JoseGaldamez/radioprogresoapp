import 'package:flutter/material.dart';

class NotiNadaPage extends StatefulWidget {
  NotiNadaPage({Key? key}) : super(key: key);

  @override
  _NotiNadaPageState createState() => _NotiNadaPageState();
}

class _NotiNadaPageState extends State<NotiNadaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text("Notinada")],
      ),
    );
  }
}
