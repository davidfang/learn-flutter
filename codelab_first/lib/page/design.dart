import 'package:flutter/material.dart';

///文档说明
///简单的设计功能

class Design extends StatefulWidget {
  const Design({super.key});
  static String routeName = '/Design';

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
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
  void didUpdateWidget(Design oldWidget) {
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
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('简单设计'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(icon: Icon(Icons.directions_boat))
            ]),
          ),
          drawer: Drawer(
              child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.greenAccent),
                child: Text('抽屉菜单'),
              ),
              ListTile(
                title: const Text('菜单1 关闭'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('菜单2 关闭'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
          body: TabBarView(
            children: [
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('这是一个SnackBar'),
                          showCloseIcon: true,
                          action: SnackBarAction(
                              label: 'label',
                              onPressed: () {
                                print('object');
                              }),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text('显示SnackBar'))),
              // const Icon(Icons.directions_car),
              const Icon(Icons.directions_bike),
              const Icon(Icons.directions_transit),
            ],
          ),
        ));
  }
}
