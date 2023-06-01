import 'package:get/get.dart';

class Messages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'uz_UZ':{
      'jokes':'Hazillar',
      'all':'Hammasi',
      'favourite':'Sevimli',
      'close':'Yopish',
      'joke_info':'Hazil Haqida',
      'type':'Tip',
      'setup':'Savol',
      'punchline':'Javob',
      'added':"Ko'shildi",
      'deleted':"O'chirildi",
    },
    'ru_RU':{
      'jokes':'Шутки',
      'all':'Все',
      'favourite':'Избранные',
      'close':'Закрыть',
      'joke_info':'О шутке',
      'type':'Тип',
      'setup':'Контекст',
      'punchline':'Концовка',
      'added':'Добавлено',
      'deleted':"Удалено",
    },

    'us_US':{
      'jokes':'Jokes',
      'all':'All',
      'favourite':'Favourite',
      'close':'Close',
      'joke_info':'Joke Info',
      'type':'Type',
      'setup':'Setup',
      'punchline':'Punchline',
      'added':'Added',
      'deleted':"Deleted",
    },
  };

}