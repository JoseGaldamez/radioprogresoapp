import 'package:flutter/material.dart';

class TittleRadioOnLine extends StatelessWidget {
  const TittleRadioOnLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            width: 50,
            child: Image.asset("img/logorp.png"),
          ),
          Text(
            "Radio Progreso",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("En vivo")
        ],
      ),
    );
  }
}
