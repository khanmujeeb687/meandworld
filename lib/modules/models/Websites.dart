import 'dart:convert';

class Websites{
  String? name;
  String? url;


  Websites({this.name,this.url});

  @override
  String toString() {
    return '{"name": "$name", "url": "$url"}';
  }

  static fromString(String? data){
    if(data==null || data =='null' || data == '') return null;
    List<Websites> d1=[];
    data.split('|').forEach((element){
      var resp = json.decode(element);
      Websites websites = new Websites(name: resp['name'],url: resp['url']);
      d1.add(websites);
    });
    return d1;
  }
}