import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:radioprogresoappoficial/models/news.dart';
import 'package:share/share.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel nota;
  NewsDetails(this.nota, {Key key}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  String date = '';

  @override
  void initState() {
    super.initState();
    DateTime notaDate = DateTime.parse(widget.nota.date);

    date = "${notaDate.day} de ${_mes(notaDate.month)} de ${notaDate.year}";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volver"),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                final RenderBox box = context.findRenderObject();
                Share.share(
                    "Recomiendo está nota en Radio Progreso: " +
                        widget.nota.url,
                    subject: widget.nota.title,
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
              child: Container(
                  padding: EdgeInsets.all(5), child: Icon(Icons.share)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 2),
                  child: Text(
                    widget.nota.title,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 3, right: 10, bottom: 15),
                  child: Text(
                    date,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: 5,
                  width: double.infinity,
                ),
                Html(
                  data: widget.nota.content,
                  style: {
                    "html": Style(
                        margin: EdgeInsets.all(0), padding: EdgeInsets.all(0)),
                    "a": Style(textDecoration: TextDecoration.none),
                    "iframe": Style(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        width: double.infinity),
                    "figcaption": Style(
                      color: Colors.grey[600],
                      textAlign: TextAlign.center,
                      padding: EdgeInsets.all(5),
                      fontSize: FontSize(13),
                    ),
                    "figure": Style(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0)),
                    "img": Style(
                        width: double.infinity,
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0)),
                    "p": Style(
                        textAlign: TextAlign.justify,
                        fontSize: FontSize(19),
                        color: Colors.grey[800],
                        padding: EdgeInsets.symmetric(horizontal: 10))
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _mes(mes) {
    String estemes = "";
    if (mes == 1) {
      estemes = "Enero";
    }
    if (mes == 2) {
      estemes = "Febrero";
    }
    if (mes == 3) {
      estemes = "Marzo";
    }
    if (mes == 4) {
      estemes = "Abril";
    }
    if (mes == 5) {
      estemes = "Mayo";
    }
    if (mes == 6) {
      estemes = "Junio";
    }
    if (mes == 7) {
      estemes = "Julio";
    }
    if (mes == 8) {
      estemes = "Agosto";
    }
    if (mes == 9) {
      estemes = "Septiembre";
    }
    if (mes == 10) {
      estemes = "Octubre";
    }
    if (mes == 11) {
      estemes = "Noviembre";
    }
    if (mes == 12) {
      estemes = "Diciembre";
    }

    return estemes;
  }
}
