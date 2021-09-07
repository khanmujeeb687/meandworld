import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:meandworld/modules/auth/auth_service.dart';
import 'package:meandworld/modules/home/home_screen.dart';
import 'package:meandworld/modules/navigation/navigation_util.dart';
import 'package:meandworld/modules/providers/chat_provider.dart';
import 'package:provider/provider.dart';


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
    var resp = await authService.signInWithGoogle();
    if(resp!=null){
      Provider.of<ChatsProvider>(context,listen: false).init(context);
      NavigationUtil.navigateTo(context, HomeScreen(),replace: true);
    }
  }
}
