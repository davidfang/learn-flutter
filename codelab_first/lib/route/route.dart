import 'package:codelab_first/page/animation/animate_page.dart';
import 'package:codelab_first/page/animation/animated_container.dart';
import 'package:codelab_first/page/animation/physics_simulation.dart';

import '../page/home.dart';

import '../page/randomWords.dart';

var route = {
  '/': (context) => const HomePage(),
  RandomWordsPage.routeName: (context) => const RandomWordsPage(),
  AnimatePage.routeName: (context) => const AnimatePage(),
  PhysicsCardDragDemo.routName: (context) => const PhysicsCardDragDemo(),
  AnimatedContainerApp.routName: (context) => const AnimatedContainerApp(),
};
