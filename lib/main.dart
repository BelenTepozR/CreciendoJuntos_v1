import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantalla_principal/plantas_usuario.dart';
import 'package:pantalla_principal/registrarse.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pantallas ',    
         home: Builder(
          builder: (context) => new PantallaIniciarSesion(),
        ),
        routes: <String, WidgetBuilder>{
          '/registrarse': (BuildContext context) => new Registrarse(),
          '/pantallaInicio': (BuildContext context) => new PlantasUsuario()
        }
      );
    
  }
}
class PantallaIniciarSesion extends StatefulWidget{
   @override
  PantallaIniciarSesionState createState() => PantallaIniciarSesionState();
}

class PantallaIniciarSesionState extends State<PantallaIniciarSesion>{
  AnimationController controller;
  Animation<double> animation;
  GlobalKey<FormState> _key = GlobalKey();
  RegExp emailRegExp =
  new RegExp(r'^\w+[\w-\.]\@\w+((-\w+)|(\w))\.[a-z]{2,3}$');
  RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');
  String _correo;
  String _contrasena;
  String mensaje = '';

  final tituloApp = Container(
    padding: EdgeInsets.only(top: 120, bottom: 20, right: 0, left: 40),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'C r e c i e n d o   j u n t o s ',
              style: GoogleFonts.kronaOne(
                color: Color.fromRGBO(112, 112, 112, 1),
                fontSize: 18,
              ),
            ),
            Image.asset('img/hoja.png', scale: 15),
          ],
        ),
      ],
    ),
  );

    final tituloPantallas = Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.only(top: 50, bottom: 140, right: 0, left: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                'INICIAR SESIÓN',
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

    Widget loginForm(BuildContext context) {
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
                        return "Este campo correo es requerido";
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
//                      Una forma correcta de llamar a otra pantalla
//                      Navigator.of(context).push(HomeScreen.route(mensaje));
                        Navigator.pushReplacementNamed(context, "/pantallaInicio");
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

    Widget opIniciarSesion(BuildContext context) => GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 189, right: 29, left: 40),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Registrarse',
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
      ),
      onTap: (){
        Navigator.pushReplacementNamed(context, "/registrarse");
        print("registrarse");
      },
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
                child:Column(children: [
                  tituloApp,
                  tituloPantallas,
                  loginForm(context),
                  opIniciarSesion(context)],
                ),
              ),
            ),
          ),
        ),
      ),
    );
   }
  }
