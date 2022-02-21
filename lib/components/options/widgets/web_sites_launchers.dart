import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebSitesLaunchers extends StatelessWidget {
  const WebSitesLaunchers({Key? key}) : super(key: key);

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
                "Sitios web",
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
                  if (!await launch("https://www.radioprogresohn.net")) {
                    throw 'Could not launch "https://www.radioprogresohn.net"';
                  }
                },
                enableFeedback: true,
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset("img/logorp.png"),
                ),
                subtitle: const Text("https://www.radioprogresohn.net"),
                title: const Text(
                  "Radio Progreso",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.open_in_new_rounded, size: 20),
              ),
              ListTile(
                onTap: () async {
                  if (!await launch("https://www.eric-sj.org")) {
                    throw 'Could not launch https://www.eric-sj.org';
                  }
                },
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset("img/eric.png"),
                ),
                subtitle: const Text("https://www.eric-sj.org"),
                title: const Text("ERIC sj",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.open_in_new_rounded, size: 20),
              ),
              ListTile(
                onTap: () async {
                  if (!await launch("https://notinada.radioprogresohn.net")) {
                    throw 'Could not launch https://notinada.radioprogresohn.net';
                  }
                },
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset("img/notinada.png"),
                ),
                subtitle: const Text("https://notinada.radioprogresohn.net"),
                title: const Text("NotiNada",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(
                  Icons.open_in_new_rounded,
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
