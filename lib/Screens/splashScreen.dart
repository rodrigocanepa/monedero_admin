import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monedero_admin/Firebase/authentication.dart';
import 'package:monedero_admin/Firebase/querys.dart';
import 'package:monedero_admin/Models/adminModel.dart';
import 'package:monedero_admin/Screens/loginScreen.dart';
import 'package:monedero_admin/MyColors/Colors.dart' as MyColors;
import 'package:monedero_admin/Screens/mainScreen.dart';
import 'package:toast/toast.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  List<AdminModel> usuarios = [];

  void _getMiInfo(String idPropio) async {

    final messages = await QuerysService().getMiInfo(miId: idPropio);
    usuarios = _getUserItem(messages.documents);

    if(usuarios.length > 0){

      Timer(
          Duration(
              milliseconds: 1000
          ), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen (adminModel: usuarios[0])
            )
        );
      });
    }
    else{
      Authentication().singOut();
      Timer(
          Duration(
              milliseconds: 1000
          ), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()
            )
        );
      });
    }
  }

  List<AdminModel> _getUserItem(dynamic miInfo){

    List<AdminModel> miInfoList = [];

    for(var datos in miInfo) {
      final id_ = datos.data['id'];
      final name_ = datos.data['name'] ?? '';
      final lastName_ = datos.data['lastName'] ?? '';
      final email_ = datos.data['email'] ?? '';
      final createdOn_ = datos.data['createdOn'];
      final locality_ = datos.data['locality'] ?? '';
      final state_ = datos.data['state'] ?? '';
      final code_ = datos.data['code'] ?? '';

      AdminModel usuariosModel = AdminModel(
        id: id_,
        name: name_,
        email: email_,
        createdOn: createdOn_.toDate(),
        code: code_,
        lastName: lastName_,
        locality: locality_,
        state: state_,
      );


      miInfoList.add(usuariosModel);
    }
    return miInfoList;
  }

  void getCurrentUser() async{
    var user = await Authentication().getCurrentUser();
    if (user != null) {
      _getMiInfo(user.uid);
    }
    else{
      Timer(
          Duration(
              milliseconds: 1000
          ), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()
            )
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [MyColors.Colors.colorBackgroundDark, MyColors.Colors.colorBackgroundLight],
                  end: FractionalOffset.topCenter,
                  begin: FractionalOffset.bottomCenter,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.repeated
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "MEGA MONEDERO",
                  style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Administador",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
