import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monedero_admin/Models/salesModel.dart';

class SalesItem extends StatefulWidget {

  SalesModel salesModel;
  List<SalesModel> salesList;
  SalesItem({this.salesModel, this.salesList});

  @override
  _SalesItemState createState() => _SalesItemState();
}

class _SalesItemState extends State<SalesItem> {

  List<SalesModel> sales = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        sales.clear();
        for(int i = 0; i < widget.salesList.length; i++){
          if(widget.salesList[i].storeId == widget.salesModel.storeId){
            sales.add(widget.salesList[i]);
          }
        }
        _showDetailsDialog();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  child: Text(
                      widget.salesModel.nameStore[0]
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
                      widget.salesModel.nameStore,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),
                    ),
                    Text(
                      "Categoría: " + widget.salesModel.categoryStore,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0
                      ),
                    ),
                    Text(
                      "Propietario: " + widget.salesModel.nameOwner,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        "Número del propietario: " +  widget.salesModel.numberOwner
                    ),
                    Text(
                        widget.salesModel.locality + ", " + widget.salesModel.state
                    ),
                    Text(
                      "Número de ventas realizadas: " + widget.salesModel.numberSales.toString()
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

  void _showDetailsDialog(){
    AlertDialog alertDialog = AlertDialog(
      title: Text(
        "DETALLE DE VENTAS",
        style: TextStyle(
          fontFamily: 'Barlow',
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
            itemCount: sales.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                        "Usuario que activó: " + sales[index].nameUser,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        "Fecha: " + DateFormat('yyyy-MM-dd – kk:mm').format(sales[index].dateTime)
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 1.0,
                      color: Colors.black26,
                    )
                  ],
                ),
              );
            }
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Cancelar",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }

}
