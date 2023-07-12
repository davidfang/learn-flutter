import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/homePage';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          childAspectRatio: 2 / 1,
          children: <Widget>[
            _gridItem(context, "randomWords", '/randomWords',
                description: '随机生成英文字符'),
            _gridItem(context, '动画页面', '/animation/AnimatePage',
                description: '为页面切换加入动画效果'),
            _gridItem(context, '物理模拟动画效果', '/animation/PhysicsCardDragDemo',
                description: 'Widget 的物理模拟动画效果'),
            _gridItem(
                context, 'Container 里的动画渐变效果', '/animation/animated_container',
                description: 'Container 里的动画渐变效果')
          ],
        ));
  }

  Widget _gridItem(BuildContext context, String title, String route,
      {Object? args, String? description}) {
    return Card(
        clipBehavior: Clip.hardEdge,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(route, arguments: args);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[600],
            child: Column(
              children: [
                Text(
                  title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                if (description != null)
                  Text(description,
                      maxLines: 2, style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          ),
        ));
  }
}
