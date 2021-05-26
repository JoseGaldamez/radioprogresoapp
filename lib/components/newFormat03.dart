import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/models/news.dart';
import 'package:radioprogresoappoficial/pages/newDetails.dart';

class NewsFormat03 extends StatefulWidget {
  final NewsModel nota01;
  final NewsModel nota02;
  NewsFormat03(this.nota01, this.nota02, {Key key}) : super(key: key);

  @override
  _NewsFormat03State createState() => _NewsFormat03State();
}

class _NewsFormat03State extends State<NewsFormat03> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.50 - 20,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsDetails(widget.nota01)));
                },
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: CachedNetworkImage(
                        placeholder:  (context, url) => new Image.asset("img/loading.gif"),
                        imageUrl: widget.nota01.image),
                      ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        widget.nota01.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ))),
        Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.50 - 20,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsDetails(widget.nota02)));
                },
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: CachedNetworkImage(
                  placeholder:  (context, url) => new Image.asset("img/loading.gif"),
                  imageUrl: widget.nota02.image),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        widget.nota02.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )))
      ],
    );
  }
}
