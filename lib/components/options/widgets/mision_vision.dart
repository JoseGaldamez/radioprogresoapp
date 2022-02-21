import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MisionVision extends StatelessWidget {
  const MisionVision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logoMisionVision(context),
            _titleMision("Mision"),
            _contentMision(
                "Un equipo diverso de mujeres y hombres que trabaja por la construcción de una sociedad justa, equitativa y soberana, a través de la reflexión, investigación y comunicación, inspirados en los valores del reino de Dios y la espiritualidad ignaciana, en alianza y articulación con sectores y personas que reivindican la dignidad, y en cercanía permanente con poblaciones empobrecidas y vulnerabilizadas."),
            _titleMision("Vision"),
            _contentMision(
                "Desde nuestra identidad de fe y justicia, y desde la fuerza creadora de la Comunidad Organizada en Movimiento, soñamos con una Honduras ejerciendo soberanía, desde un poder colectivo que logra transformaciones humanas y institucionales que conducen a relaciones de horizontalidad y de respeto a los derechos humanos, territorios y bienes naturales."),
            _moreInfo(context),
            _goBack(context),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Container _goBack(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Volver",
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  Container _moreInfo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green[600]),
        onPressed: () async {
          if (!await launch("https://radioprogresohn.net/quienes-somos/")) {
            throw 'Could not launch "https://radioprogresohn.net/quienes-somos/"';
          }
        },
        child: Container(
            padding: const EdgeInsets.all(20), child: const Text("Saber mas")),
      ),
    );
  }

  Container _logoMisionVision(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Image.asset("img/logorp.png"),
    );
  }

  Container _contentMision(String text) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Container _titleMision(String title) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
