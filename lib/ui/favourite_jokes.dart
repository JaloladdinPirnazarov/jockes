import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jockes/ui/ui_components.dart';

import '../data/models/joke_model.dart';

class FavouriteJokes extends StatelessWidget {
  //Box<JokeModel> jokesBox = Hive.box<JokeModel>("jokes");
  UIComponents components = UIComponents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<JokeModel>>(
        valueListenable: Hive.box<JokeModel>("jokes").listenable(),
        builder: (context, box, _) {
          return box.values.toList().length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: box.values.toList().length,
                  itemBuilder: (context, position) {
                    return components.buildListViewItem(
                        box.values.toList()[position], position, false,context);
                  })
              : Center(
                  child: Text(
                    "Joke has not been added yet",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                );
        },
      ),
    );
  }
}
