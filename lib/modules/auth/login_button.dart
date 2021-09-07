import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:meandworld/modules/auth/auth_service.dart';


class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  AuthService authService=new AuthService();

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      text: "Sign up with Google",
      onPressed: onPress,
    );
  }

  onPress() async{
    authService.signInWithGoogle();
  }
}
