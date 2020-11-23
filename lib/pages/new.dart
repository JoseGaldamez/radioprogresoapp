import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NoticiaPage extends StatefulWidget {
  final String url;
  NoticiaPage({Key key, this.url}) : super(key: key);

  @override
  _NoticiaPageState createState() => _NoticiaPageState();
}

class _NoticiaPageState extends State<NoticiaPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Radio Progreso")),
      body: WebView(
        initialUrl: this.widget.url,
      ),
    );
  }
}
