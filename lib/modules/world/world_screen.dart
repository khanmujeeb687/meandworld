import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meandworld/modules/models/user.dart';
import 'package:meandworld/modules/providers/chat_provider.dart';
import 'package:meandworld/values/collection_name.dart';
import 'package:provider/provider.dart';

class WorldScreen extends StatefulWidget {
  const WorldScreen({Key? key}) : super(key: key);

  @override
  _WorldScreenState createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {

  List<DocumentSnapshot> users=[];

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
        return ListTile(
          leading: CircleAvatar(child: Text(users[index]['name'][0]),),
          title: Text(users[index]['name']),
          subtitle: Text(users[index]['email']),
        );
      }),
    );
  }


  fetch() async{
    User? user = Provider.of<ChatsProvider>(context,listen: false).currentUser;
    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection(Collections.USER).where('id',isNotEqualTo: user!.id).get();
    setState(() {
      users = snapshot.docs;
    });
  }
}
