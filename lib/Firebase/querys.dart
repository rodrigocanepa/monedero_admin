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

  Future<QuerySnapshot> getAllCensersByCategory({String category}) async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).where('category', isEqualTo: category).where("active", isEqualTo: true).where("completed", isEqualTo: true).getDocuments();
  }
  Future<QuerySnapshot> getAllCensers() async{
    return await _fireStore.collection(FirebaseReferencias.REFERENCE_CENSERS).getDocuments();
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

  Future<String> uploadProfilePhoto({File file, String id}) async {

    final StorageReference storageReference = FirebaseStorage.instance.ref().child("Users").child(id + "-profile.png");
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url = dowurl.toString();
    return url;
  }


}