import 'package:codelab_first/page/animation/animate_page.dart';
import 'package:codelab_first/page/animation/animated_container.dart';
import 'package:codelab_first/page/animation/physics_simulation.dart';

import '../page/animation/opacity_animation.dart';
import '../page/card_home.dart';
import '../page/design.dart';
import '../page/home.dart';

import '../page/randomWords.dart';

var route = {
  '/': (context) => const HomePage(),
  RandomWordsPage.routeName: (context) => const RandomWordsPage(),
  AnimatePage.routeName: (context) => const AnimatePage(),
  PhysicsCardDragDemo.routeName: (context) => const PhysicsCardDragDemo(),
  AnimatedContainerApp.routeName: (context) => const AnimatedContainerApp(),
  OpacityAnimation.routeName: (context) => const OpacityAnimation(),
  Design.routeName: (context) => const Design(),
  CardHome.routeName: (context) => const CardHome(),
};
