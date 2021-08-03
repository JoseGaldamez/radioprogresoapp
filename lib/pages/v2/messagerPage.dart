import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/services/dataNP.dart';
// import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';



class MessagesPage extends StatefulWidget {
  MessagesPage({Key key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  TextEditingController nameController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  String errorName = "";
  String errorText = "";


  void sendMessage(){
    if (nameController.text.isNotEmpty) {
        if (messageController.text.isNotEmpty) {
          context.read<MessagesService>().sendMessageToDashboard(nameController.text, messageController.text);
          showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("El mensaje ya fue enviado", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Icon(Icons.check_circle, color: Colors.green, size: 80,),
                              TextButton(onPressed: (){
                                
                                while ( Navigator.canPop(context) ) {
                                  Navigator.pop(context);
                                }
                              }, child: Text("Muy bien"))
                            ],
                          ),
                        ),
                      );
                    });
        } else {
          setState(() {
            errorText = "* No olvide escribir su mensaje";            
          });
        }
    } else {
      setState(() {
        errorName = "* El nombre es requerido";
      });
    }
  }

  void clearError(){
    if (errorName != "" || errorText != "") {  
      setState(() {
            errorName = "";
            errorText = "";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Text("Escríbanos un mensaje directo.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            TextField(
              onChanged: (value) {
                clearError();
              },
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Su nombre',
                border: InputBorder.none,
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Text(errorName, style: TextStyle(color: Colors.red[300]),),
            ),
            SizedBox(height: 10,),
            TextField(
              onChanged: (value) {
                clearError();
              },
              controller: messageController,
              minLines: 5,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Escriba su mensaje',
                border: InputBorder.none,
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Text(errorText, style: TextStyle(color: Colors.red[300]),),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: sendMessage, child: Text("Enviar mensaje"))
          ],
        ),
      ),
    );
  }
}