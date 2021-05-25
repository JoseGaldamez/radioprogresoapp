import 'package:audio_service/audio_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/pages/v2/home-page.dart';
import 'package:radioprogresoappoficial/services/dataNP.dart';
import 'package:radioprogresoappoficial/services/dataNews.dart';
import 'package:radioprogresoappoficial/services/dataNotiNada.dart';
import 'package:radioprogresoappoficial/services/utilsService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataNewsPost()),
        ChangeNotifierProvider(create: (_) => DataNuestraPalabra()),
        ChangeNotifierProvider(create: (_) => DataNotiNada()),
        ChangeNotifierProvider(create: (_) => UtilsService()),
      ],
      child: MyApp(),
    ))
  });
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
      home: AudioServiceWidget(child: HomePage()),
    );
  }
}
