import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import 'firebase_referencias.dart';

class QuerysService{

  final _fireStore = Firestore.instance;

  Future<QuerySnapshot> getAllCategories() async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CATEGORIES).getDocuments();
  }

  Future<QuerySnapshot> getAllUsersByDateTime() async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_USERS).orderBy('createdOn', descending: true).limit(20).getDocuments();
  }

  Future<QuerySnapshot> getAllUsersByState({String state}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_USERS).where('state', isEqualTo: state).orderBy('createdOn', descending: true).limit(20).getDocuments();
  }

  Future<QuerySnapshot> getAllUsersByStateAndCity({String state, String city}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_USERS).where('locality', isEqualTo: city).where('state', isEqualTo: state).orderBy('createdOn', descending: true).limit(20).getDocuments();
  }

  Future<QuerySnapshot> getAllUsersByEmail({String email}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_USERS).where('email', isEqualTo: email).getDocuments();
  }

  Future<QuerySnapshot> getAllCensersByCategory({String category}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).where('category', isEqualTo: category).where("active", isEqualTo: true).where("completed", isEqualTo: true).getDocuments();
  }

  Future<QuerySnapshot> getAllCensers() async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).orderBy("createdOn", descending: true).limit(20).getDocuments();
  }

  Future<QuerySnapshot> getCensersByEmail({String email}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).where('email', isEqualTo: email).getDocuments();
  }

  Future<QuerySnapshot> getCensersByState({String state}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).where('state', isEqualTo: state).orderBy("createdOn", descending: true).limit(20).getDocuments();
  }

  Future<QuerySnapshot> getCensersByStateAndCity({String state, String city}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).where('state', isEqualTo: state).where('locality', isEqualTo: city).orderBy("createdOn", descending: true).limit(20).getDocuments();
  }

  Future<QuerySnapshot> getAllSalesByDate({DateTime fechaInicial, DateTime fechaFinal}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_EARNINGS).where('dateTime', isGreaterThanOrEqualTo: fechaInicial).where('dateTime', isLessThanOrEqualTo: fechaFinal).getDocuments();
  }

  Future<QuerySnapshot> getAllSalesByDateAndSateLocality({DateTime fechaInicial, DateTime fechaFinal, String state, String locality}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_EARNINGS).where('dateTime', isGreaterThanOrEqualTo: fechaInicial).where('dateTime', isLessThanOrEqualTo: fechaFinal).where("state", isEqualTo: state).where("locality", isEqualTo: locality).getDocuments();
  }

  Future<QuerySnapshot> getMiInfo({String miId}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_ADMIN).where('id', isEqualTo: miId).getDocuments();
  }

  void SaveUsuario({String idUsuario,BuildContext context, Function function, Function errorFunction, Map<String, dynamic> collectionValues}) async {
    bool error = false;

    await _fireStore.collection(FirebaseReferencias.REFERENCE_USERS).document(idUsuario).setData(collectionValues).catchError((onError){
      Toast.show("Ha ocurrido un error, por favor, intente de nuevo", context, duration: Toast.LENGTH_LONG);
      error = true;
    }).then((onValue){
      if(!error){
        Toast.show("¡Información subida exitosamente!", context, duration: Toast.LENGTH_LONG);
        function();
      }
      else{
        errorFunction();
      }
    });
  }

  void SaveCenser({String idCenser,BuildContext context, Function function, Function errorFunction, Map<String, dynamic> collectionValues}) async {
    bool error = false;

    await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).document(idCenser).setData(collectionValues).catchError((onError){
      Toast.show("Ha ocurrido un error, por favor, intente de nuevo", context, duration: Toast.LENGTH_LONG);
      error = true;
    }).then((onValue){
      if(!error){
        Toast.show("¡Información subida exitosamente!", context, duration: Toast.LENGTH_LONG);
        function();
      }
      else{
        errorFunction();
      }
    });
  }

  UpdateUsuario({String collectionName, String idUsuario, Map<String, dynamic> collectionValues}) async {
    return await _fireStore.collection(collectionName).document(idUsuario).setData(collectionValues, merge: true);
    //_fireStore.collection(collectionName).document("").add(collectionValues);
  }

  UpdateSuspendedTrueCenser({String idCenser, Function function}) async {
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).document(idCenser).updateData({"suspended": true});
  }

  UpdateSuspendedFalseCenser({String idCenser, Function function}) async {
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).document(idCenser).updateData({"suspended": false});
  }

  Future<String> uploadProfilePhoto({File file, String id}) async {

    final StorageReference storageReference = FirebaseStorage.instance.ref().child("Users").child(id + "-profile.png");
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url = dowurl.toString();
    return url;
  }

  void updateFotosEstablecimientoData({String idEstablecimiento, BuildContext context, List<String> collectionValues}) async{
    bool error = false;
    await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).document(idEstablecimiento).updateData({"photos": collectionValues}).catchError((onError){
      Toast.show("Ha ocurrido un error, por favor, intente de nuevo", context, duration: Toast.LENGTH_LONG);
      error = true;
    }).then((onValue){
      if(!error){
        Toast.show("¡Información actualizada exitosamente!", context, duration: Toast.LENGTH_LONG);
      }
    });
  }


}