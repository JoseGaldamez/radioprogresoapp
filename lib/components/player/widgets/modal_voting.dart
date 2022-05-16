import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';
import 'package:radioprogresoappoficial/services/radio_service.dart';

void voteProgram(BuildContext context) {
  int value = 5;
  TextEditingController name = TextEditingController(text: '');
  TextEditingController message = TextEditingController(text: '');

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text(
            "Tu participación es importante",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.42,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10),
                  Container(
                    child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          labelText: "Nombre",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        )),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: TextFormField(
                        controller: message,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: "Un mensaje",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        )),
                  ),
                  SizedBox(height: 20),
                  Text("¿Cuánto te gusta el programa actual?"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            value = 1;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            value = 2;
                          });
                        },
                        child: Icon(
                          value >= 2 ? Icons.star : Icons.star_border,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            value = 3;
                          });
                        },
                        child: Icon(
                          value >= 3 ? Icons.star : Icons.star_border,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            value = 4;
                          });
                        },
                        child: Icon(
                          value >= 4 ? Icons.star : Icons.star_border,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            value = 5;
                          });
                        },
                        child: Icon(
                          value >= 5 ? Icons.star : Icons.star_border,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          onPressed: () {
                            sendMessage(
                                context, name.text, message.text, value);
                          },
                          child: Text("Enviar"))),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}

void sendMessage(
    BuildContext context, String name, String message, int voting) {
  context.read<FirestoreService>().sendMessage(
      name, message, voting, context.read<RadioService>().currentProgramID);
  Navigator.pop(context);

  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Gracias por tu participación"),
            content: Image.asset(
              "img/animation/enviado.gif",
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                    SizedBox(width: 10),
                    Text("Ok"),
                  ],
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ));
}
