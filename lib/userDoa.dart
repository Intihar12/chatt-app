
import 'package:firebase_database/firebase_database.dart';

import 'Users.dart';
class UserDao {
  final  _messagesRef =
  FirebaseDatabase.instance.ref().child('Users');

  void saveuser(User user) {
    _messagesRef.push().set(user.toJson());
  }
  Query getMessageQuery() {
    return _messagesRef;
  }
  Query getMessageQuerysingle(String name) {
    return _messagesRef;
  }
}