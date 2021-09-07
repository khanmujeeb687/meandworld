import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meandworld/modules/auth/login.dart';
import 'package:meandworld/modules/home/home_screen.dart';
import 'package:meandworld/modules/localstorage/storage_util.dart';
import 'package:meandworld/modules/navigation/navigation_util.dart';
import 'package:meandworld/modules/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool initialized=false;

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!initialized){
      initialized=true;
      Provider.of<ChatsProvider>(context,listen: false).init(context);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }


  init() async{
    print(await StorageUtil.getUser());
    bool isLoggedIn = (await StorageUtil.getUser())!=null;
    if(isLoggedIn){
      NavigationUtil.navigateTo(context, HomeScreen(),replace: true);
    }else{
      NavigationUtil.navigateTo(context, LoginScreen(),replace: true);
    }
  }
}
