import 'package:flutter/material.dart';

class LikeButtonRadio extends StatelessWidget {
  const LikeButtonRadio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Enviar un Me gusta");
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 70, left: 20, right: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border),
            SizedBox(
              width: 10,
            ),
            Text("Me gusta")
          ],
        ),
      ),
    );
  }
}
