
import 'dart:convert';
import 'dart:ffi';

import 'package:chatt_app/messagingclass.dart';
import 'package:chatt_app/messagingshow.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Users.dart';
import 'firebasemessage.dart';
import 'userDoa.dart';

class viewdata extends StatefulWidget {
  const viewdata({Key? key, required this.sender }) : super(key: key);
  final String sender;
  @override
  _viewdataState createState() => _viewdataState();
}

class _viewdataState extends State<viewdata> {
final database=FirebaseDatabase.instance.ref().child("Users");
 final userDao = UserDao();

  Widget _buildshowdata({required  User uname}){
    return     Container( color:  Colors.amber,
      width: 70,
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          GestureDetector(
            onTap: () {
          FirebaseDatabase.instance.ref().child('Users')
              .orderByChild('name')
                  .equalTo(uname.name).onChildAdded.forEach((event) => {
                print("my_log: " + event.snapshot.key.toString()),
                print("udhuh ${event.snapshot.key.toString()}"),

                //
               /* Navigator.push(context, MaterialPageRoute(builder: (context)=>messagingshow(
                  id: event.snapshot.key.toString(),name: uname.name, sender: widget.sender,)))*/

            Navigator.push(context, MaterialPageRoute(builder: (context)=>messagingshow(
              id: event.snapshot.key.toString(),receiver: uname.name, sender: widget.sender,)))

              });
            },
            child: Text(uname.name,style: TextStyle(color: Colors.black,fontSize: 60),),
          )

        ],
      ),
    );
  }

 Widget _getuserList() {
   return Expanded(
     child: FirebaseAnimatedList(
       //controller: _scrollController,
       query: userDao.getMessageQuery(),
       itemBuilder: (context, snapshot, animation, index) {
//         final json = snapshot.value as Map<dynamic, dynamic>;

         final json = snapshot.value as Map<dynamic ,dynamic>;

         final data = User.fromJson(json);
//         return MessageWidget(message.name,);

         return _buildshowdata(uname:data,);

       },
     ),
   );
 }




  //

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _ref=FirebaseDatabase.instance.ref().child('Users').orderByChild('name');
    print("iintuuuuu");
//_getMessageList();
    // setState
    print("my_log: " + widget.sender);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('view data'),),

        body:
     Column(children: [    _getuserList()
     ],)

    );
  }

}