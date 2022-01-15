import 'package:flutter/material.dart';

class ShareLittleButton extends StatelessWidget {
  const ShareLittleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
