import 'package:meandworld/modules/models/Websites.dart';

class User {
  String? name;

  @override
  String toString() {
    String minterests='';
    String mlanguages='';
    String mconnections='';
    String? mwebsites ='';
    minterests = interests==null ? "": interests!.join('|');
    mlanguages = languages==null ? "": languages!.join('|');
    mconnections = connections==null ? "": connections!.join('|');
    mwebsites =  getWebsites();

    return '{"name": "$name", "username": "$username", "profileUrl": "$profileUrl", "id": "$id", "websites": "$mwebsites", "hiddenProfile": "$hiddenProfile", "interests": "$minterests", "languages": "$mlanguages", "profession": "$profession", "bio": "$bio", "country": "$country", "connections": "$mconnections", "privateKey": "$privateKey", "publicKey": "$publicKey", "googleId": "$googleId", "email": "$email"}';
  }

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
  String? googleId;
  String? email;

  User.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    username = data['username'];
    profileUrl = data['profile_url'];
    id = data['id'];
    websites = Websites.fromString(data['websites']);
    hiddenProfile = data['hiddenProfile']=="true";
    interests = data['interests'].split('|');
    languages = data['languages'].split('|');
    profession = data['profession'];
    bio = data['bio'];
    country = data['country'];
    connections = data['connections'].split('|');
    privateKey = data['privateKey'];
    publicKey = data['publicKey'];
    googleId = data['googleId'];
    email = data['email'];
  }

  User(
      {this.name,
      this.username,
      this.profileUrl,
      this.id,
      this.websites,
      this.hiddenProfile,
      this.interests,
      this.languages,
      this.profession,
      this.bio,
      this.country,
      this.connections,
      this.privateKey,
      this.publicKey,
        this.email,
      this.googleId});


  getWebsites(){
    if(websites==null || websites=='' || websites=='null') return null;
    String s = '';
    for(int i=0;i<websites!.length;i++){
      s=s+'|'+websites![i].toString();
    }
    return s.substring(1);
  }

  toJson(){
    Map<String, dynamic> data ={};
    data['name'] = this.name;
    data['username'] = this.username;
    data['profileUrl'] = this.profileUrl;
    data['id'] = this.id;
    data['websites'] = getWebsites();
    data['hiddenProfile'] = this.hiddenProfile;
    data['interests'] = interests;
    data['languages'] = this.languages;
    data['profession'] = this.profession;
    data['bio'] = this.bio;
    data['country'] = this.country;
    data['connections'] = this.connections;
    data['privateKey'] = this.privateKey;
    data['publicKey'] = this.publicKey;
    data['email'] = this.email;
    data['googleId'] = this.googleId;
    return data;
  }
}
