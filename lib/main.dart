import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jockes/data/models/joke_model.dart';
import 'package:jockes/ui/all_jokes.dart';
import 'package:jockes/ui/favourite_jokes.dart';
import 'package:jockes/utils/translation.dart';

late Box langBox;
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<JokeModel>(JokeModelAdapter());
  await Hive.openBox<JokeModel>("jokes");
  await Hive.openBox("translation");
  langBox = Hive.box("translation");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double flagsSize = 20;
    var country = langBox.get("country") ?? "UZ";
    var lang = langBox.get("language")??"uz";
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale(lang,country),
      fallbackLocale: Locale(lang,country),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                text: "all".tr,
              ),
              Tab(
                text: "favourite".tr,
              ),
            ]),
            title: Text("jokes".tr),
            actions: [
              PopupMenuButton(
                  child: Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            onTap: () {
                              Get.updateLocale(Locale('uz', 'UZ'));
                              langBox.put("country", "UZ");
                              langBox.put("language", "uz");
                            },
                            child: Row(
                              children: [
                                CountryFlag.fromCountryCode(
                                  'uz',
                                  width: flagsSize,
                                  height: flagsSize,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("O'zbekcha")
                              ],
                            )),
                        PopupMenuItem(
                            onTap: () {
                              Get.updateLocale(Locale('ru', 'RU'));
                              langBox.put("country", "RU");
                              langBox.put("language", "ru");
                            },
                            child: Row(
                              children: [
                                CountryFlag.fromCountryCode(
                                  'ru',
                                  width: flagsSize,
                                  height: flagsSize,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Руский")
                              ],
                            )),
                        PopupMenuItem(
                            onTap: () {
                              Get.updateLocale(Locale('us', 'US'));
                              langBox.put("country", "US");
                              langBox.put("language", "us");
                              print("us");
                            },
                            child: Row(
                              children: [
                                CountryFlag.fromCountryCode(
                                  'us',
                                  width: flagsSize,
                                  height: flagsSize,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("English")
                              ],
                            )),
                      ]),
              SizedBox(
                width: 10,
              ),
            ],
            centerTitle: true,
          ),
          body: TabBarView(
            children: [AllJokes(), FavouriteJokes()],
          ),
        ),
      ),
    );
  }
}
