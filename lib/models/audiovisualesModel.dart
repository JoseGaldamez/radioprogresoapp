// To parse this JSON data, do
//
//     final audiovisuales = audiovisualesFromMap(jsonString);

import 'dart:convert';

class Audiovisuales {
  Audiovisuales({
    required this.live,
    required this.semanal,
    required this.notinada,
  });

  String live;
  String semanal;
  String notinada;

  factory Audiovisuales.fromJson(String str) =>
      Audiovisuales.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Audiovisuales.fromMap(Map<String, dynamic> json) => Audiovisuales(
        live: json["live"],
        semanal: json["semanal"],
        notinada: json["notinada"],
      );

  Map<String, dynamic> toMap() => {
        "live": live,
        "semanal": semanal,
        "notinada": notinada,
      };
}
