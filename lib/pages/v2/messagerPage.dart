import 'package:flutter/material.dart';
// import 'package:flutter_html/style.dart';


class MessagesPage extends StatefulWidget {
  MessagesPage({Key key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
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
              decoration: InputDecoration(
                hintText: 'Su nombre',
                border: InputBorder.none,
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              minLines: 5,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Escriba su mensaje',
                border: InputBorder.none,
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            ElevatedButton(onPressed: (){}, child: Text("Enviar mensaje"))
          ],
        ),
      ),
    );
  }
}