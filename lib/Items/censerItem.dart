import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monedero_admin/Models/CenserModel.dart';

class CenserItem extends StatefulWidget {

  CenserModel censerModel;
  CenserItem({this.censerModel});

  @override
  _CenserItemState createState() => _CenserItemState();
}

class _CenserItemState extends State<CenserItem> {

  bool active = true;
  String dateUser = "";
  String formattedDate = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(widget.censerModel.createdOn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: GestureDetector(
        onTap: (){
          /*Navigator.push(
              this.context,
              MaterialPageRoute(
              builder: (context) => DetallesUsuarioScreen (usuariosModel: widget.usuariosModel))
          );*/
        },
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  child: Text(
                      widget.censerModel.name[0]
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      widget.censerModel.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Propietario: " + widget.censerModel.nameOwner,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        widget.censerModel.email
                    ),
                    Text(
                      !widget.censerModel.suspended ? "Activo" : "Suspendido",
                      style: TextStyle(
                        color: active ? Color.fromARGB(255, 24, 148, 206) : Colors.red,

                      ),
                    ),
                    Text(
                        widget.censerModel.locality + ", " + widget.censerModel.state
                    ),
                    Text(
                        "Creado el " + formattedDate
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
