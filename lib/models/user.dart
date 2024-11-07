class User {
  int? id;
  String? login;
  String? name;
  String? secondName;
  String? lastName;
  String? personalPhoto;
  String? company;
  String? workLogo;
  String? info;

  User({
    required this.id,
    required this.login,
    required this.name,
    required this.secondName,
    required this.lastName,
    required this.personalPhoto,
    required this.company,
    required this.workLogo,
    required this.info,
  });


  User.fromMap(Map<dynamic, dynamic> map) {
    id = int.parse(map['id']);
    login = map['login'];
    name = map['name'];
    secondName = map['second_name'];
    lastName = map['last_name'];
    personalPhoto = map['personal_photo'];
    company= map['company'];
    workLogo = map['work_logo'];
    info = map['info'];


  }
}