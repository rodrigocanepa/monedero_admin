import 'package:flutter/material.dart';
import 'package:monedero_admin/Screens/censersScreen.dart';
import 'package:monedero_admin/Screens/usersScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 40.0,
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
            "Seleccione una opción",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
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
                      color: Colors.blue[100]
                  ),
                  child: Icon(
                    Icons.supervisor_account,
                    size: 60.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Administrar Usuarios",
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
                      color: Colors.blue[100]
                  ),
                  child: Icon(
                    Icons.account_balance,
                    size: 60.0,
                    color: Colors.blue,
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
          SizedBox(
            height: 20.0,
          )
        ],
      ),

    );
  }
}
