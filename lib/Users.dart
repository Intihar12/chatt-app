
class User{
 final String name;

  User(  this.name);

 User.fromJson(Map<dynamic, dynamic> json)
     : name = json['name'];


 Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  'name': name,
 };
}


