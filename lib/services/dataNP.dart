import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/models/news.dart';

import 'package:http/http.dart' as http;

class DataNuestraPalabra with ChangeNotifier, DiagnosticableTreeMixin {
  NewsModel _datanp;

  NewsModel get datanp => _datanp;

  void getNP() async {
    var respuesta = await http.get(
        "https://www.radioprogresohn.net/wp-json/wp/v2/posts?_embed&categories=10&per_page=1");

    if (respuesta.statusCode == 200) {
      var jsonRespuesta = jsonDecode(respuesta.body);

      _datanp = NewsModel(
          jsonRespuesta[0]["title"]["rendered"],
          jsonRespuesta[0]["_embedded"]["wp:featuredmedia"][0]["source_url"],
          jsonRespuesta[0]["date"],
          jsonRespuesta[0]["content"]["rendered"],
          jsonRespuesta[0]["link"].toString(),
          jsonRespuesta[0]["excerpt"]["rendered"]);
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
