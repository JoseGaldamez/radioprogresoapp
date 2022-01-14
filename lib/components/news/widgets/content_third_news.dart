import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';

class ContentThirdNews extends StatelessWidget {
  final int index;
  const ContentThirdNews({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            Text(
              context.watch<FirestoreService>().newsList[index].title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
