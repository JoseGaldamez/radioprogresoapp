import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/models/news.dart';

import 'package:http/http.dart' as http;

class DataNewsPost with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  List<NewsModel> _listsNews = [];

  int get count => _count;
  List<NewsModel> get listNews => _listsNews;

  void getNews() async {
    var respuesta = await http.get(
        "https://www.radioprogresohn.net/wp-json/wp/v2/posts?_embed&categories=71");

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

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(IntProperty('count', count));
  }
}
