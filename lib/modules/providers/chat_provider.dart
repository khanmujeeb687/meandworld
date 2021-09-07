import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meandworld/modules/models/chat.dart';
import 'package:meandworld/modules/models/user.dart';
import 'package:meandworld/values/collection_name.dart';

class ChatsProvider with ChangeNotifier {

  BuildContext? context;

  DocumentSnapshot? lastChat;

  User? currentUser;

  bool _hasMoreChats=true;

  List<Chat> _chats =[];

  List<Chat> get chats => _chats;

  init(BuildContext context) async{
    this.context=context;
    await Firebase.initializeApp();
    fetchChats();
  }

  void fetchChats() async{
    assert(currentUser!=null);
    QuerySnapshot? snapshot;

    if(lastChat==null){
      snapshot =await FirebaseFirestore.instance.collection(Collections.CHAT).where('users',whereIn: [currentUser!.id]).limit(Collections.CHATS_PER_PAGE).get();
    }else{
      snapshot =await FirebaseFirestore.instance.collection(Collections.CHAT)
          .where('users',whereIn: [currentUser!.id]).startAfterDocument(lastChat!).limit(Collections.CHATS_PER_PAGE).get();
    }


    if(snapshot.docs.isNotEmpty){
      _chats.addAll(Chat.listFromJSON(snapshot.docs));
      lastChat=snapshot.docs[snapshot.docs.length-1];
    }else{
      _hasMoreChats=false;
    }


    notifyListeners();
  }

}