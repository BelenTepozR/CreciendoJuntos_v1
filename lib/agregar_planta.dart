import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantalla_principal/informacion.dart';
/*Color.fromRGBO(214,247,240, 1)*/

class AgregarPlanta extends StatelessWidget {
@override
  Widget build(BuildContext context) {

    final tituloApp = Container(
      padding: EdgeInsets.only(top: 120,bottom: 55,right: 0,left: 30),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                Text(
                  'C r e c i e n d o    j u n t o s ',
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
   
    final titulo =  Container(
      width: 375,
      padding: EdgeInsets.only(top: 0,bottom: 20,right: 9,left: 10),
      margin: EdgeInsets.only(top: 0,bottom: 0,right: 0,left: 0),
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.grey[500]),
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(100.0),
          ),          
          labelText: '   Ingrese el Nombre de la Planta',
          labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey[350],
          ),
          fillColor: Colors.white, 
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12.0),
            child:  IconButton(
                icon:  Icon(Icons.search,size: 45, color: Colors.grey[300],),
                tooltip: 'Buscar  Planta',
                onPressed: () {print('Buscar');}
              ),
          )                  
        ),
        autofocus: false,
      )
    );
     
   Widget cajasText(int indexCaja) => GestureDetector(
      child:
      TextField(      
              enabled: false, 
              style: TextStyle(color: Colors.grey[500]),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  border:  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.circular(100.0),
                ),          
                labelText: '   Opcion $indexCaja',
                labelStyle: TextStyle(              
                  fontSize: 21,
                  color: Colors.grey[350],
                ),
                fillColor: Colors.white, 
                filled: true,
                        
              ),
              autofocus: false,
      ),
      onTap: () {
        print("Opcion $indexCaja");
         Navigator.of(context).push(MaterialPageRoute<Null>( 
          builder: (BuildContext context){
            return new Informacion();
          })     
        ); 
      },

   );
    final texto = Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(60,132,120, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 370,
      height: 500,
      padding: EdgeInsets.only(top: 0,bottom: 0,right: 20,left: 20),
      margin: EdgeInsets.only(top: 30,bottom: 0,right: 20,left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        for(int i = 0; i < 6; i++) 
          cajasText(i+1)
         
        
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
      title: 'Agregar Planta',
      home: Scaffold(
          body: SingleChildScrollView(     
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color.fromRGBO(199,218,196, 1)),//color de fondo
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: contenedorFinal,
              ),
            ],
          ),
          ),
        ),
      ));
  }
}