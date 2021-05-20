import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/pages/home.dart';
import 'package:radioprogresoappoficial/services/dataNP.dart';
import 'package:radioprogresoappoficial/services/dataNews.dart';
import 'package:radioprogresoappoficial/services/dataNotiNada.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataNewsPost()),
      ChangeNotifierProvider(create: (_) => DataNuestraPalabra()),
      ChangeNotifierProvider(create: (_) => DataNotiNada()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Progreso HN',
      color: Colors.white,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Radio Progreso HN'),
      home: HomePage(),
    );
  }
}
