import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/components/news/read_new.dart';
import 'package:radioprogresoappoficial/components/news/widgets/video_on_live.dart';
import 'package:radioprogresoappoficial/services/firestore_service.dart';

class PrincipalNew extends StatelessWidget {
  const PrincipalNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.watch<FirestoreService>().audiovisuales.live == ""
            ? Container()
            : VideoOnLive(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReadNew(
                        noticia:
                            context.watch<FirestoreService>().newsList[0])));
          },
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _imageNew(context),
                _titleNew(context),
                _descriptionNew(context)
              ],
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReadNew(
                          noticia: context.watch<FirestoreService>().np)));
            },
            child: Image.asset("img/np.png"))
      ],
    );
  }

  Container _descriptionNew(BuildContext context) {
    String _description = context.watch<FirestoreService>().newsList[0].excerpt;

    _description = _description.split("<!--")[0];
    _description = _description.substring(3);

    return Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Text(
          _description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey),
        ));
  }

  Container _titleNew(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(
        context.watch<FirestoreService>().newsList[0].title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  ClipRRect _imageNew(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Hero(
        tag: context.watch<FirestoreService>().newsList[0].uid,
        child: CachedNetworkImage(
          placeholder: (_, url) => Container(
            child: Image.asset("img/placeholder.gif"),
          ),
          imageUrl: context.watch<FirestoreService>().newsList[0].image,
        ),
      ),
    );
  }
}
