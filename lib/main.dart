
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';//para poder utilizar las fuentes de google https://fonts.google.com/ tienen que agregar la dependencia en el archivo pubspec.yaml
import 'package:pantalla_principal/acerca_de.dart';
import 'agregar_planta.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pantallas ',    
        home: PantallaInicio(),
      );
    
  }
}
class PantallaInicio extends StatefulWidget{
   @override
  PantallaInicioState createState() => PantallaInicioState();
}

class PantallaInicioState extends State<PantallaInicio>{
  tituloApp(BuildContext context) => Container(// en este contenedor esta lo que es el titulo y el icono
    margin: EdgeInsets.all(4),
      padding: EdgeInsets.only(top: 120,bottom: 55,right: 0,left: 20), //nos ayuda a situar nuestro contenedor
      child: Column(//el contenedor tien una columna como hijo, puede tener una row o un center o un padding 
        children: <Widget>[//y su hijo tiene una lista de Widget(que serian el texto y el icono)
          Row(//tenemos una fila para que se alinien el texto y el icono horizontalmente
            mainAxisSize: MainAxisSize.min,//para que la separacion entre el texto y el icono sea la menor posible, es decir que queren juntitos
            children: [
              IconButton(
                icon: Icon(Icons.info_outline,size: 30, color: Color.fromRGBO(60,132,120, 1)),
                tooltip: 'About of',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<Null>( 
                    builder: (BuildContext context){
                      return new AcercaDe();
                    })     
                  );     
                  print('Acerca de');}
              ),
             
              Text(
                'C r e c i e n d o   j u n t o s ',
                style: GoogleFonts.kronaOne(//tenemos acceso a todas las fuentes de google solo es colocar GoogleFonts.nombreFuente
                  color: Colors.grey[500],
                  fontSize: 18,
                ),
              ),
              Image.asset('img/hoja.png',scale: 15), //seleccionamos a imagen que esta en nuestra carpeta img(es necesario antes modificar el pubspec.yaml)
           ],
         ),
        ],
      ),
    );
   final titulo =  Container(
      width: 400,
      padding: EdgeInsets.only(top: 0,bottom: 40,right: 0,left: 20),
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.grey[500]),
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(100.0),
          ),          
          labelText: '   Buscar Nombre Planta',
          labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey[350],
          ),
          fillColor: Colors.white, 
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12.0),
            child: IconButton(
                icon: Icon(Icons.search,size: 45, color: Colors.grey[300]),
                tooltip: 'Buscar Planta',
                onPressed: () {
                  print('Buscar');
                }
              ),
            //,
          )                  
        ),
        autofocus: false,
      )
    );
Widget _buildDecoratedImage(String imageIndex) => GestureDetector(
  child:Container(
    width: 160,
    height: 160,
    margin: EdgeInsets.only(top: 10,bottom: 4,right: 4,left: 25),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(40)),
        image: DecorationImage(
        image:  NetworkImage('$imageIndex'),
        fit: BoxFit.cover
      ),
    ),
  ),
  onTap: () {print("Planta $imageIndex");},
);
Widget _buildDecoratedImageM(BuildContext context) => GestureDetector(
    child:Container(
    width: 160,
    height: 160,
    margin: EdgeInsets.only(top: 10,bottom: 4,right: 4,left: 25),
    decoration: BoxDecoration(
        color: Color.fromRGBO(60,132,120, 0.4),
        borderRadius: const BorderRadius.all(const Radius.circular(40)),
        image: DecorationImage(
        scale: 1.3,
        image: AssetImage('img/agregar.png'),
      ),
    ),   
  ),
  onTap: () {
    Navigator.of(context).push(MaterialPageRoute<Null>( 
      builder: (BuildContext context){
        return new AgregarPlanta();
      })     
    );     
    print("Agregar Planta");
  },
);

    Widget botonesImgM(BuildContext context,String url2) => Row(
          children: [
             _buildDecoratedImageM(context),
            _buildDecoratedImage(url2),

          ],
    );
    Widget botonesImg(String url1,String url2) => Row(
          children: [
            _buildDecoratedImage(url1),
            _buildDecoratedImage(url2),

          ],
    );
   

    Widget grupoBotonesPlantas(BuildContext context) => Container(
      child: Column(
        children: [
          botonesImgM(context,'https://d7lju56vlbdri.cloudfront.net/var/ezwebin_site/storage/images/_aliases/img_1col/noticias/estos-son-los-lugares-de-expansion-de-las-plantas-exoticas/5478919-1-esl-MX/Estos-son-los-lugares-de-expansion-de-las-plantas-exoticas.jpg'),
          botonesImg('https://estaticos.muyinteresante.es/uploads/images/pyr/56a08e7b5bafe89a9bcdfea8/giro-plantas_0.jpg','https://agriculturers.com/wp-content/uploads/2020/06/Como-se-clasifican-las-plantas.jpg'),
         // botonesImg('https://www.elmueble.com/medio/2019/03/27/adianthum_37d94a61_800x800.jpg','https://i.pinimg.com/originals/50/e0/6e/50e06e64a01db9b6c6d9a397a17483b6.jpg'),
          botonesImg('https://www.elmueble.com/medio/2019/03/27/adianthum_37d94a61_800x800.jpg','https://i.pinimg.com/originals/50/e0/6e/50e06e64a01db9b6c6d9a397a17483b6.jpg'),

        ],
      ),
     
    );
    
  
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pantallas ',    
        home: Scaffold(
          body:
          SingleChildScrollView(      
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(color: Color.fromRGBO(199,218,196, 1)),//color de fondo
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,//se alinean al principio los lementos que se agreguen al contenedor
                children: [
                  Container(           
                    child: Column(children: [
                        tituloApp(context), titulo,grupoBotonesPlantas(context),
                    ],)          
                  ),
                ],
              ),
            ),
          )
        )
      ); 
    }
}