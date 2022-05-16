import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/radio_service.dart';

class TittleRadioOnLine extends StatelessWidget {
  const TittleRadioOnLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Estás escuchando:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(context.watch<RadioService>().currentProgram,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
          SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset("img/logorp.png"),
          ),
          const Text(
            "Radio Progreso",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
