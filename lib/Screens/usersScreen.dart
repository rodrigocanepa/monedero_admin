import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Usuarios"
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Mega Monedero Admin",
            style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "Filtrar por municipio",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 40.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Center(
              child: Text(
                "Seleccione un municipio",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
          SizedBox(
            height:25.0,
          ),
          Text(
            "Buscar por nombre",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
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
                  hintText: "Ejemplo: Juan Pérez",
                  //border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontFamily: 'Futura',
                    //color: ColoresApp.Colores.colorGrisClaro
                  )
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
