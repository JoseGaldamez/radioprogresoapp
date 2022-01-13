import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components.dart';
import 'package:radioprogresoappoficial/components/news/home_news_page.dart';
import 'package:radioprogresoappoficial/components/notinada/notinada_page.dart';
import 'package:radioprogresoappoficial/components/player/player.dart';
import 'package:radioprogresoappoficial/components/player/player_page.dart';

late AudioHandler _audioHandler;

Future<void> main() async {
  _audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );

  runApp(PrincipalPage());
}

class PrincipalPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  // List of pages in bottom nav
  List<Widget> _pages = [
    PlayerPage(audioHandler: _audioHandler),
    HomeListNews(),
    NotiNadaPage()
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Progreso HN',
      theme: ComponentPrincipalPage().appThemeData(),
      //home: MyHomePage(title: 'Radio Progreso HN'),
      home: Scaffold(
        body: SafeArea(
          child: _pages[index],
        ),
        bottomNavigationBar: _appBottomNavigation(),
      ),
    );
  }

  BottomNavigationBar _appBottomNavigation() {
    return BottomNavigationBar(
      onTap: _changePage,
      currentIndex: index,
      items: ComponentPrincipalPage().listBottomNavigationOptions,
    );
  }

  void _changePage(i) {
    setState(() {
      index = i;
    });
  }
}
