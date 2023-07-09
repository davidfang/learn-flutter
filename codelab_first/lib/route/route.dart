import '../page/home.dart';

import '../page/randomWords.dart';

var route = {
  '/': (context) => HomePage(),
  RandomWordsPage.routeName: (context) => RandomWordsPage(),
};
