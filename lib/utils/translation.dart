import 'package:get/get.dart';

class Messages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'uz_UZ':{
      'jokes':'Hazillar',
      'all':'Hammasi',
      'favourite':'Sevimli'
    },
    'en_EN':{
      'jokes':'Jokes',
      'all':'All',
      'favourite':'Favourite'
    },
    'ru_RU':{
      'jokes':'Шутки',
      'all':'Все',
      'favourite':'Избранные'
    }
  };

}