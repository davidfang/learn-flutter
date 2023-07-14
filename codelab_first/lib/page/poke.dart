import 'package:flutter/material.dart';

///文档说明
///poke

class PokePage extends StatefulWidget {
  static String routName = '/PokePage';

  @override
  _PokePageState createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
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
  void didUpdateWidget(PokePage oldWidget) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke'),
      ),
    );
  }
}
