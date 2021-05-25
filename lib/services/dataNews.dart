//import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/models/news.dart';

//import 'package:http/http.dart' as http;

class DataNewsPost with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  List<NewsModel> _listsNews = [];

  int get count => _count;
  List<NewsModel> get listNews => _listsNews;

  void getNews() async {
    Query query =
        FirebaseFirestore.instance.collection('posts');

    await query.get().then((posts) => {
      posts.docs.forEach((post) {
        _listsNews.add(
          NewsModel(post.data()["title"], post.data()["image"], post.data()["date"], post.data()["content"], post.data()["urlShare"], post.data()["excerpt"])
        );
      })
    });

    notifyListeners();

    print(_listsNews);
    
  }




  /* void getNews() async {
    Uri url = Uri.parse("https://www.radioprogresohn.net/wp-json/wp/v2/posts?_embed&categories=71");
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      var jsonRespuesta = jsonDecode(respuesta.body);

      for (var i = 0; i < 10; i++) {
        _listsNews.add(NewsModel(
            jsonRespuesta[i]["title"]["rendered"],
            jsonRespuesta[i]["_embedded"]["wp:featuredmedia"][0]["source_url"],
            jsonRespuesta[i]["date"],
            jsonRespuesta[i]["content"]["rendered"],
            jsonRespuesta[i]["link"].toString(),
            jsonRespuesta[i]["excerpt"]["rendered"]));
      }
    } 

    notifyListeners();
  }
  */

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(IntProperty('count', count));
  }
}
