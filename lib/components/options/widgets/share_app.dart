import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
//import 'package:url_launcher/url_launcher.dart';

class ShareAppButton extends StatelessWidget {
  const ShareAppButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        const _share_text =
            'Hola, desde aquí puedes instalar la aplicación oficial de Radio Progreso HN.\n' +
                '\nAndroid: https://goo.su/android-rp' +
                '\n\niOS iPhone: https://goo.su/ios-rp';

        Share.share(_share_text, subject: 'App oficial de Radio Progreso');
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1)),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
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
              "Comparte esta app",
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
