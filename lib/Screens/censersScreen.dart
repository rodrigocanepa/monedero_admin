import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:monedero_admin/Firebase/querys.dart';
import 'package:monedero_admin/Items/censerItem.dart';
import 'package:monedero_admin/Models/CenserModel.dart';
import 'package:monedero_admin/Screens/addCenserScreen.dart';
import 'package:toast/toast.dart';

class CensersScreen extends StatefulWidget {
  @override
  _CensersScreenState createState() => _CensersScreenState();
}

class _CensersScreenState extends State<CensersScreen> {

  bool _showSpinner = false;
  List<CenserModel> censers = [];

  void _getCensers() async {

    final messages = await QuerysService().getAllCensers();
    censers = _getCenserItem(messages.documents);

    if(censers.length > 0){

      setSpinnerStatus(false);

    }
    else{
      setSpinnerStatus(false);
      Toast.show("No se han encontrado censers", context, duration: Toast.LENGTH_LONG);
    }
  }

  List<CenserModel> _getCenserItem(dynamic miInfo){

    List<CenserModel> miInfoList = [];

    for(var datos in miInfo) {
      final id_ = datos.data['id'];
      final name_ = datos.data['name'] ?? '';
      final email_ = datos.data['email'] ?? '';
      final createdOn_ = datos.data['createdOn'];
      final description_ = datos.data['description'] ?? '';
      final category_ = datos.data['category'] ?? '';
      final addres_ = datos.data['addres'] ?? '';
      final openHours_ = datos.data['openHours'] ?? '';
      final latitude_ = datos.data['latitude'] ?? '';
      final longitude_ = datos.data['longitude'] ?? '';
      final state_ = datos.data['state'] ?? '';
      final locality_ = datos.data['locality'] ?? '';
      final nameOwner_ = datos.data['nameOwner'] ?? '';
      final numberOwner_ = datos.data['numberOwner'] ?? '';
      final suspended_ = datos.data['suspended'];
      final photos_ = datos.data['photos'];
      final services_ = datos.data['services'];
      final distanceTo_ = datos.data['distanceTo'] ?? '';


      CenserModel censerModel = CenserModel(
        id: id_,
        name: name_,
        email: email_,
        createdOn: createdOn_.toDate(),
        locality: locality_,
        state: state_,
        suspended: suspended_,
        description: description_,
        category: category_,
        addres: addres_,
        openHours: openHours_,
        latitude: latitude_,
        longitude: longitude_,
        nameOwner: nameOwner_,
        numberOwner: numberOwner_,
        photos: photos_ == null ? [] : photos_.cast<String>(),
        services: services_ == null ? [] : services_.cast<String>(),
        distanceTo: distanceTo_,
      );


      miInfoList.add(censerModel);
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
    _getCensers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "CENSERs"
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
                          hintText: "Ejemplo: dentista.pablo@gmail.com",
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddCenserScreen()
              )
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _usersList(){

    if(censers.length > 0){
      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Flexible(
          child: ListView.builder(
              itemCount: censers.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return CenserItem(censerModel: censers[index]);
              }
          ),
        ),
      );
    }
    else{
      return Container();
    }
  }

  _reloadData(){
    censers.clear();
    _getCensers();
  }
}
