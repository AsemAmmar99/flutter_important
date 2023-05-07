class UsersResponse{
  List<User>? _data;

  List<User> get data => _data ?? [];

  UsersResponse({List<User>? data}){
    _data = data;
  }

  UsersResponse.fromJson(Map<String, dynamic> json){
    if(json['data'] != null && json['data'] != []){
      _data = <User>[];
      json['data'].forEach((v) {
        _data!.add(User.fromJson(v));
      });
    }
  }
}

class User{
  num? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;

  num get id => _id ?? 0;

  String get email => _email ?? '';

  String get firstName => _firstName ?? '';

  String get lastName => _lastName ?? '';

  String get avatar => _avatar ?? '';

  User(int? id, String? email, String? firstName, String? lastName, String? avatar){
    _id = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _avatar = avatar;
  }

  User.fromJson(Map<String, dynamic> json){
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }
}
// {
// "page": 1,
// "per_page": 6,
// "total": 12,
// "total_pages": 2,
// "data": [
// {
// "id": 1,
// "email": "george.bluth@reqres.in",
// "first_name": "George",
// "last_name": "Bluth",
// "avatar": "https://reqres.in/img/faces/1-image.jpg"
// },
// {
// "id": 2,
// "email": "janet.weaver@reqres.in",
// "first_name": "Janet",
// "last_name": "Weaver",
// "avatar": "https://reqres.in/img/faces/2-image.jpg"
// },
// {
// "id": 3,
// "email": "emma.wong@reqres.in",
// "first_name": "Emma",
// "last_name": "Wong",
// "avatar": "https://reqres.in/img/faces/3-image.jpg"
// },
// {
// "id": 4,
// "email": "eve.holt@reqres.in",
// "first_name": "Eve",
// "last_name": "Holt",
// "avatar": "https://reqres.in/img/faces/4-image.jpg"
// },
// {
// "id": 5,
// "email": "charles.morris@reqres.in",
// "first_name": "Charles",
// "last_name": "Morris",
// "avatar": "https://reqres.in/img/faces/5-image.jpg"
// },
// {
// "id": 6,
// "email": "tracey.ramos@reqres.in",
// "first_name": "Tracey",
// "last_name": "Ramos",
// "avatar": "https://reqres.in/img/faces/6-image.jpg"
// }
// ],
// "support": {
// "url": "https://reqres.in/#support-heading",
// "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
// }
// }