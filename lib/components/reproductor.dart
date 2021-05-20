import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/PlayerRadio.dart';

class Reproductor extends StatefulWidget {
  Reproductor({Key key}) : super(key: key);

  @override
  _ReproductorState createState() => _ReproductorState();
}

class _ReproductorState extends State<Reproductor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
          border: Border(
              top: BorderSide(
                  width: 2, color: Colors.green[900], style: BorderStyle.solid),
              bottom: BorderSide(
                  width: 2,
                  color: Colors.green[900],
                  style: BorderStyle.solid))),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width * 0.78,
              //height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Escuchar radio en vivo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Online",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.18,
              //height: 70,
              child: PlayerRadio()),
        ],
      ),
    );
  }
}
