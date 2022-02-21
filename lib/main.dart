import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/components/options/options_page.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';
import 'package:radioprogresoappoficial/services/radio_service.dart';
import 'firebase_options.dart';

// Components
import 'package:radioprogresoappoficial/components.dart';
import 'package:radioprogresoappoficial/components/news/home_news_page.dart';
import 'package:radioprogresoappoficial/components/player/player.dart';
import 'package:radioprogresoappoficial/components/player/player_page.dart';

late AudioHandler _audioHandler;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Firebase service
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Init audio service
  _audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.pink, // status bar color
  ));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirestoreService()),
        ChangeNotifierProvider(create: (_) => RadioService()),
      ],
      child: PrincipalPage(),
    ),
  );
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
    OptionsPage()
  ];

  int index = 1;

  @override
  void initState() {
    super.initState();
    context.read<FirestoreService>().getNewsList();
    context.read<FirestoreService>().getVideos();
    context.read<RadioService>().watchProgram();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Progreso HN',
      theme: ComponentPrincipalPage().appThemeData(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.grey[50],
        ),
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
