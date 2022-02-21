import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  final TextStyle _titleStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _titleAboutApp(context),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.grey[200],
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  "Detalles de la aplicación",
                  style: _titleStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(text: "Esta es la aplicación oficial de "),
                      TextSpan(
                          text: "Radio Progreso HN ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "construida con cariño por el equipo institucional de "),
                      TextSpan(
                          text: "Multimedia.",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text:
                              "Las tecnología utilizadas para la elaboración de esta aplicación móvil son variadas, pero principalmente "),
                      TextSpan(
                          text: "Flutter ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "(tecnología desarrollada por Google) que es un Framework de código abierto muy seguro.")
                    ])),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Funcionalizades actuales",
                  style: _titleStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "1- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Noticias oficiales de Radio Progreso: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Con la aplicación puedes ver la noticias más importantes que son publicadas por el equipo de "),
                      TextSpan(
                          text: "Prensa ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " en la página de Radio Progreso (https://www.radioprogresohn.net/). La actualización de las noticias en la aplicación suceden unos minutos después de ser publicadas en la web. También hay que tener en cuenta que NO todas las noticias que estén en el sitio web se verán en la aplicación, solo aquellas que el editor considere.")
                    ])),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "2- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Radio En Vivo por Internet: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Mediante la aplicación puede escuchar la radio en vivo vía Streaming desde cualquier parte del mundo. Solo necesita una "),
                      TextSpan(
                          text: "conexión estable a Internet ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "para escuchar los programas en vivo de nuestra programación. También existe una programación en diferido después que cerramos programación en nuestras instalaciones (11:00 pm - Hora Honduras, Centroamérica), la programación consiste en la repetición del noticiero de ese día y el programa de análisis y debate "),
                      TextSpan(
                          text: "Más que dos.",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "3- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Vídeo de la semana: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "En la aplicación también podrá ver el vídeo que produce el equipo de "),
                      TextSpan(
                          text: "Multimedia ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " cada semana sobre temas de interés nacional. Este vídeo es traído mediante la API de Youtube y será actualizado cada semana, minutos después de ser subido a los servidores de YouTube al canal oficial de Radio Progreso "),
                      TextSpan(
                          text: "(Audiovisuales | Radio Progreso - ERIC sj).",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "4- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Nuestra Palabra: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Nuestra opición editarial, escrita cada día por el equipo institucional y representa la opinión y análisis de "),
                      TextSpan(
                          text: "Radio Progreso | ERIC sj. ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "En la aplicación, después de la noticias principal, podrá ver un banner donde podrá entrar a leer la columna editorial de ese día. Nuestra Palabra se actualiza todos los días (a menos que se apueste por aumentar el tiempo de cierta columna)."),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "5- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Contacto: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "En la sección de 'Opciones' podrá tener acceso a los sitios web oficiales de la institución, los números telefónicos de la cabina de la radio así como los contactos administrativos de Mercadeo. "),
                      TextSpan(
                          text: "Si desea contactar con nosotros ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "puede hacerlo sin problemas, siempre estamos felices de atender y considerar sus preguntas y sugerencias."),
                    ])),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Próximas funcionalidades",
                  style: _titleStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "1- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Vista del programa actual: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Podrás saber qué programa estas escuchando en vivo."),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "2- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Vídeos en vivo: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Ver en vivo las transmisiones que se hagan desde cabina."),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "3- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Vota por tus programas favoritos: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Podrás votar por tus programas favoritos de la radio, un botón de Me gusta se habilitará cuando haya un cambio de programa."),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: "4- ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Mensajes a cabina: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Podrás enviar saludos, solicitud de canciones o cualquir mensaje, estos mensajes tendrán prioridad."),
                    ])),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(height: 50),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          style: TextStyle(color: Colors.grey),
                          text: "Programador: "),
                      TextSpan(
                          text: "José Oveniel Galdámez Ramos.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                    ])),
                const SizedBox(height: 30),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Volver")),
          )
        ],
      ),
    );
  }

  Container _titleAboutApp(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Radio Progreso Oficial",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Center(
              child: Image.asset("img/logorp.png"),
            ),
          ),
        ],
      ),
    );
  }
}
