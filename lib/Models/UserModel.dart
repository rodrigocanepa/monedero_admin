class UserModel{

  String id;
  String name;
  String lastName;
  String state;
  String locality;
  DateTime createdOn;
  String urlProfile;
  DateTime activeUntil;
  int renovations;

  UserModel({this.id, this.name, this.lastName, this.state, this.locality, this.createdOn, this.urlProfile, this.activeUntil, this.renovations});
}