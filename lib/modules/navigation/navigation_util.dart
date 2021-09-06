import 'package:flutter/material.dart';

class NavigationUtil {
  static navigateTo(BuildContext context, Widget destination,{bool replace=false}) async {
    if(replace){
      return await Navigator.pushReplacement(context, new MaterialPageRoute(builder: (_) {
        return destination;
      }));
    }
    return await Navigator.push(context, new MaterialPageRoute(builder: (_) {
      return destination;
    }));
  }
}
