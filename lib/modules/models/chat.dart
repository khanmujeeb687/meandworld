import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meandworld/modules/models/user.dart';

class Chat{
  String? id;
  List<User>? users;
  int? createdAt;

  Chat({this.id, this.users, this.createdAt});

  static listFromJSON(List<QueryDocumentSnapshot> data){
    List<Chat> chats=[];
    for(int i=0;i<data.length;i++){
      chats.add(Chat.fromSnapShot(data[i]));
    }
    return chats;
  }

  Chat.fromSnapShot(QueryDocumentSnapshot data){
    id=data.id;
    //TODO add users also
  }
}