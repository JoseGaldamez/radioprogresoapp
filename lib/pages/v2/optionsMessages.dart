import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/pages/v2/messagerPage.dart';
import 'package:url_launcher/url_launcher.dart';

class OptionsMessages extends StatelessWidget {
  const OptionsMessages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _messageToWhatsapp() async {
        await canLaunch("https://wa.me/+50433917322/?text=Hola%20Radio%20Progreso") ? await launch("https://wa.me/+50433917322/?text=Hola%20Radio%20Progreso") : throw 'Could not launch call';
    }

    void _messageToEmail() async {
        await canLaunch("mailto:cabina@radioprogreso.net?subject=Correo desde la App Oficial") ? await launch("mailto:cabina@radioprogreso.net?subject=Correo desde la App Oficial") : throw 'Could not launch call';
    }


    return Scaffold(body: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _messageToWhatsapp,
            child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(18, 140, 126, 1)),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("img/whatsapp.png", width: 25, height: 25, fit: BoxFit.cover,),
                SizedBox(width: 10,),
                Text("Whatsapp", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(18, 140, 126, 1) ),)
              ],
            ),
          ),),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: _messageToEmail,
            child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 67, 53, 1)),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("img/whatsapp.png", width: 30, height: 30, fit: BoxFit.cover,),
                Icon(Icons.alternate_email, color: Color.fromRGBO(234, 67, 53, 1),  ),
                SizedBox(width: 10,),
                Text("Correo Electrónico", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(234, 67, 53, 1) ),)
              ],
            ),
          ),),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesPage()));
            },
            child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("img/whatsapp.png", width: 30, height: 30, fit: BoxFit.cover,),
                Icon(Icons.message_outlined, color: Colors.blueGrey,  ),
                SizedBox(width: 10,),
                Text("Mensaje directo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey ),)
              ],
            ),
          ),),
          
        ],
      ),
    ),);
  }
}