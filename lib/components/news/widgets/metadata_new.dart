import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/news/widgets/share_little_button.dart';

class MetaDataNew extends StatelessWidget {
  final String date;
  const MetaDataNew({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _formatDate(date),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: ShareLittleButton(),
          )
        ],
      ),
    );
  }

  String _formatDate(String date) {
    String _textdate = date.split("T")[0];
    List<String> _date = _textdate.split("-");
    _textdate = _date[2] + " de " + _month(_date[1]) + " de " + _date[0];
    return _textdate;
  }

  String _month(String month) {
    int _month = 0;
    try {
      _month = int.parse(month);

      switch (_month) {
        case 1:
          return "Enero";

        case 2:
          return "Febrero";

        case 3:
          return "Marzo";

        case 4:
          return "Abril";

        case 5:
          return "Mayo";

        case 6:
          return "Junio";

        case 7:
          return "Julio";

        case 8:
          return "Agosto";

        case 9:
          return "Septiembre";

        case 10:
          return "Octubre";

        case 11:
          return "Noviembre";

        case 12:
          return "Diciembre";
      }

      return "Error";
    } catch (e) {
      return "";
    }
  }
}
