import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';

class SecondaryNews extends StatelessWidget {
  final int index;
  const SecondaryNews({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Ver noticia");
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
        child: Row(
          children: [
            _imageSecondaryNews(context),
            _textContentNews(context),
          ],
        ),
      ),
    );
  }

  Container _textContentNews(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          Text(
            context.watch<FirestoreService>().newsList[index].title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _descriptionExcerpt(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }

  String _descriptionExcerpt(BuildContext context) {
    String _text = context.watch<FirestoreService>().newsList[index].excerpt;

    _text = _text.split("<!--")[0];
    _text = _text.substring(3);
    return _text;
  }

  ClipRRect _imageSecondaryNews(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.3,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          placeholder: (_, link) =>
              Container(child: Image.asset("img/placeholder.gif")),
          imageUrl: context.watch<FirestoreService>().newsList[index].image,
        ),
      ),
    );
  }
}
