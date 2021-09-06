import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        body: Container(
      alignment: Alignment.center,
      child: Lottie.network(LottieUrls.LOGIN_BG,animate: true)
    ));
  }
}
