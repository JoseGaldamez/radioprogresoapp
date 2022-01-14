import 'package:flutter/material.dart';

//Firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:radioprogresoappoficial/models/audiovisualesModel.dart';
import 'package:radioprogresoappoficial/models/newsModels.dart';

class FirestoreService with ChangeNotifier {
  // Intances
  final _firestore = FirebaseFirestore.instance;

  // Items to share to pages
  List<NewsModel> _newsList = [];
  List<NewsModel> get newsList => _newsList;

  // Videos to show
  Audiovisuales _audiovisuales =
      Audiovisuales(live: "", semanal: "", notinada: "");
  Audiovisuales get audiovisuales => _audiovisuales;

  // Get news from Firebase
  Future<void> getNewsList() async {
    final _query = await _firestore.collection("posts").get();

    if (_query.docs.isEmpty) {
      _newsList = [];
      notifyListeners();
      return;
    } else {
      _newsList = [];
      _query.docs.forEach((post) {
        if (post.data()["category"] == 71) {
          _newsList.add(NewsModel.fromMap(post.data()));
        }
      });

      notifyListeners();
    }
  }

  Future<void> getVideos() async {
    final _query =
        await _firestore.collection("audiovisuales").doc("videos").get();
    if (_query.exists) {
      _audiovisuales = Audiovisuales.fromMap(_query.data()!);
    }
  }
}
