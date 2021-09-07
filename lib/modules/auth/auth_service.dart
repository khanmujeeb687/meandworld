import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meandworld/modules/localstorage/storage_util.dart';
import 'package:meandworld/modules/models/user.dart';
import 'package:meandworld/values/collection_name.dart';

class AuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    print(await StorageUtil.getUser());
    GoogleSignInAccount? resp = await _googleSignIn.signIn();
    User user = new User(
        name: resp!.displayName,
        email: resp.email,
        googleId: resp.id,
        profileUrl: resp.photoUrl);
    print(user.toString());
    String id = await saveUser(user);
    user.id = id;
    await StorageUtil.saveUser(user.toString());
    return user;
  }

  getUser(User user) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(Collections.USER)
        .where('googleId', isEqualTo: user.googleId)
        .get();
    if (snapshot.docs.length > 0) {
      return snapshot.docs.first;
    }
    return null;
  }

  saveUser(User user) async {
    DocumentSnapshot? alreadyPresent = await getUser(user);
    if (alreadyPresent == null) {
      DocumentReference ref = await FirebaseFirestore.instance
          .collection(Collections.USER)
          .add(user.toJson());
      ref.update({'id': ref.id});
      return ref.id;
    }
    return alreadyPresent.id;
  }
}
