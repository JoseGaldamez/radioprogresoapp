import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/options/widgets/about_app.dart';
import 'package:radioprogresoappoficial/components/options/widgets/mision_vision.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3))
      ], borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Acerca de nosotros",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[600]),
              )),
          const Divider(),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MisionVision()));
                },
                title: const Text(
                  "Misión y visión",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutApp()));
                },
                title: const Text("Sobre la aplicación",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
