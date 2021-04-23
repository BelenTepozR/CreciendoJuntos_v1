import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';//para poder utilizar las fuentes de google https://fonts.google.com/ tienen que agregar la dependencia en el archivo pubspec.yaml

class AcercaDe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final seccionApp = Container(
      //adding: EdgeInsets.only(top: 70,bottom: 0,right: 0,left: 10),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Acerca de',
            style: GoogleFonts.mukta(
              color: Colors.grey[600],
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    final tituloApp = Container(
     // padding: EdgeInsets.only(top: 20,bottom: 0,right: 0,left: 20),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('img/hoja.png',scale: 2.9),
          Text(
            'C r e c i e n d o   j u n t o s ',
            style: GoogleFonts.lato(
              color: Colors.grey[600],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    final informacion = Container(
      width: 390,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 15,bottom: 0,right: 10,left: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Creciendo Juntos es una aplicación que funciona como apoyo en la crianza de plantas, con el propósito de aumentar la probabilidad de vida de una planta.',
            style: GoogleFonts.abel(
              
              color: Colors.grey[500],
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    final desarrolladores = Container(
      width: 390,
      alignment: Alignment.center,
      //padding: EdgeInsets.only(top: 0,bottom: 0,right: 10,left: 15),
      child: Column(
        children: [
          Text(
            'Desarrolladores',
            style: GoogleFonts.abel(
              color: Colors.grey[500],
              fontSize: 25,
            ),
          ),
          Text(
            'García Cruz Ricardo Emmanuel',
            style: GoogleFonts.abel(
              color: Colors.grey[500],
              fontSize: 25,
            ),
          ),
          Text(
            'Ramos López Lizbeth',
            style: GoogleFonts.abel(
              color: Colors.grey[500],
              fontSize: 25,
            ),
          ),
          Text(
            'Tepoz Romero Belen',
            style: GoogleFonts.abel(
              color: Colors.grey[500],
              fontSize: 25,
            ),
          ),
        ],
      ),
    );

    final versionApp = Container(
      width: 390,
      alignment: Alignment.center,
     // padding: EdgeInsets.only(top: 0,bottom: 10,right: 10,left: 15),
      child: Column(
        children: [
          Text(
            'Version 1.0',
            style: GoogleFonts.abel(
              color: Colors.grey[500],
              fontSize: 25,
            ),
          ),
        ],
      ),
    );

    final contenedorFinal = Container(
      padding: EdgeInsets.only(top: 80,bottom: 50,right: 10,left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          seccionApp,
          tituloApp,
          informacion,
          desarrolladores,
          versionApp,
        ],
      ),
    );

    return MaterialApp(
        title: 'Pantallas ',
        home: Scaffold(
          body:  SingleChildScrollView(   
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Color.fromRGBO(199,218,196, 1)),//color de fondo
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: contenedorFinal
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}