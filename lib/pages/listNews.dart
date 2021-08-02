import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/components/newFormat.dart';
import 'package:radioprogresoappoficial/components/newFormat02.dart';
import 'package:radioprogresoappoficial/components/newFormat03.dart';
import 'package:radioprogresoappoficial/components/v2/swiperPublicidad.dart';
import 'package:radioprogresoappoficial/components/v2/videoReproductor.dart';
//import 'package:radioprogresoappoficial/components/notinadaVideo.dart';
//import 'package:radioprogresoappoficial/components/nuestra_palabra.dart';
//import 'package:radioprogresoappoficial/services/dataNP.dart';
import 'package:radioprogresoappoficial/services/dataNews.dart';
import 'package:radioprogresoappoficial/services/dataNotiNada.dart';
//import 'package:radioprogresoappoficial/services/dataNotiNada.dart';

class ListNewsPage extends StatefulWidget {
  ListNewsPage({Key key}) : super(key: key);

  @override
  _ListNewsPageState createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  bool loading = true;


  @override
  void initState() {
    super.initState();
    _getNews();
    _getBanners();
    _getNotiNada();
  }

  Future<void> _getNews() async {
    context.read<DataNewsPost>().getNews();
  }

  Future<void> _getBanners() async {
    context.read<DataNewsPost>().getSwiper();
  }

  Future<void> _getNotiNada() async {
    context.read< DataNotiNada>().getVideoNotiNadaFromFirebase();
  }

  Future<void> _getNewData() async {
    _getNews();
    _getNotiNada();
    _getBanners();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loading
            ? context.watch<DataNewsPost>().listNews.length == 0
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                  )
                : Expanded(
                      child: RefreshIndicator(
                        onRefresh: _getNewData,
                        child:ListView.builder(
                          itemCount:
                              context.watch<DataNewsPost>().listNews.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Column(
                                children: [
                                  NewFormat(context
                                      .watch<DataNewsPost>()
                                      .listNews[index]),
                                  /* NuestraPalabra(
                                      context.watch<DataNuestraPalabra>().datanp) */
                                  Container(
                                    child: context.watch<DataNewsPost>().listSwiper.length == 0 ? Container() : PublicidadSwiper( context.watch<DataNewsPost>().listSwiper ),
                                  )
                                ],
                              );
                            }

                            if (index == 1) {
                              return Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 25),
                                    width: MediaQuery.of(context).size.width,
                                    child: NewsFormat03(
                                        context.watch<DataNewsPost>().listNews[index],
                                        context
                                            .watch<DataNewsPost>()
                                            .listNews[index + 1]),
                                  ),
                                ],
                              );
                            }

                            if (index == 2) {
                              return Container(
                              );
                            }

                            if (index == 3) {
                              return Container(
                                padding: EdgeInsets.only(bottom: 25),
                                width: MediaQuery.of(context).size.width,
                                child: NewsFormat03(
                                    context.watch<DataNewsPost>().listNews[index],
                                    context
                                        .watch<DataNewsPost>()
                                        .listNews[index + 1]),
                              );
                            }
                            if (index == 5) {
                              return Container(
                                padding: EdgeInsets.only(bottom: 25),
                                width: MediaQuery.of(context).size.width,
                                child: NewsFormat03(
                                    context.watch<DataNewsPost>().listNews[index],
                                    context
                                        .watch<DataNewsPost>()
                                        .listNews[index + 1]),
                              );
                            }

                            if (index == 4) {
                              return Container();
                            }
/* 
                            if (index == 6) {
                              return NotiNadaVideo(
                                  context.watch<DataNotiNada>().datann.url);
                            } */

                            if (index == 6) {
                              return Container(
                                child: VideoReproductor( context.watch<DataNotiNada>().urlVideoSemana ),
                              );
                            }

                            if (index < context.watch<DataNewsPost>().listNews.length - 1) { 
                            return NewFormat02(
                                context.watch<DataNewsPost>().listNews[index]);
                            } else if (index > 10) {
                              return Container(child: Padding( padding: EdgeInsets.only(bottom: 200 ), child: VideoReproductor( context.watch<DataNotiNada>().urlVideoNotiNada )));
                            }
                             
                            return SizedBox(height: 200.0,);
                            
                          }),
                    ),
                )
            : Text("No se encontraron noticias"),
      ],
    );
  }
}
