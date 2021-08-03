
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessagesService with ChangeNotifier, DiagnosticableTreeMixin {
  
  void sendMessageToDashboard( String user, String text ) async {

    DateTime d = new DateTime.now();
    String id = '${d.millisecondsSinceEpoch }';

    
    await FirebaseFirestore.instance.collection('messages').doc(id).set({ 
      "user": user,
      "text": text,
      "viewed": false
     });

  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(IntProperty('count', count));
  }
}
