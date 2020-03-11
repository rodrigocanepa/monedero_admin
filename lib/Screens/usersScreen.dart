import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:monedero_admin/Firebase/querys.dart';
import 'package:monedero_admin/Items/itemUser.dart';
import 'package:monedero_admin/Models/UserModel.dart';
import 'package:toast/toast.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  bool _showSpinner = true;
  List<UserModel> usuarios = [];

  void _getUsers() async {

    final messages = await QuerysService().getAllUsersByDateTime();
    usuarios = _getUserItem(messages.documents);

    if(usuarios.length > 0){


      setSpinnerStatus(false);

    }
    else{
      setSpinnerStatus(false);
      Toast.show("No se han encontrado usuarios", context, duration: Toast.LENGTH_LONG);
    }
  }

  List<UserModel> _getUserItem(dynamic miInfo){

    List<UserModel> miInfoList = [];

    for(var datos in miInfo) {
      final id_ = datos.data['id'];
      final name_ = datos.data['name'] ?? '';
      final lastName_ = datos.data['lastName'] ?? '';
      final email_ = datos.data['email'] ?? '';
      final createdOn_ = datos.data['createdOn'];
      final activeUntil_ = datos.data['activeUntil'];
      final locality_ = datos.data['locality'] ?? '';
      final state_ = datos.data['state'] ?? '';
      final renovations_ = datos.data['renovations'];
      final suspended_ = datos.data['suspended'];
      final urlProfile_ = datos.data['urlProfile'] ?? '';


      UserModel usuariosModel = UserModel(
        id: id_,
        name: name_,
        email: email_,
        createdOn: createdOn_.toDate(),
        activeUntil: activeUntil_.toDate(),
        lastName: lastName_,
        locality: locality_,
        state: state_,
        renovations: renovations_,
        suspended: suspended_,
        urlProfile: urlProfile_,
      );


      miInfoList.add(usuariosModel);
    }
    return miInfoList;
  }

  void setSpinnerStatus(bool status){
    setState(() {
      _showSpinner = status;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Usuarios"
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Column(
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
              height: 15.0,
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
              "Buscar por correo electrónico",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      //controller: _passwordController,
                      //obscureText: true,
                      style: TextStyle(
                        fontFamily: 'Futura',
                        //color: ColoresApp.Colores.colorGrisClaro
                      ),
                      decoration: InputDecoration(
                          hintText: "Ejemplo: juan@gmail.com",
                          //border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'Futura',
                            //color: ColoresApp.Colores.colorGrisClaro
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[400],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.search
                    ),
                  ),
                ),
                SizedBox(
                  width: 25.0,
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            _usersList()

          ],
        ),
      ),
    );
  }

  Widget _usersList(){

    if(usuarios.length > 0){
      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Flexible(
          child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return UserItem(userModel: usuarios[index]);
              }
          ),
        ),
      );
    }
    else{
      return Container();
    }
  }
}
