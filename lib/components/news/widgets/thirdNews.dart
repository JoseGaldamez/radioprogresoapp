import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/news/widgets/content_third_news.dart';
import 'package:radioprogresoappoficial/components/news/widgets/third_image_news.dart';

class ThirdNews extends StatelessWidget {
  final int index;
  const ThirdNews({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.44,
            margin: EdgeInsets.only(
                top: 20, right: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThirdImageNews(index: index),
                ContentThirdNews(
                  index: index,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.44,
            margin: EdgeInsets.only(
                top: 20, left: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThirdImageNews(index: index + 1),
                ContentThirdNews(
                  index: index + 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
