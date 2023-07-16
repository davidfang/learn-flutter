import 'package:flutter/material.dart';

///文档说明
///创建拥有不同列表项的列表

class MixedList extends StatefulWidget {
  const MixedList({super.key});
  static String routeName = '/list/MixedList';

  @override
  State<MixedList> createState() => _MixedListState();
}

class _MixedListState extends State<MixedList> {
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
  void didUpdateWidget(MixedList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  final List<ListItem> items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? HeadItem("Head $i")
          : MessageItem("sender $i", "Message body内容 $i"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('创建拥有不同列表项的列表'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                  title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context));
            }));
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadItem implements ListItem {
  final String heading;

  HeadItem(this.heading);
  @override
  Widget buildSubtitle(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
  }
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
  @override
  Widget buildSubtitle(BuildContext context) => Text(body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);
}
