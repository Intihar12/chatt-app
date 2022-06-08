import 'package:chatt_app/userDoa.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'Users.dart';
import 'firebasemessage.dart';
import 'messagingclass.dart';

class messagingshow extends StatefulWidget {
  const messagingshow({Key? key, required this.id, required this.receiver, required this.sender}) : super(key: key);
final  String id;
final String receiver;
final String sender ;

  @override
  _messagingshowState createState() => _messagingshowState();
}

class _messagingshowState extends State<messagingshow> {
  final userDao = UserDao();
  final userdao=UserDao();
  final messageDoa= MessageDoa();
late final String result;
  TextEditingController messagecontroller= TextEditingController();

  late Query myList;
//Future<List<MessageDoa>>? intuu;
   late Query mylist;
  @override
  void initState() {
    // TODO: implement initState
    // print("my_log: " + name);
    super.initState();
    print("my_log: ID " + widget.id);
    print("my_log: receiver " + widget.receiver);
    print("my_log: sender " + widget.sender);
   // getUsername();

    // final DatabaseReference _messagedoa= FirebaseDatabase.instance.ref().child("Messages");
//myList =messageDoa.getMessageQuery() ;
   /* DatabaseReference mDatabase =FirebaseDatabase.instance.ref().child("Messages");
    mDatabase.orderByChild("receiver").equalTo(widget.receiver).onChildAdded.forEach((event) =>
    {
      print("my_log: onchildadded " + event.snapshot.key.toString())
    });*/

/*  setState(() {
    myList=FirebaseDatabase.instance.ref().child("Messages");
    myList.orderByChild("receiver").equalTo(widget.receiver).onChildAdded.forEach((event) =>
    {
      print("my_log: onchildadded " + event.snapshot.key.toString()),
      result= event.snapshot.key.toString(),
      print("my_log: result value" + result)
    });
  });*/

    setState(() {
      DatabaseReference INTUU=FirebaseDatabase.instance.ref().child("Messages");
  mylist =  INTUU.orderByChild("receiver").equalTo(widget.receiver).onChildAdded.forEach((event) =>
      {
        print("my_log: onchildadded " + event.snapshot.key.toString()),
        result= event.snapshot.key.toString(),
        print("my_log: result value" + result)
      }) as Query ;
    });

  }
late  String results;
  void _sendmessage(){
    final message= Message(messagecontroller.text, widget.receiver, widget.sender,);
    messageDoa.savemessgae(message);
    messagecontroller.clear();
    setState(() {

    });
  }



  Widget _getmessage({required Message usermessage}){
    return Container(
      // width:  200 ,
      //height: double.infinity,
        color: Colors.tealAccent,
        alignment: Alignment.topRight,
      child:  Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [


              Text(usermessage.message + " " + usermessage.receiver + " " + usermessage.sender)

              // if(widget.receiver == usermessage.receiver)...[
              //   SizedBox(height: 4,),
              //   Text(usermessage.message),
              //   SizedBox(height: 4,),
              //   Text(usermessage.receiver),
              //   SizedBox(height: 4,),
              //   Text(usermessage.sender),
              //   SizedBox(height: 4,),
              //
              // ]//else ...[Text("shjakas")]
              ],),
          ),
        ),
      )
    );
  }
  Widget getmessagelist() {
    return Expanded(child: FirebaseAnimatedList(
     // query: messageDoa.getMessageQuery(),
      query:myList,
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        final dataa = Message.fromJson(json);
        return _getmessage(usermessage: dataa);
      },
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messeging Page"),),

      body: Column(children: [
        getmessagelist(),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child:    TextField(
                  controller: messagecontroller,
                  decoration: InputDecoration(
                      hintText: "Message"
                  ),
                ),),
              TextButton(onPressed: (){_sendmessage();}, child: Text("send" ))


            ],),
        ),
      ],),
    );
  }
}
