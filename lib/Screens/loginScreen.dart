import 'package:flutter/material.dart';
import 'package:monedero_admin/Screens/mainScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  double height;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Mega Monedero Administrador",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
                  child: Text(
                    "Correo electrónico",
                    style: TextStyle(
                        fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    //controller: _passwordController,
                    //obscureText: true,
                    style: TextStyle(
                        fontFamily: 'Futura',
                        //color: ColoresApp.Colores.colorGrisClaro
                    ),
                    decoration: InputDecoration(
                        hintText: "ejemplo@gmail.com",
                        //border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: 'Futura',
                            //color: ColoresApp.Colores.colorGrisClaro
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
                  child: Text(
                    "Contraseña",
                    style: TextStyle(
                        fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    //controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(
                      fontFamily: 'Futura',
                      //color: ColoresApp.Colores.colorGrisClaro
                    ),
                    decoration: InputDecoration(
                        //hintText: "ejemplo@gmail.com",
                        //border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: 'Futura',
                          //color: ColoresApp.Colores.colorGrisClaro
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 40.0),
                  child: Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreen()
                        )
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top:25.0, left: 40.0, right: 40.0),
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
