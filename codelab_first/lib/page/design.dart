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

  List<bool> _clicked = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
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
              _tab1(context),
              // const Icon(Icons.directions_car),
              Container(
                  width: 300,
                  height: 300,
                  color: Colors.yellow,
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: _clicked[0] ? 15 : 10,
                          right: 50,
                          child: InkWell(
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.red,
                            ),
                            onTap: () {
                              print('you clicked red');
                              setState(() {
                                _clicked[0] = !_clicked[0];
                              });
                            },
                          )),
                      Positioned(
                          bottom: _clicked[1] ? 15 : 10,
                          right: 30,
                          child: InkWell(
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.green,
                            ),
                            onTap: () {
                              print('you clicked green');
                              setState(() {
                                _clicked[1] = !_clicked[0];
                              });
                            },
                          )),
                      Positioned(
                          bottom: _clicked[2] ? 15 : 10,
                          right: 10,
                          child: InkWell(
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              print('you clicked blue');
                              setState(() {
                                _clicked[2] = !_clicked[0];
                              });
                            },
                          )),
                    ],
                  )),
              // const Icon(Icons.directions_bike),
              const Icon(Icons.directions_transit),
            ],
          ),
        ));
  }

  Center _tab1(BuildContext context) {
    return Center(
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
            child: const Text('显示SnackBar')));
  }
}
