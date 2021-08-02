import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/textoInfo.dart';
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
  var currentProgram;
  String programName = "";
  String urlVideoNotiNada = "";

  @override
  void initState() { 
    super.initState();
    getCurrentProgram();
  }

  void getCurrentProgram() async {
    currentProgram = FirebaseFirestore.instance.collection("radio");
    currentProgram.snapshots().listen((program) { 
      setState(() {
         this.programName = program.docs[0].data()["name"];
         print(this.programName);
      });
     });
  }


  void getVideoNotiNadaFromFirebase() async {

    Query query = FirebaseFirestore.instance.collection('videos');
    await query.get().then((videos) => {
      videos.docs.forEach((video) {
        if (video.id == "NotiNada") {
          setState(() {          
            this.urlVideoNotiNada = video.data()['url'];
          });
        }
      })
    });
  
  }

  @override
  void dispose() {
    super.dispose();
    this.currentProgram.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.info, color: Colors.grey,), onPressed: (){
            showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(child: TextoInfoApp()),
                      );
                    });
          } )
        ],
        centerTitle: false,
        title: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        child: Image.asset("img/logo_principal.png")) ),
      body: SlidingUpPanel(
        controller: _pc1,
        maxHeight: MediaQuery.of(context).size.height * 0.75,
        minHeight: 110.0,
        onPanelOpened: (){
          context.read<UtilsService>().slidingOpened();
        },
        onPanelClosed: (){
          context.read<UtilsService>().slidingClosed();
        },
      panel: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container( padding: EdgeInsets.only(top: 5), child: GestureDetector(
            onTap: (){
              if(_pc1.isPanelOpen){
                _pc1.close();
              } else {
                _pc1.open();
              }
            },
            child: Column(
              children: [
                Icon( context.watch<UtilsService>().iconArrow, size: 35.0),
                Text("En vivo"),
                Text(this.programName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ],
            )),),
          
          ReproductorAudio(),
        ],
      )),
        body: ListNewsPage()
      ),
    );
  }
}