import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jockes/data/models/joke_model.dart';

import '../controllers/jokes_controller.dart';

class UIComponents {
  Widget buildListViewItem(JokeModel joke) {
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
      child: Column(
        children: [
          Wrap(
            children: [
              Text(
                "${joke.setup}\n${joke.punchline}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
