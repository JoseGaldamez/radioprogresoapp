import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:radioprogresoappoficial/components/news/widgets/metadata_new.dart';
import 'package:radioprogresoappoficial/components/news/widgets/see_on_browser.dart';
import 'package:radioprogresoappoficial/components/news/widgets/share_big_button.dart';
import 'package:radioprogresoappoficial/models/newsModels.dart';

class ReadNew extends StatelessWidget {
  final NewsModel noticia;

  const ReadNew({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            noticia.category == 10
                ? const SizedBox(
                    height: 30,
                  )
                : _imageReadNew(),
            _titleReadNew(),
            MetaDataNew(
              date: noticia.date.toIso8601String(),
              urlShared: noticia.urlShare,
            ),
            const Divider(),
            _contentHTML(context),
            SeeOnBrowser(urlShared: noticia.urlShare),
            ShareBigButton(
              urlShared: noticia.urlShare,
            )
          ],
        ),
      ),
    );
  }

  Html _contentHTML(BuildContext context) {
    final String _initialtag = noticia.content.substring(0, 8);
    String _text = "";

    if (_initialtag.contains("<figure")) {
      List<String> _textsplited = noticia.content.split("/figure>");

      for (var i = 1; i < _textsplited.length; i++) {
        _text += _textsplited[i] + "/figure>";
      }
    } else {
      _text = noticia.content;
    }

    final text = _text.split('<div class="pvc_clear"')[0];
    return Html(
      data: text,
      style: _stylesReadNew(context),
    );
  }

  Map<String, Style> _stylesReadNew(BuildContext context) {
    return {
      "h1": Style(textAlign: TextAlign.center),
      "h2": Style(textAlign: TextAlign.center),
      "figcaption": Style(
          fontSize: FontSize.smaller,
          color: Colors.grey,
          textAlign: TextAlign.center),
      "figure": Style(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width,
          display: Display.BLOCK),
      "img": Style(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width,
          display: Display.BLOCK),
      "i": Style(display: Display.NONE),
      "p": Style(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          fontSize: FontSize.rem(1.2),
          textAlign: TextAlign.justify),
      // tables will have the below background color
      "table": Style(
        backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
      ),
      // some other granular customizations are also possible
      "tr": Style(
        border: const Border(bottom: BorderSide(color: Colors.grey)),
      ),
      "th": Style(
        padding: const EdgeInsets.all(6),
        backgroundColor: Colors.grey,
      ),
      "td": Style(
        padding: const EdgeInsets.all(6),
        alignment: Alignment.topLeft,
      ),
      // text that renders h1 elements will be red
    };
  }

  Container _titleReadNew() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        noticia.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  Hero _imageReadNew() {
    return Hero(
        tag: noticia.uid,
        child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: noticia.image));
  }
}
