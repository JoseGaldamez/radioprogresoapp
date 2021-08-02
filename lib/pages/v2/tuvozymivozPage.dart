import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class TuVozPage extends StatelessWidget {
  const TuVozPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
            child: ListView(
              children: [
                Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _backIconButton(context),
                    _titlePage(),
                    _texto01(),
                    _imageLogoTuVoz(context),
                    _texto02(),
                    _buttonActions(),
                    _moreInformation()
                  ],
                ),
          ),
              ],
            ),
        ),
    );
  }

  void _sendEmail() async {
      await canLaunch("mailto:tuvozymivoz@radioprogreso.net") ? await launch("mailto:tuvozymivoz@radioprogreso.net") : throw 'Could not launch Email';
  }
  void _sendWhatsapp() async {
      await canLaunch("https://api.whatsapp.com/send?phone=50433913564") ? await launch("https://api.whatsapp.com/send?phone=50433913564") : throw 'Could not launch Whatsapp';

  }
  void _callPhone() async {
      await canLaunch("tel:+50433913564") ? await launch("tel:+50433913564") : throw 'Could not launch call';
  }

  void _information() async {
      await canLaunch("https://radioprogresohn.net/tuvozymivoz/") ? await launch("https://radioprogresohn.net/tuvozymivoz/") : throw 'Could not launch Information';
  }

  Container _moreInformation() {
    return Container(
                padding: EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: _information,
                  child: Text("Más información", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: Colors.green),))
              );
  }

  Container _buttonActions() {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      child: OutlinedButton(onPressed: _sendEmail, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.alternate_email),
                          SizedBox(width: 10,),
                          Text("Correo Electrónico"),
                        ],
                      ),)
                    ),
                    Container(
                      child: OutlinedButton(onPressed: _sendWhatsapp, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.message),
                          SizedBox(width: 10,),
                          Text("Mensaje al Whatsapp"),
                        ],
                      ),)
                    ),
                    Container(
                      child: OutlinedButton(onPressed: _callPhone, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call),
                          SizedBox(width: 10,),
                          Text("Llamada telefónica"),
                        ],
                      ),)
                    ),
                  ],
                )
              );
  }

  Container _imageLogoTuVoz(BuildContext context) {
    return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset("img/tu-voz-y-mi-voz.png", fit: BoxFit.fitHeight,),);
  }

  Container _texto01() {
    return Container(
              padding: EdgeInsets.all(20),
              child: Text("Somo una red de amigos y amigas, que aportamos solidariamente al trabajo que desarrolla Radio Progreso, en pro de una sociedad más justa.", textAlign: TextAlign.justify, style: TextStyle(fontSize: 15),)
            );
  }
  Container _texto02() {
    return Container(
              padding: EdgeInsets.all(20),
              child: Text("Si deseas formar parte de Tu Voz y mi Voz, comunicate con nosotros para conocerte y darte la bienvenida.", textAlign: TextAlign.justify, style: TextStyle(fontSize: 15),)
            );
  }

  Container _titlePage() {
    return Container(
              padding: EdgeInsets.symmetric( horizontal: 20.0),
              child: Text("¿Desea ayudar a que Radio Progreso siga con su labor?", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold ), textAlign: TextAlign.center,),
            );
  }

  Container _backIconButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top:0),
            width: double.infinity,
            child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pop(context);
            },
          ),);
  }
}