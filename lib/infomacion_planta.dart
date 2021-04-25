import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantalla_principal/calendario_riego.dart';
import 'package:pantalla_principal/tipo_sustrato.dart';
import 'package:pantalla_principal/informacion.dart'; //para poder utilizar las fuentes de google https://fonts.google.com/ tienen que agregar la dependencia en el archivo pubspec.yaml


class InfomacionPlanta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantallas ',
      home: PantallaInfomacionPlanta(),
    );
  }
}

class PantallaInfomacionPlanta extends StatefulWidget {
  @override
  PantallaInfomacionPlantaState createState() => PantallaInfomacionPlantaState();
}

class PantallaInfomacionPlantaState extends State<PantallaInfomacionPlanta> {
  tituloApp(BuildContext context) => Container(
        // en este contenedor esta lo que es el titulo y el icono
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 120, bottom: 20,left: 50),
        //nos ayuda a situar nuestro contenedor
        child: Column(
          //el contenedor tien una columna como hijo, puede tener una row o un center o un padding
          children: <Widget>[
            //y su hijo tiene una lista de Widget(que serian el texto y el icono)
            Center(
              child: Row(
                //tenemos una fila para que se alinien el texto y el icono horizontalmente
                mainAxisSize: MainAxisSize.min,
                //para que la separacion entre el texto y el icono sea la menor posible, es decir que queren juntitos
                children: [
                  Text(
                    'C r e c i e n d o   j u n t o s ',
                    style: GoogleFonts.kronaOne(
                      //tenemos acceso a todas las fuentes de google solo es colocar GoogleFonts.nombreFuente
                      color: Colors.grey[500],
                      fontSize: 18,
                    ),
                  ),
                  Image.asset('img/hoja.png', scale: 15),
                  //seleccionamos a imagen que esta en nuestra carpeta img(es necesario antes modificar el pubspec.yaml)
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildDecoratedImage1(String imageIndex) => GestureDetector(
        child: Center(
          child: Container(
            width: 160,
            height: 200,
            //alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, bottom: 4, left: 40),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(40)),
              image: DecorationImage(
                  image: NetworkImage('$imageIndex'), fit: BoxFit.cover),
            ),
          ),
        ),
        onTap: () {
          print("Planta $imageIndex");
        },
      );

  //este metodo regresa un cuadro con la imagen , recibe por parametro el link de l aimeng

  Widget _buildDecoratedImage(String imageIndex) => GestureDetector(
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 9),
            margin: EdgeInsets.only(top: 10, bottom: 4, right: 1, left: 1),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(25)),
              image: DecorationImage(
                  image: NetworkImage('$imageIndex'), fit: BoxFit.cover),
            ),
          ),
        ),
        onTap: () {
          print("Planta $imageIndex");
        },
      );
//es sismilar al metodo anterior pero este es para el boton de agregar
  Widget _buildDecoratedImageM(BuildContext context) =>  Center(
          child: Row(
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: (){
                     Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context){
                            return new Informacion();
                          })
                      );
                  },
                ),
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 10, bottom: 4, right: 1, left: 30),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 132, 120, 0.4),
                  borderRadius:const BorderRadius.all(const Radius.circular(25)),
                  image: DecorationImage(
                    scale: 7,
                    image: AssetImage('img/informacion.png'),
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){
                     Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context){
                            return new TipoSustrato();
                          })
                      );
                  },
                ),
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 10, bottom: 4, right: 1, left: 1),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 132, 120, 0.4),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(25)),
                  image: DecorationImage(
                    scale: 8,
                    image: AssetImage('img/pala.png'),
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context){
                            return new CalendarioRiego();
                          })
                      );
                  },
                ),
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 10, bottom: 4, right: 1, left: 1),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 132, 120, 0.4),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(25)),
                  image: DecorationImage(
                    scale: 8,
                    image: AssetImage('img/calendario.png'),
                  ),
                ),
              ),
            ],
          ),
      );

  final informacionPlanta = Container(
    //alignment: Alignment.center,
    margin: EdgeInsets.only(top: 25, bottom: 10, right: 29, left: 60),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                width: 300,
                height: 70,
                child: Text(
                  'Descricpion de la rosa, pues es una rosa muy rosa y muy bonita y ahora que pasa si le pongo demasiado texto',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.actor(
                    //tenemos acceso a todas las fuentes de google solo es colocar GoogleFonts.nombreFuente
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  final elementosSimilares = Container(
    margin: EdgeInsets.only(top: 15, bottom: 10, left: 30),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Elementos similares',
                style: GoogleFonts.actor(
                  color: Color.fromRGBO(112, 112, 112, 1),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

//este metodo es especial para la primera fila, donde esta el boto de agregar y una imagen
  Widget botonesImgM(BuildContext context) => Row(
        children: [
          _buildDecoratedImageM(context),
        ],
      );

  //el metodo es similar al anterior, te regresa una fila con dos imagenes
  Widget botonesImg(String url1, String url2, String url3) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDecoratedImage(url1),
          _buildDecoratedImage(url2),
          _buildDecoratedImage(url3),
        ],
      );

  Widget botonImg(String url) => Row(
        children: [_buildDecoratedImage1(url)],
      );

  Widget grupoBotonesPlantas(BuildContext context) => Container(
        child: Column(
          children: [
            botonImg(
                'https://estaticos.muyinteresante.es/uploads/images/pyr/56a08e7b5bafe89a9bcdfea8/giro-plantas_0.jpg'),
            informacionPlanta,
            botonesImgM(context),
            elementosSimilares,
            botonesImg(
                'https://estaticos.muyinteresante.es/uploads/images/pyr/56a08e7b5bafe89a9bcdfea8/giro-plantas_0.jpg',
                'https://agriculturers.com/wp-content/uploads/2020/06/Como-se-clasifican-las-plantas.jpg',
                'https://www.elmueble.com/medio/2019/03/27/adianthum_37d94a61_800x800.jpg'),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pantallas',
        home: Scaffold(
            body: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(199, 218, 196, 1)), //color de fondo
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //se alinean al principio los lementos que se agreguen al contenedor
              children: [
                Container(
                    child: Column(
                  children: [
                    tituloApp(context),
                    //titulo,
                    grupoBotonesPlantas(context),
                  ],
                )),
              ],
            ),
          ),
        )));
  }
}