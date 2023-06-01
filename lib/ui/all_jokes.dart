import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jockes/controllers/jokes_controller.dart';
import 'package:jockes/ui/ui_components.dart';

class AllJokes extends StatelessWidget {
  const AllJokes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    JokesController controller = Get.put(JokesController());
    UIComponents components = UIComponents();

    return Scaffold(
      body: Obx((){
        if(controller.isLoading.value){
          return const Center(child: CircularProgressIndicator());
        }

        else{
          return RefreshIndicator(
            onRefresh: controller.getJokes,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.jokes.value.length,
                itemBuilder: (context, position){
                  return components.buildListViewItem(controller.jokes[position],position,true,context);
                }),
          );
        }
      }),
    );
  }
}
