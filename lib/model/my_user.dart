class MyUser {
  /// data Class

  /// 1- Collection Name
  static const String collectionName = 'Users';

  /// 2- Attributes
  String id;
  String name;
  String email;

  /// 3- Constructor
  MyUser({required this.id, required this.name, required this.email});

  /// 4- json => object
  MyUser.fromJson(Map<String, dynamic> json)
    : this(id: json['id'], name: json['name'], email: json['email']);

  /// 5- object => json
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}
