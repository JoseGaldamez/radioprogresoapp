import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radioprogresoappoficial/components/BotonFlotante.dart';
import 'package:radioprogresoappoficial/pages/noticias.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Progreso HN',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Radio Progreso HN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Image.asset("img/logo_principal.png"),
            centerTitle: false,
            actions: [
              SizedBox(
                width: 35.0,
              ),
              IconButton(
                  icon: Icon(
                    Icons.info,
                    color: Colors.black26,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg:
                            "Aplicación creada por el equipo de Multimedia de Radio Progreso\nVersión 2.0.1",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 10,
                        backgroundColor: Colors.black87,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  })
            ],
          ),
          body: ListadoNoticias(),
          floatingActionButton: BotonFlotante()),
    );
  }
}
