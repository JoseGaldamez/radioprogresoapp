import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareBigButton extends StatelessWidget {
  final String urlShared;
  const ShareBigButton({Key? key, required this.urlShared}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //print("Sharing new");
        Share.share('Esta noticia podría interesarte: ' + urlShared,
            subject: 'Mira esta nota');
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1)),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.share,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Compartir",
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
