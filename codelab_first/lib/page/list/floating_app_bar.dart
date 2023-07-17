import 'package:flutter/material.dart';

///文档说明
///在列表顶部放置一个浮动的 app bar

class FloatingAppBar extends StatefulWidget {
  const FloatingAppBar({super.key});
  static String routeName = '/list/FloatingAppBar';

  @override
  State<FloatingAppBar> createState() => _FloatingAppBarState();
}

class _FloatingAppBarState extends State<FloatingAppBar> {
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
  void didUpdateWidget(FloatingAppBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(1000, (index) => "Item $index");
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('在列表顶部放置一个浮动的 app bar'),
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(background:Image(image:NetworkImage('https://picsum.photos/250?image=9'),fit: BoxFit.cover,) ,) ,
                  expandedHeight: 200,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                            title: Text("Item $index"),
                          ),
                      childCount: 1000),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(items[index]));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
