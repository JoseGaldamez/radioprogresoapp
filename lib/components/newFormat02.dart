import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/models/news.dart';
import 'package:radioprogresoappoficial/pages/newDetails.dart';

class NewFormat02 extends StatefulWidget {
  final NewsModel nota;
  NewFormat02(this.nota, {Key key}) : super(key: key);

  @override
  _NewFormat02State createState() => _NewFormat02State();
}

class _NewFormat02State extends State<NewFormat02> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewsDetails(widget.nota)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              child: FadeInImage.assetNetwork(
                placeholder: "img/loading.gif",
                image: widget.nota.image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        widget.nota.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      widget.nota.descripcion
                              .replaceAll("<p>", "")
                              .substring(0, 100) +
                          "...",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
