import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SeeOnBrowser extends StatelessWidget {
  final String urlShared;
  const SeeOnBrowser({Key? key, required this.urlShared}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await launch(urlShared)) {
          throw 'Could not launch $urlShared';
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1)),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.open_in_new_outlined,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Ver en el navegador",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
