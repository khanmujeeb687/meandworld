import 'package:meandworld/modules/models/Websites.dart';

class User {
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
  String? googleId;
  String? email;

  User.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    username = data['username'];
    profileUrl = data['profile_url'];
    id = data['id'];
    websites = data['websites'];
    hiddenProfile = data['hiddenProfile'];
    interests = data['interests'];
    languages = data['languages'];
    profession = data['profession'];
    bio = data['bio'];
    country = data['country'];
    connections = data['connections'];
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
}
