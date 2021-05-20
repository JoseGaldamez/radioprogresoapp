import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/models/news.dart';
import 'package:radioprogresoappoficial/pages/newDetails.dart';

class NuestraPalabra extends StatefulWidget {
  final NewsModel np;
  NuestraPalabra(this.np, {Key key}) : super(key: key);

  @override
  _NuestraPalabraState createState() => _NuestraPalabraState();
}

class _NuestraPalabraState extends State<NuestraPalabra> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [widget.np != null ? buildNPImage() : Text("No hay data")],
    );
  }

  InkWell buildNPImage() {
    return InkWell(
      onTap: () {
        print(widget.np.url);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewsDetails(widget.np)));
      },
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            "img/np.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
