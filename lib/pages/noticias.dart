import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:share/share.dart';

import 'package:radioprogresoappoficial/pages/new.dart';

const Utf8Codec utf8 = Utf8Codec();

class ListadoNoticias extends StatefulWidget {
  ListadoNoticias({Key key}) : super(key: key);

  @override
  _ListadoNoticiasState createState() => _ListadoNoticiasState();
}

class _ListadoNoticiasState extends State<ListadoNoticias> {
  Future<List<dynamic>> futureNews;

  Future<List<dynamic>> recibirNews() async {
    final respuesta =
        await http.get("https://radioprogreso-a03a6.web.app/news/news.json");

    if (respuesta.statusCode == 200) {
      print(respuesta.body.toString());
      String body = utf8.decode(respuesta.bodyBytes);
      return jsonDecode(body);
    } else {
      throw Exception("Conexion fallo");
    }
  }

  @override
  void initState() {
    super.initState();
    futureNews = recibirNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data[0]["nombre"]);
            return ListView(
              children: _news(snapshot.data, context),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        });
  }
}

// Con esta funcion creamos la lista de noticias.
List<Widget> _news(List elementos, context) {
  List<Widget> news = [];

  elementos.forEach((element) {
    news.add(Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoticiaPage(
                            url: element["urlnew"],
                          )));
            },
            child: Column(
              children: [
                FadeInImage.assetNetwork(
                    placeholder: "img/loading.gif", image: element["image"]),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 5, right: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        element["title"],
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        element["short"],
                        style: TextStyle(fontSize: 13, color: Colors.black45),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoticiaPage(
                                url: element["urlnew"],
                              )));
                },
                child: Row(
                  children: [
                    Icon(Icons.remove_red_eye_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Ver completo")
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  final RenderBox box = context.findRenderObject();
                  Share.share(element["urlshare"],
                      subject: element["title"],
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                child: Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Compartir")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  });

  return news;
}
