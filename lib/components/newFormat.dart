import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/nuestra_palabra.dart';
import 'package:radioprogresoappoficial/models/news.dart';
import 'package:radioprogresoappoficial/pages/newDetails.dart';

class NewFormat extends StatefulWidget {
  final NewsModel nota;
  NewFormat(this.nota, {Key key}) : super(key: key);

  @override
  _NewFormatState createState() => _NewFormatState();
}

class _NewFormatState extends State<NewFormat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetails(widget.nota)));
          },
          child: Container(
            child: Column(
              children: [
                FadeInImage.assetNetwork(
                    placeholder: "img/loading.gif", image: widget.nota.image),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nota.title,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        widget.nota.descripcion
                                .replaceAll("<p>", "")
                                .substring(1, 120) +
                            "...",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
