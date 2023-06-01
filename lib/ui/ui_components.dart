import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jockes/data/models/joke_model.dart';

import '../controllers/jokes_controller.dart';

class UIComponents {
  JokesController controller = Get.put(JokesController());
  Box<JokeModel> jokesBox = Hive.box<JokeModel>("jokes");

  Widget buildListViewItem(
      JokeModel joke, int position, bool isAllJokes, BuildContext context) {
    return InkWell(
      onTap: () {
        jokeInfoAlert(joke, context);
      },
      child: Container(
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
            isAllJokes
                ? IconButton(
                    onPressed: () {
                      var temp = jokesBox.values
                          .where((element) => element.id == joke.id)
                          .toList();
                      if (temp.isEmpty) {
                        jokesBox.add(joke);
                        showSimpleSnackBar(context, 'added');
                      }
                      //controller.changeFavourite(position);
                    },
                    icon: Icon(
                      //!joke.isFavourite ? Icons.favorite_border :
                      Icons.favorite,
                      color: Colors.red,
                    ))
                : IconButton(
                    onPressed: () {
                      jokesBox.deleteAt(position);
                      showSimpleSnackBar(context, 'deleted');
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ))
          ],
        ),
      ),
    );
  }

  void jokeInfoAlert(JokeModel jokeModel, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("joke_info".tr),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${'setup'.tr}: ${jokeModel.setup}",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${'punchline'.tr}: ${jokeModel.punchline}",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Divider(
                    height: 40,
                    thickness: 2,
                  ),
                  Text(
                    "${'type'.tr}: ${jokeModel.type}",
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  Text(
                    "ID: ${jokeModel.id}",
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("close".tr))
              ],
            ));
  }

  void showSimpleSnackBar(BuildContext context, String key) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(key.tr),
      ),
    );
  }
}
