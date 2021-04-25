import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipoSustrato extends StatelessWidget {
  final images = [
    {'image':'https://t4.ftcdn.net/jpg/00/89/81/51/240_F_89815181_0lQ4aGMP58YNmPxZzRHRo8byI4H5uIGk.jpg', 'title':'cantidad 1'},
    {'image':'https://t3.ftcdn.net/jpg/00/51/86/02/240_F_51860205_w5IAQtXt8qN9ULyZajr934n1c40nrFQd.jpg', 'title':'Turba 50%'},
    {'image':'https://cdn.pixabay.com/photo/2017/06/09/12/51/fresh-2386786__340.jpg', 'title':'cantidad 3'},
    {'image':'https://cdn.pixabay.com/photo/2020/05/24/15/20/coir-5214668__340.jpg', 'title':'cantidad 4'},
    {'image':'https://t4.ftcdn.net/jpg/03/34/16/31/240_F_334163165_TIGvqvVJwm7n87XWCJaYkL1RpZFsuqED.jpg', 'title':'cantidad 5'}
  ];
  @override
  Widget build(BuildContext context) {

    final tituloApp = Container(
      padding: EdgeInsets.only(top: 120,bottom: 40,right: 0,left: 40),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'C r e c i e n d o   j u n t o s ',
                style: GoogleFonts.kronaOne(
                  color: Colors.grey[600],
                  fontSize: 18,
                ),
              ),
              Image.asset('img/hoja.png',scale: 15),
            ],
          ),
        ],
      ),
    );

    final seccionApp = Container(
      padding: EdgeInsets.only(top: 10,bottom: 0,right: 0,left: 10),
      child: Column(
        children: <Widget>[
          Text(
            'Sustrato',
            style: GoogleFonts.mukta(
              color: Colors.grey[600],
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    Widget _imagenElemento(String imagenElement) => Container(
        width: 80,
        height: 80,
        margin: EdgeInsets.only(top: 10,bottom: 4,right: 20,left: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(40)),
          image: DecorationImage(
              image:  NetworkImage('$imagenElement'),
              fit: BoxFit.cover
          ),
        ),
    );

    Widget wSustrato(String imagen, String descripcion)=>Row(
      children: [
        _imagenElemento(imagen),
        Text(
          descripcion,
          style: GoogleFonts.abel(
            color: Colors.grey[500],
            fontSize: 25,
          ),
        ),
      ],
    );


    final sustrato = Container(
      width: 390,
      padding: EdgeInsets.only(top: 30,bottom: 0,right: 0,left: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(int i = 0; i < images.length; i++)
            wSustrato(images[i]['image'],images[i]['title'])
        ],
      ),
    );

    final contenedorFinal = Container(
      child: Column(
        children: [
          tituloApp,
          seccionApp,
          sustrato,
        ],
      ),
    );

    return MaterialApp(
        title: 'Sustrato ',
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(199,218,196, 1)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: contenedorFinal
                ),
              ],
            ),
          ),
        ));
  }
}