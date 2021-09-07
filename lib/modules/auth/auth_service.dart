import 'package:google_sign_in/google_sign_in.dart';
import 'package:meandworld/modules/localstorage/storage_util.dart';
import 'package:meandworld/modules/models/user.dart';
import 'package:meandworld/values/shared_preference_keys.dart';

class AuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try{
      print(await StorageUtil.getUser());
      GoogleSignInAccount? resp = await _googleSignIn.signIn();
      User user = new User(name: resp!.displayName,email: resp.email,googleId: resp.id,profileUrl: resp.photoUrl);
      StorageUtil.saveUser(user.toString());
      print(user.toString());
      return user;
    }catch(e){
      return null;
    }
  }
}
