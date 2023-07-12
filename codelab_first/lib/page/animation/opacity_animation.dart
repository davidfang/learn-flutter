import 'package:flutter/material.dart';

///文档说明
///
///https://flutter.cn/docs/cookbook/animation/opacity-animation

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({super.key});
  static String routeName = '/animation/opacity_animation';

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
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

  @override
  void didUpdateWidget(OpacityAnimation oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget 的淡入淡出效果'),
      ),
      
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 100,
            height: 100,
            // color: Colors.green,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.blue),
            // clipBehavior: Clip.antiAlias,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: '切换',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
