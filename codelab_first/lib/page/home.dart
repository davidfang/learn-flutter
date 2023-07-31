import 'package:flutter/material.dart';

import 'animation/animate_page.dart';
import 'animation/animated_container.dart';
import 'animation/opacity_animation.dart';
import 'animation/physics_simulation.dart';
import 'card_home.dart';
import 'design.dart';
import 'effects/download_button.dart';
import 'effects/instagram_filter_selection.dart';
import 'forms/form_validation.dart';
import 'list/floating_app_bar.dart';
import 'list/mixed_list.dart';
import 'navigation/todos_list.dart';
import 'randomWords.dart';
import 'template/demo.dart';

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
            _gridItem(context, "randomWords", RandomWordsPage.routeName,
                description: '随机生成英文字符'),
            _gridItem(context, '动画页面', AnimatePage.routeName,
                description: '为页面切换加入动画效果'),
            _gridItem(context, '物理模拟动画效果', PhysicsCardDragDemo.routeName,
                description: 'Widget 的物理模拟动画效果'),
            _gridItem(
                context, 'Container 里的动画渐变效果', AnimatedContainerApp.routeName,
                description: 'Container 里的动画渐变效果'),
            _gridItem(context, 'Widget 的淡入淡出效果', OpacityAnimation.routeName,
                description: 'Widget 的淡入淡出效果'),
            _gridItem(context, '简单设计', Design.routeName, description: '简单设计'),
            _gridItem(context, '扑克demo', CardHome.routeName,
                description: '简单展示一个扑克'),
            _gridItem(context, '创建一个带进度条的下载按钮', DownloadButtonPage.routeName,
                description: '创建一个带进度条的下载按钮'),
            _gridItem(
                context, '创建一个照片滤镜选择器', InstagramFilterSelection.routeName,
                description: '创建一个照片滤镜选择器'),
            _gridItem(context, '带验证表单', FormValidation.routeName,
                description: '构建一个有验证判断的表单'),
            _gridItem(context, '不同列表项的列表', MixedList.routeName,
                description: '创建拥有不同列表项的列表'),
            _gridItem(context, '在列表顶部放置一个浮动的 app bar', FloatingAppBar.routeName,
                description: '在列表顶部放置一个浮动的 app bar'),
            _gridItem(context, '模板demo', TemplateDemo.routeName,
                description: '模板demo'),
            _gridItem(context, 'Todo List', TodosList.routeName,
                description: 'Todo List 传递数据到新页面'),
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
