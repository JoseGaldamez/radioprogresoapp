import 'package:flutter/material.dart';

//Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

class RadioService with ChangeNotifier {
  // Intances
  final _firestore = FirebaseFirestore.instance;

  String _currentProgramID = '';
  String get currentProgramID => _currentProgramID;

  // Items to share to pages
  String _currentProgram = "";
  String get currentProgram => _currentProgram;

  bool _playing = false;
  bool get playing => _playing;

  var _watchCurrentProgram;

  // Get news from Firebase
  Future<void>? watchProgram() async {
    if (_watchCurrentProgram == null) {
      _watchCurrentProgram =
          _firestore.collection("radio").snapshots().listen((event) {
        _currentProgram = event.docs[0].data()["name"];
        _currentProgramID = event.docs[0].data()["idprogram"];
        notifyListeners();
      });
    }
  }

  void setPlaying(bool state) {
    _playing = state;
    notifyListeners();
  }
}
