import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jockes/data/models/joke_model.dart';
import 'package:jockes/main.dart';

import '../controllers/jokes_controller.dart';

class UIComponents {
  JokesController controller = Get.put(JokesController());
  Box<JokeModel> jokesBox = Hive.box<JokeModel>("jokes");
  Widget buildListViewItem(JokeModel joke, int position, bool isAllJokes) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 2),
                blurRadius: 2,
                spreadRadius: 2)
          ],
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.green),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "${joke.setup}\n${joke.punchline}",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          isAllJokes ? IconButton(
              onPressed: () {
                box.add(joke);
                //controller.changeFavourite(position);
              },
              icon: Icon(
                //!joke.isFavourite ? Icons.favorite_border :
                Icons.favorite,
                color: Colors.red,
              )):
          IconButton(
              onPressed: () {
                jokesBox.deleteAt(position);
              },
              icon: Icon(
                Icons.close,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
