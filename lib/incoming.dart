import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<String> title = [];

class Ayah {
  final String text;
  //final String translation;
//final String sound;
  //final String ref;

  Ayah({this.text}); //this.translation, this.sound, this.ref});

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(text: json['text']);
    //translation: json['translation'],
    //sound: json['sound'],
    //ref: json['ref']);
  }
}

// A function that converts a response body into a List<Photo>.
List<Ayah> parseAyahs(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  List<Ayah> mylist = parsed.map<Ayah>((json) => Ayah.fromJson(json)).toList();
  print('this is here:');
  for (int i = 0; i < parsed.length; i++) {
    print(parsed[i]);
    title.add(parsed[i]['ref']);
  }
  return mylist;
}

Future<List<Ayah>> fetchAyahs(http.Client client) async {
  final response =
      await client.get('http://192.168.0.106:5000/api?Query=recipe+for+pankakes');

  // return compute(parseAyahs, response.body);
  return parseAyahs(response.body);
}
