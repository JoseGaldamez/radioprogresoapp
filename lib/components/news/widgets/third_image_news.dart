import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';

class ThirdImageNews extends StatelessWidget {
  const ThirdImageNews({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: Container(
          width: double.infinity,
          height: 100,
          child: Hero(
            tag: context.watch<FirestoreService>().newsList[index].uid,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (_, link) => Container(
                child: Image.asset("img/placeholder.gif"),
              ),
              imageUrl: context.watch<FirestoreService>().newsList[index].image,
            ),
          ),
        ),
      ),
    );
  }
}
