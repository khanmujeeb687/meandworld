import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meandworld/modules/localstorage/storage_util.dart';
import 'package:meandworld/modules/models/user.dart';
import 'package:meandworld/values/collection_name.dart';
import 'package:meandworld/values/shared_preference_keys.dart';

class AuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn();


  signInWithGoogle() async {
      print(await StorageUtil.getUser());
      GoogleSignInAccount? resp = await _googleSignIn.signIn();
      User user = new User(name: resp!.displayName,email: resp.email,googleId: resp.id,profileUrl: resp.photoUrl);
      StorageUtil.saveUser(user.toString());
      print(user.toString());
      await saveUser(user);
      return user;

  }


  haveUserByGoogleId(User user) async{
    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection(Collections.USER).where('googleId',isEqualTo: user.googleId).get();
    return !snapshot.docs.isEmpty;
  }

  saveUser(User user) async{
    bool alreadyPresent = await haveUserByGoogleId(user);
    if(!alreadyPresent){
      DocumentReference ref =await FirebaseFirestore.instance.collection(Collections.USER).add(user.toJson());
      ref.update({'id': ref.id});
    }
    return user;
  }


}
