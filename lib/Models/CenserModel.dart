class CenserModel{

  String id;
  String name;
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
  List<String> photos;

  CenserModel({this.id, this.name, this.description, this.state, this.locality, this.services, this.category, this.addres, this.openHours, this.distanceTo, this.photos, this.latitude, this.longitude});
}