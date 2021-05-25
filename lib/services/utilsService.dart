import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UtilsService with ChangeNotifier, DiagnosticableTreeMixin {
  IconData _iconArrow = Icons.keyboard_arrow_up_rounded;
  IconData get iconArrow => _iconArrow;

  void slidingOpened(){
    _iconArrow = Icons.keyboard_arrow_down_rounded;
    notifyListeners();
  }
  void slidingClosed(){
    _iconArrow = Icons.keyboard_arrow_up_rounded;
    notifyListeners();
  }

  

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //properties.add(IntProperty('count', count));
  }
}