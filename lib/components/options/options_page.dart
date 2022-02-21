import 'package:flutter/material.dart';
import 'package:radioprogresoappoficial/components/news/widgets/principal_header.dart';
import 'package:radioprogresoappoficial/components/options/widgets/about_us.dart';
import 'package:radioprogresoappoficial/components/options/widgets/administrative_contact.dart';
import 'package:radioprogresoappoficial/components/options/widgets/contact_options.dart';
import 'package:radioprogresoappoficial/components/options/widgets/web_sites_launchers.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PrincipalHeader(),
        Expanded(
            child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            WebSitesLaunchers(),
            ContactOptions(),
            AdministrativeContact(),
            AboutUs()
          ],
        ))
      ],
    );
  }
}
