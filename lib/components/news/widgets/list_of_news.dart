import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/components/news/widgets/principal_new.dart';
import 'package:radioprogresoappoficial/components/news/widgets/secondary_news.dart';
import 'package:radioprogresoappoficial/components/news/widgets/thirdNews.dart';
import 'package:radioprogresoappoficial/components/news/widgets/video_of_the_week.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';

class ListOfNews extends StatelessWidget {
  const ListOfNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _getNewsAgain(context);
      },
      child: ListView(
        children: List.generate(
            context.watch<FirestoreService>().newsList.length, (index) {
          return _showSelectedNew(index);
        }),
      ),
    );
  }

  Future<void> _getNewsAgain(BuildContext context) async {
    context.read<FirestoreService>().getNewsList();
    context.read<FirestoreService>().getVideos();
  }

  Widget _showSelectedNew(int index) {
    switch (index) {
      case 0:
        return PrincipalNew();

      case 1:
        return SecondaryNews(index: index);

      case 2:
        return Column(
          children: [SecondaryNews(index: index), VideoOfTheWeek()],
        );

      case 3:
        return SecondaryNews(index: index);

      case 4:
        return SecondaryNews(index: index);

      case 5:
        return SecondaryNews(index: index);

      case 6:
        return ThirdNews(
          index: index,
        );

      case 8:
        return ThirdNews(
          index: index,
        );

      case 10:
        return ThirdNews(
          index: index,
        );

      default:
        return Container();
    }
  }
}
