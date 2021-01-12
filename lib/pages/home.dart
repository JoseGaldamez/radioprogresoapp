import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/reproductor.dart';
import 'package:radioprogresoappoficial/components/textoInfo.dart';
import 'package:radioprogresoappoficial/pages/listNews.dart';
//import 'package:radioprogresoappoficial/pages/noticias.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("img/logo_principal.png"),
        centerTitle: false,
        actions: [
          SizedBox(
            width: 35.0,
          ),
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.grey[300],
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(child: TextoInfoApp()),
                      );
                    });
              })
        ],
      ),
      body: Column(
        children: [Expanded(child: ListNewsPage()), Reproductor()],
      ),
    );
  }
}
