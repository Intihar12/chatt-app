import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'loginpage.dart';

  Future <void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  );
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginpage(),
    );
  }
}
