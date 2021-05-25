import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/v2/reproductor.dart';
import 'package:radioprogresoappoficial/pages/listNews.dart';
//import 'package:radioprogresoappoficial/services/dataNews.dart';
import 'package:radioprogresoappoficial/services/utilsService.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PanelController _pc1 = new PanelController();

  @override
  void initState() { 
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        child: Image.asset("img/logo_principal.png")) ),
      body: SlidingUpPanel(
        controller: _pc1,
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        minHeight: 80.0,
        onPanelOpened: (){
          context.read<UtilsService>().slidingOpened();
        },
        onPanelClosed: (){
          context.read<UtilsService>().slidingClosed();
        },
      panel: SafeArea(child: Column(
        children: [
          Container( padding: EdgeInsets.only(top: 5), child: GestureDetector(
            onTap: (){
              if(_pc1.isPanelOpen){
                _pc1.close();
              } else {
                _pc1.open();
              }
            },
            child: Icon( context.watch<UtilsService>().iconArrow, size: 35.0)),),
          ReproductorAudio(),
        ],
      )),
        body: ListNewsPage()
      ),
    );
  }
}