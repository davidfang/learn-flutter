import 'package:codelab_first/page/animation/animate_page.dart';
import 'package:codelab_first/page/animation/animated_container.dart';
import 'package:codelab_first/page/animation/physics_simulation.dart';

import '../page/animation/opacity_animation.dart';
import '../page/card_home.dart';
import '../page/design.dart';
import '../page/effects/download_button.dart';
import '../page/effects/instagram_filter_selection.dart';
import '../page/forms/form_validation.dart';
import '../page/home.dart';

import '../page/list/floating_app_bar.dart';
import '../page/list/mixed_list.dart';
import '../page/randomWords.dart';
import '../page/template/demo.dart';

var route = {
  '/': (context) => const HomePage(),
  RandomWordsPage.routeName: (context) => const RandomWordsPage(),
  AnimatePage.routeName: (context) => const AnimatePage(),
  PhysicsCardDragDemo.routeName: (context) => const PhysicsCardDragDemo(),
  AnimatedContainerApp.routeName: (context) => const AnimatedContainerApp(),
  OpacityAnimation.routeName: (context) => const OpacityAnimation(),
  Design.routeName: (context) => const Design(),
  CardHome.routeName: (context) => const CardHome(),
  DownloadButtonPage.routeName: (context) => const DownloadButtonPage(),
  InstagramFilterSelection.routeName: (context) =>
      const InstagramFilterSelection(),
  FormValidation.routeName: (context) => const FormValidation(),
  MixedList.routeName: (context) => const MixedList(),
  FloatingAppBar.routeName: (context) => const FloatingAppBar(),
  TemplateDemo.routeName: (context) => const TemplateDemo(),
};
