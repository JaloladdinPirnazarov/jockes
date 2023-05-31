import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jockes/data/models/joke_model.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<List<JokeModel>> getJokes()async{
    Dio dio = Dio();
    //var response = await dio.get("https://official-joke-api.appspot.com/jokes/ten");
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/ten"));
    print("response: ${response.body}");
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      final jokes = json.map((e)=>JokeModel.fromJson(e)).toList();
      print("in api service: ${jokes.length}");
      return jokes;
    }
    return <JokeModel>[];
  }
}