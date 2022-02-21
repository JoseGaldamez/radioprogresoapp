import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdministrativeContact extends StatelessWidget {
  const AdministrativeContact({Key? key}) : super(key: key);

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
                "Administrativo",
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
                      "https://api.whatsapp.com/send?phone=50431776477&text=Hola%20Mercadeo")) {
                    throw 'Could not launch Whatsapp';
                  }
                },
                title: const Text(
                  "Escribe a Mercadeo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.messenger_outlined, size: 20),
              ),
              ListTile(
                onTap: () async {
                  if (!await launch("tel:+50431776477")) {
                    throw 'Could not launch Whatsapp';
                  }
                },
                title: const Text("Llamada a Mercadeo",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(
                  Icons.call,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
