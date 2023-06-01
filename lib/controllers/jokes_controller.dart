import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jockes/data/models/joke_model.dart';
import 'package:jockes/main.dart';
import 'package:jockes/services/api_service.dart';

class JokesController extends GetxController{

  JokesController(){
    getJokes();
  }

  var isLoading = false.obs;
  var jokes = <JokeModel>[].obs;
  Box<JokeModel> jokesBox = Hive.box<JokeModel>("jokes");

  Future<void>getJokes()async{
    changeLoading();
    jokesBox.values.where((element) => element.id == 0);
    jokes.value = await ApiService().getJokes();
    changeLoading();
  }

  Future<void>checkFavourite()async{
    for(int i = 0; i < jokes.length ; i++){
      var temp = jokesBox.values.where((element) => element.id == jokes[i].id).toList();
      jokes[i].isFavourite = temp.isNotEmpty ? true : false;
    }
    jokes.refresh();
  }

  Future<void> changeFavourite(int id)async{
    var joke = jokes.where((element) => element.id == id).toList()[0];
    if(joke.isFavourite){
      var tempList = jokesBox.values.toList();
      tempList.removeWhere((item) => item.id == id);
      jokesBox.clear();
      jokesBox.addAll(tempList);
    }else{
      box.add(joke);
    }
    jokes.where((element) => element.id == id).toList()[0].isFavourite = !joke.isFavourite;
    jokes.refresh();
  }

  void changeLoading(){
    isLoading.value = !isLoading.value;
  }


}