import 'package:flutter/material.dart';

/// https://flutter.cn/docs/cookbook/animation/page-route-animation
class AnimatePage extends StatelessWidget {
  const AnimatePage({super.key});
  static String routeName = '/AnimatePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画页面'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
            child: const Text('go')),
      ),
    );
  }
}

Route<Object?> _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AnimatePage2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );
        return SlideTransition(
          // position: offsetAnimation,
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}

class AnimatePage2 extends StatelessWidget {
  const AnimatePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatePage2'),
      ),
      body: const Center(
        child: Text('AnimatePage2'),
      ),
    );
  }
}
