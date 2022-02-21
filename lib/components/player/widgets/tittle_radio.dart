import 'package:flutter/material.dart';

class TittleRadioOnLine extends StatelessWidget {
  const TittleRadioOnLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset("img/logorp.png"),
          ),
          const Text(
            "Radio Progreso",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            "En vivo",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
