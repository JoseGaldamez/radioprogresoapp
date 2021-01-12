import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:radioprogresoappoficial/models/notinada.dart';

class DataNotiNada with ChangeNotifier, DiagnosticableTreeMixin {
  NotiNada _datann;
  NotiNada get datann => _datann;

  void getNN() async {
    var respuesta = await http
        .get("https://radioprogreso-a03a6.firebaseapp.com/news/notinada.json");

    if (respuesta.statusCode == 200) {
      var jsonRespuesta = jsonDecode(respuesta.body);

      _datann =
          NotiNada(jsonRespuesta[0]["titulo"], jsonRespuesta[0]["urlvideo"]);
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
