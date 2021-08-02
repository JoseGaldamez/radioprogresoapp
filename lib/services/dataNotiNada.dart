import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:radioprogresoappoficial/models/notinada.dart';

class DataNotiNada with ChangeNotifier, DiagnosticableTreeMixin {
  NotiNada _datann;
  NotiNada get datann => _datann;

  String urlVideoNotiNada = "";

  void getVideoNotiNadaFromFirebase() async {

    Query query = FirebaseFirestore.instance.collection('videos');
    await query.get().then((videos) => {
      videos.docs.forEach((video) {
        if (video.id == "NotiNada") {
          urlVideoNotiNada = video.data()['url'];
        }
      })
    });
    
    notifyListeners();
  }

  void getNN() async {
    Uri url = Uri.parse("https://radioprogreso-a03a6.firebaseapp.com/news/notinada.json");
    var respuesta = await http
        .get(url);

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
