import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //para poder utilizar las fuentes de google https://fonts.google.com/ tienen que agregar la dependencia en el archivo pubspec.yaml


class Registrarse extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pantallas ',    
         home: Builder(
          builder: (context) => new PantallaRegistrarse(),
        ),
        routes: <String, WidgetBuilder>{
    //      '/registrarse': (BuildContext context) => new Registrarse(),
      //    '/pantallaIniciarSesion': (BuildContext context) => new M()
        }
      );
    
  }
}
class PantallaRegistrarse extends StatefulWidget{
   @override
  PantallaRegistrarseState createState() => PantallaRegistrarseState();
}

class PantallaRegistrarseState extends State<PantallaRegistrarse>{
  AnimationController controller;
  Animation<double> animation;

  GlobalKey<FormState> _key = GlobalKey();

  RegExp emailRegExp =
  new RegExp(r'^\w+[\w-\.]\@\w+((-\w+)|(\w))\.[a-z]{2,3}$');
  RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');
  String _correo;
  String _contrasena;
  String _conContrasena;
  String mensaje = '';
  bool _logueado = false;

    final tituloApp = Container(
      // en este contenedor esta lo que es el titulo y el icono
      padding: EdgeInsets.only(top: 120, bottom: 20, right: 0, left: 60),
      //nos ayuda a situar nuestro contenedor
      child: Column(
        //el contenedor tiene una columna como hijo
        children: <Widget>[
          //y su hijo tiene una lista de Widget(que serian el texto y el icono)
          Row(
            //tenemos una fila para que se alinien el texto y el icono horizontalmente
            mainAxisSize: MainAxisSize.min,
            //para que la separacion entre el texto y el icono sea la menor posible, es decir que queren juntitos
            children: [
              //la fila tiene dos hijos que son el texto y el icono
              Text(
                'C r e c i e n d o   j u n t o s ',
                style: GoogleFonts.kronaOne(
                  //tenemos acceso a todas las fuentes de google solo es colocar GoogleFonts.nombreFuente
                  color: Color.fromRGBO(112, 112, 112, 1),
                  fontSize: 18,
                ),
              ),
              Image.asset('img/hoja.png', scale: 15),
              //seleccionamos a imagen que esta en nuestra carpeta img(es necesario antes modificar el pubspec.yaml)
            ],
          ),
        ],
      ),
    );

    final tituloPantallas = Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.only(top: 50, bottom: 140, right: 0, left: 30),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                'REGISTRARSE',
                style: GoogleFonts.kronaOne(
                  //tenemos acceso a todas las fuentes de google solo es colocar GoogleFonts.nombreFuente
                  color: Color.fromRGBO(112, 112, 112, 1),
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    Widget loginForm() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300.0, //size.width * .6,
            child: Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo usuario es requerido";
                      } else if (!emailRegExp.hasMatch(text)) {
                        return "El formato para correo no es correcto";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 50,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Ingrese su nombre de usuario',
                      labelText: 'USUARIO',
                      counterText: '',
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.person,
                          size: 32.0, color: Color.fromRGBO(30, 91, 94, 1)),
                    ),
                    onSaved: (text) => _correo = text,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo contraseña es requerido";
                      } else if (text.length <= 5) {
                        return "Su contraseña debe ser al menos de 5 caracteres";
                      } else if (!contRegExp.hasMatch(text)) {
                        return "El formato para contraseña no es correcto";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 20,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Ingrese su Contraseña',
                      labelText: 'CONTRASEÑA',
                      counterText: '',
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.lock,
                          size: 32.0, color: Color.fromRGBO(30, 91, 94, 1)),
                    ),
                    onSaved: (text) => _contrasena = text,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo contraseña es requerido";
                      } else if (text.length <= 5) {
                        return "Su contraseña debe ser al menos de 5 caracteres";
                      } else if (!contRegExp.hasMatch(text)) {
                        return "El formato para contraseña no es correcto";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 20,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Ingrese su Contraseña',
                      labelText: 'CONFIRMAR CONTRASEÑA',
                      counterText: '',
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.lock,
                          size: 32.0, color: Color.fromRGBO(30, 91, 94, 1)),
                    ),
                    onSaved: (text) => _conContrasena = text,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    onPressed: () {
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                        //Aqui se llamaria a su API para hacer el login

                        /*setState(() {
                          _logueado = true;
                        });*/
                        mensaje = 'Gracias \n $_correo \n $_contrasena';
                        Navigator.pop(context);
//                      Una forma correcta de llamar a otra pantalla
//                      Navigator.of(context).push(HomeScreen.route(mensaje));
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Color.fromRGBO(30, 91, 94, 1),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    final opIniciarSesion = Container(
      padding: EdgeInsets.only(top: 30, bottom: 130, right: 29, left: 40),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Iniciar Sesión',
                style: GoogleFonts.kronaOne(
                  //tenemos acceso a todas las fuentes de google solo es colocar GoogleFonts.nombreFuente
                  color: Color.fromRGBO(30, 91, 94, 1),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantallas ',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('img/fondo.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: new Container(
                decoration:
                new BoxDecoration(color: Colors.white.withOpacity(0.2)),
                child: Column(children: [tituloApp,
                  tituloPantallas,
                  loginForm(),
                  opIniciarSesion],
                ) ,
              ),
            ),
          ),
        ),
      ),
    );
 }
}