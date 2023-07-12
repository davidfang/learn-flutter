import 'dart:math';

import 'package:flutter/material.dart';

///文档说明
///

class AnimatedContainerApp extends StatefulWidget {
  static String routName = '/animation/animated_container';

  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // @override
  // void didUpdateWidget(AnimatedContainer oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container 里的动画渐变效果'),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: _width,
        height: _height,
        decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        curve: Curves.fastOutSlowIn,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
