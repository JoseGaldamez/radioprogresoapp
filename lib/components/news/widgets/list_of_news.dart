import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/components/news/widgets/principal_new.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';

class ListOfNews extends StatelessWidget {
  const ListOfNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(context.watch<FirestoreService>().newsList.length,
          (index) {
        return _showSelectedNew(index);
      }),
    );
  }

  Widget _showSelectedNew(int index) {
    switch (index) {
      case 0:
        return PrincipalNew();

      default:
        return Container(child: Text("Hola"));
    }
  }
}
