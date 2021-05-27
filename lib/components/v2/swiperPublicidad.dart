import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:radioprogresoappoficial/models/swiperImages.dart';
import 'package:url_launcher/url_launcher.dart';


class PublicidadSwiper extends StatelessWidget {
  final List<ImageSwiper> _listBanners;
  const PublicidadSwiper(this._listBanners, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, top: 20),
          width: double.infinity,
          decoration: BoxDecoration(
          ),
          child: Text("Publicidad:"),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 30),
          height: (MediaQuery.of(context).size.width * 9)/35,
          child: Swiper(
            autoplay: true,
            itemWidth: double.infinity,
            itemHeight: (MediaQuery.of(context).size.width * 9)/35,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  if (_listBanners[index].url == "") {
                    launchUrl(_listBanners[index].url);
                  }
                },
                  child: CachedNetworkImage(
                  imageUrl: _listBanners[index].image,
                  placeholder: (context, url) => new Image.asset("img/loading.gif"),
                ),
              );
            } ,
            itemCount: _listBanners.length),
        ),
      ],
    );
  }

  void launchUrl(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}