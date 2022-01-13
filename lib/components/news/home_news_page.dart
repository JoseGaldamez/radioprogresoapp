import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/components/news/widgets/list_of_news.dart';
import 'package:radioprogresoappoficial/components/news/widgets/principal_header.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';

class HomeListNews extends StatefulWidget {
  const HomeListNews({Key? key}) : super(key: key);

  @override
  State<HomeListNews> createState() => _HomeListNewsState();
}

class _HomeListNewsState extends State<HomeListNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: PrincipalHeader()),
        Expanded(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: context.watch<FirestoreService>().newsList.length != 0
              ? ListOfNews()
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ))
      ],
    );
  }
}
