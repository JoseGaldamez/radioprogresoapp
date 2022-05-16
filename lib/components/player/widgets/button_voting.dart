import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/player/widgets/modal_voting.dart';

class ButtonVoting extends StatelessWidget {
  const ButtonVoting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () {
            voteProgram(context);
          },
          child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(15),
              child: Text(
                "Participar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ))),
    );
  }
}
