class CenserModel{

  String id;
  String name;
  String email;
  DateTime createdOn;
  String description;
  List<String> services;
  String category;
  String addres;
  String openHours;
  String distanceTo;
  double latitude;
  double longitude;
  String state;
  String locality;
  String nameOwner;
  String numberOwner;
  bool suspended;
  List<String> photos;

  CenserModel({this.id, this.name, this.nameOwner, this.suspended, this.numberOwner, this.email, this.createdOn, this.description, this.state, this.locality, this.services, this.category, this.addres, this.openHours, this.distanceTo, this.photos, this.latitude, this.longitude});
}