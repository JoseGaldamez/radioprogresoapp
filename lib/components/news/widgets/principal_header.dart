import 'package:flutter/material.dart';

class PrincipalHeader extends StatelessWidget {
  const PrincipalHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width * 0.16,
              child: Image.asset("img/logorp.png")),
          Text(
            "RADIO PROGRESO",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
