import 'package:google_sign_in/google_sign_in.dart';
import 'package:meandworld/modules/models/user.dart';

class AuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      GoogleSignInAccount? resp = await _googleSignIn.signIn();
      User user = new User(name: resp!.displayName,email: resp.email,googleId: resp.id,profileUrl: resp.photoUrl);
      // TODO save user here
      return user;
    } catch (error) {
      print(error);
    }
  }
}
