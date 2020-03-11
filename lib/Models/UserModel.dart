class UserModel{

  String id;
  String name;
  String lastName;
  String email;
  String state;
  String locality;
  DateTime createdOn;
  String urlProfile;
  DateTime activeUntil;
  int renovations;
  bool suspended;

  UserModel({this.id, this.name, this.state, this.locality, this.lastName, this.suspended, this.email, this.createdOn, this.urlProfile, this.activeUntil, this.renovations});
}