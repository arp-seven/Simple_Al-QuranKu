import 'dart:convert';

import 'package:alquran_app/app/modules/data/models/ayat.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah/114/1");
  var res = await http.get(url);

  Map<String, dynamic> data =
      (json.decode(res.body) as Map<String, dynamic>)["data"];
  Map<String, dynamic> dataToModel = {
    "number": data["number"],
    "meta": data["meta"],
    "text": data["text"],
    "translation": data["translation"],
    "audio": data["audio"],
    "tafsir": data["tafsir"],


  };

  // COnvert map -> Model AYat
  Ayat ayat = Ayat.fromJson(dataToModel);
  print(ayat);
  
}
