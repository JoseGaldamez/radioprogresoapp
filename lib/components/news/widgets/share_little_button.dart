import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareLittleButton extends StatelessWidget {
  final String urlShared;
  const ShareLittleButton({Key? key, required this.urlShared})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Share.share('Esta noticia podría interesarte: ' + urlShared,
            subject: 'Mira esta nota');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.share_rounded,
              size: 20,
            ),
            Text("Compartir")
          ],
        ),
      ),
    );
  }
}
