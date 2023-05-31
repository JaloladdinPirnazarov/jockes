import 'package:get/get.dart';
import 'package:jockes/data/models/joke_model.dart';
import 'package:jockes/services/api_service.dart';

class JokesController extends GetxController{

  JokesController(){
    getJokes();
  }

  var isLoading = false.obs;
  var jokes = <JokeModel>[].obs;

  Future<void>getJokes()async{
    changeLoading();
    jokes.value = await ApiService().getJokes();
    print("jokesLength: ${jokes.value.length}");
    changeLoading();
  }

  void changeLoading(){
    isLoading.value = !isLoading.value;
  }


}