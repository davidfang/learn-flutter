import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/homePage';
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
          ],
        ));
  }

  Widget _gridItem(BuildContext context, String title, String route,
      {Object? args, String? description}) {
    return Card(
      
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
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (description != null)
              Text(description, style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
      ),
    ));
  }
}
