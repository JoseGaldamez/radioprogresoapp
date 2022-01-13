import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';

class PrincipalNew extends StatelessWidget {
  const PrincipalNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Principal new");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _imageNew(context),
            _titleNew(context),
            Container(
                child: Text(
              context.watch<FirestoreService>().newsList[0].excerpt,
            ))
          ],
        ),
      ),
    );
  }

  Container _titleNew(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(
        context.watch<FirestoreService>().newsList[0].title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
      ),
    );
  }

  ClipRRect _imageNew(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        placeholder: (_, url) => Container(
          child: Image.asset("img/placeholder.gif"),
        ),
        imageUrl: context.watch<FirestoreService>().newsList[0].image,
      ),
    );
  }
}
