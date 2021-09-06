import 'dart:convert';

import 'package:meandworld/modules/models/user.dart';
import 'package:meandworld/values/shared_preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {

  static SharedPreferences? sharedPreferences;


  static Future<SharedPreferences> getInstance() async{
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    return Future.value(sharedPreferences);
  }



  static getLoggedInUser() async {
    var user = await getMap(SharedPreferenceKeys.USER);
    if(user!=null){
     return User.fromJson(user);
    }
  }


   static getMap(String key) async {
    SharedPreferences pref = await getInstance();
    String? resp = pref.getString(key);
    if(resp!=null){
      return json.decode(resp);
    }
    return null;
  }

}