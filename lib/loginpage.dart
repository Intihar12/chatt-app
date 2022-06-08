import 'package:chatt_app/showdata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Users.dart';
import 'userDoa.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

 // final messageDao = MessageDao();


  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final userDao = UserDao();
  final _formKey = GlobalKey<FormState>();
 // final database= FirebaseDatabase.instance.ref().child('Users');
  TextEditingController namecontroller =TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
getdata();
}
  void getdata()async{
    final prefs= await SharedPreferences.getInstance();
    String userinput= prefs.getString("inputuser") ?? "";
    namecontroller.text=userinput;
   // prefs.remove("inputuser");
  }

  void _saveusers() {

      final user = User(namecontroller.text, );
      userDao.saveuser(user);
      namecontroller.clear();
      setState(() {});
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "pleas enter some text";
                  }
                  return null;
                },
                controller: namecontroller,
                decoration: InputDecoration(
                    hintText: "name"
                ),


              ),

              TextButton(onPressed: ()async{

                if(_formKey.currentState!.validate()){


                setState(()async {
                  final prefs= await SharedPreferences.getInstance();
                  await prefs.setString( 'inputuser', namecontroller.text);
getdata();
                  _saveusers();

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdata(sender:namecontroller.text )));


                });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("processing data")));

                }


              }, child: Text("Log in")),

              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdata(sender: namecontroller.text,)));}, child: Text("show data"))
            ],
          ),
        ),
      ),
    );
  }




}
