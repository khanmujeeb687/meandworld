import 'package:flutter/material.dart';
import 'package:meandworld/modules/auth/login.dart';
import 'package:meandworld/modules/home/home_screen.dart';
import 'package:meandworld/modules/localstorage/storage_util.dart';
import 'package:meandworld/modules/navigation/navigation_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }


  init() async{
    bool isLoggedIn = (await StorageUtil.getLoggedInUser())!=null;
    if(isLoggedIn){
      NavigationUtil.navigateTo(context, HomeScreen(),replace: true);
    }else{
      NavigationUtil.navigateTo(context, LoginScreen(),replace: true);
    }
  }
}
