import 'package:flutter/material.dart';

class ComponentPrincipalPage {
  // Theme of the app
  ThemeData appThemeData() {
    return ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedIconTheme: IconThemeData(size: 20),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          selectedItemColor: Colors.green[700],
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedIconTheme: IconThemeData(size: 30, color: Colors.green[700]),
        ));
  }

  // Bottom navigation nav options
  List<BottomNavigationBarItem> get listBottomNavigationOptions {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow_rounded), label: "En Vivo"),
      BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet_sharp), label: "Noticias"),
      BottomNavigationBarItem(
          icon: Icon(Icons.no_accounts), label: "Noti Nada"),
    ];
  }
}
