import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meandworld/modules/auth/login_button.dart';
import 'package:meandworld/values/lottie_urls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LoginButton(),
            ],
          ),
        )
    );
  }



}
