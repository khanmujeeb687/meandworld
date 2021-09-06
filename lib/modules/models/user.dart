import 'package:meandworld/modules/models/Websites.dart';

class User{
  String? name;
  String? username;
  String? profileUrl;
  String? id;
  List<Websites>? websites;
  bool? hiddenProfile;
  List<String>? interests;
  List<String>? languages;
  String? profession;
  String? bio;
  String? country;
  List<String>? connections;
  String? privateKey;
  String? publicKey;


  User.fromJson(Map<String, dynamic> data){
    name= data['name'];
    username= data['username'];
    profileUrl= data['profile_url'];
    id= data['id'];
    websites= data['websites'];
    hiddenProfile= data['hiddenProfile'];
    interests= data['interests'];
    languages= data['languages'];
    profession= data['profession'];
    bio= data['bio'];
    country= data['country'];
    connections= data['connections'];
    privateKey= data['privateKey'];
    publicKey= data['publicKey'];
  }
}