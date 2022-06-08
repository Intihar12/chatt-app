

class Message{
  final String message;
final String sender;
final String receiver;
  Message(this.message,this.receiver,this.sender );

  Message.fromJson(Map<dynamic, dynamic> json):
    message =json["message"],
      sender= json["sender"],
  receiver=json["receiver"]
  ;

  Map<dynamic,dynamic> toJson() => <dynamic, dynamic>{
    'message': message,
    'sender': sender,
    'receiver':receiver
  };

}