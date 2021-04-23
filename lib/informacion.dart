import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Informacion extends StatelessWidget {
@override
  Widget build(BuildContext context) {

    final tituloApp = Container(
      padding: EdgeInsets.only(top: 120,bottom: 55,right: 0,left: 50),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                Text(
                  'C r e c i e n d o   j u n t o s ',
                  style: GoogleFonts.kronaOne(
                    color: Colors.grey[500],
                    fontSize: 18,
                  ),
                ),
              Image.asset('img/hoja.png',scale: 15), 
           ],
         ),
        ],
      ),
    );
   
    final titulo = Container(
      padding: EdgeInsets.only(top: 0,bottom: 40,right: 0,left: 40),
      child: Column(
       children: [
          Text(
            'Información ',
            style: GoogleFonts.goblinOne(
              color: Colors.grey[500],
              fontSize: 35,
            ),
          ),               
      ],
      ),
    );
    final texto = Container(
      width: 400,
      height: 600,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 0,bottom: 0,right: 10,left: 40),
      child: Column(
       children: [
          Text(
            'Datos interesantes sobre la planta, datos sooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooa ',
             style: GoogleFonts.abel(
              color: Colors.grey[500],
            
              fontSize: 25,
            ),
          ),               
      ],
      ),
    );


    final contenedorFinal = Container(
     // padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
          children: [
            tituloApp,titulo,texto
          ],
      ),
    );
    return MaterialApp(
        title: 'Informacion ',
       
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(199,218,196, 1)),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: contenedorFinal,
              ),
            ],
          ),
          ),
        ));
  }
}