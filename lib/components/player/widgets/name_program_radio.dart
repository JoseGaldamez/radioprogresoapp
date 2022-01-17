import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/radio_service.dart';

class NameOfProgramRadio extends StatelessWidget {
  const NameOfProgramRadio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25),
        child: Text(context.watch<RadioService>().currentProgram));
  }
}
