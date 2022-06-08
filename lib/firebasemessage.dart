

  import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'messagingclass.dart';
  class MessageDoa{

    final DatabaseReference _messagedoa= FirebaseDatabase.instance.ref().child("Messages");







    void savemessgae(Message message){
      _messagedoa.push().set(message.toJson());

    }

    Query getMessageQuery(){
      return _messagedoa;
    }


    }
