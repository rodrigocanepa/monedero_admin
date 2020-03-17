import 'package:flutter/material.dart';
import 'package:monedero_admin/Firebase/authentication.dart';
import 'package:monedero_admin/Models/adminModel.dart';
import 'package:monedero_admin/Screens/censersScreen.dart';
import 'package:monedero_admin/Screens/loginScreen.dart';
import 'package:monedero_admin/Screens/usersScreen.dart';
import 'package:monedero_admin/MyColors/Colors.dart' as MyColors;

class MainScreen extends StatefulWidget {

  AdminModel adminModel;
  MainScreen({this.adminModel});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final double barHeight = 50.0;

  @override
  Widget build(BuildContext context) {

    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: statusbarHeight),
            height: statusbarHeight + barHeight,
            child: Center(
              child: Text(
                "MEGA MONEDERO",
                style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [MyColors.Colors.colorBackgroundDark, MyColors.Colors.colorBackgroundLight],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "Bienvenido Admin",
            style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.adminModel.name + " " + widget.adminModel.lastName,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: (){
              _showAlertCerrarSesion();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Cerrar Sesión",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Seleccione una opción",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CensersScreen()
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top:20.0, left: 40.0, right: 40.0, bottom: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: MyColors.Colors.colorBackgroundLight
                  ),
                  child: Icon(
                    Icons.account_balance,
                    size: 50.0,
                    color: MyColors.Colors.colorBackgroundDark,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Administrar CenSers",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UsersScreen()
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top:20.0, left: 40.0, right: 40.0, bottom: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                      color: MyColors.Colors.colorBackgroundLight
                  ),
                  child: Icon(
                    Icons.supervisor_account,
                    size: 50.0,
                    color: MyColors.Colors.colorBackgroundDark,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Ver Usuarios",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CensersScreen()
                    )
                );*/
              },
              child: Padding(
                padding: const EdgeInsets.only(top:20.0, left: 40.0, right: 40.0, bottom: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: MyColors.Colors.colorBackgroundLight
                  ),
                  child: Icon(
                    Icons.attach_money,
                    size: 50.0,
                    color: MyColors.Colors.colorBackgroundDark,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Ver Ganancias",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),

    );
  }

  void _showAlertCerrarSesion(){
    AlertDialog alertDialog = AlertDialog(
      title: Text(
        "Cerrar Sesión",
        style: TextStyle(
          fontFamily: 'Barlow',
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        "¿Está seguro de querer cerrar sesión?",
        style: TextStyle(
          fontFamily: 'Barlow',
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Cancelar",
            style: TextStyle(
              fontSize: 16.0,
              color: MyColors.Colors.colorBackgroundDark,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            "Aceptar",
            style: TextStyle(
              fontSize: 16.0,
              color: MyColors.Colors.colorBackgroundDark,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Authentication().singOut();
            Navigator.of(context).pop();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginScreen ()
                ));
          },
        ),
      ],
    );

    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }

}
