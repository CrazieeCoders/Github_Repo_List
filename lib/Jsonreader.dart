import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart'as http;

import 'Model/GitHubModel.dart';


class JsonReader{

  //Read JSON data

  static Future<List<Item>> readJson() async{

    List<Item> gitList ;

    final response = await http.Client().get("https://api.github.com/search/repositories?q=created:>2020-04-29&sort=stars&order=desc");

     if (response.statusCode == 200) {
   // Parsing JSON data to List
       gitList = parseResponse(response.body);
     } else {
       throw Exception();
     }

    return gitList;
  }

  static List<Item> parseResponse(String  response){

    final github  = githubFromJson(response);

    List<Item> list = github.items;

   return list;
  }


}