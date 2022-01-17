import 'package:flutter/material.dart';

class CurrentProgramImage extends StatelessWidget {
  const CurrentProgramImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Image.network(
          "https://radioprogresohn.net/wp-content/uploads/2019/07/NP-384x253.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
