import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactOptions extends StatelessWidget {
  const ContactOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3))
      ], borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Contacto",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[600]),
              )),
          const Divider(),
          Column(
            children: [
              ListTile(
                onTap: () async {
                  if (!await launch(
                      "https://api.whatsapp.com/send?phone=50433913481&text=Hola%20Radio%20Progreso")) {
                    throw 'Could not launch Whatsapp';
                  }
                },
                title: const Text(
                  "Escríbenos al Whatsapp",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.message_rounded, size: 20),
              ),
              ListTile(
                onTap: () async {
                  if (!await launch("tel:+50426479433")) {
                    throw 'Could not launch Call';
                  }
                },
                title: const Text("Llamada telefónica",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(
                  Icons.call,
                  size: 20,
                ),
              ),
              ListTile(
                onTap: () async {
                  if (!await launch(
                      "mailto:multimedia@radioprogreso.net?subject=App:%20Hola%20amigos%20de%20Radio%20Progreso")) {
                    throw 'Could not launch Email';
                  }
                },
                title: const Text("Correo electrónico",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.email_rounded, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
