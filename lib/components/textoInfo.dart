import 'package:flutter/material.dart';

class TextoInfoApp extends StatelessWidget {
  const TextoInfoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            child: Image.asset(
              "img/logorp.png",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Radio Progreso HN",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900),
          ),
          Text(
            "La voz que está con vos",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Un equipo diverso de mujeres y hombres que trabajan por la construcción de una sociedad justa, equitativa y soberana, a través de valores inspirados en el reino de Dios y la espiritualidad ignaciana, soñamos con una Honduras ejerciendo soberanía, que respete los derechos humanos y que promueva relaciones de horizontalidad.",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Entiendo",
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "V3.0.0",
            style: TextStyle(color: Colors.grey[300], fontSize: 12),
          ),
          Text(
            "Multimedia - Radio Progreso",
            style: TextStyle(color: Colors.grey[300], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
