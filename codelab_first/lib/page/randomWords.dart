import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app.dart';

class RandomWordsPage extends StatefulWidget {
  const RandomWordsPage({super.key});
  static String routeName = '/randomWords';

  @override
  State<RandomWordsPage> createState() => _RandomWordsPageState();
}

class _RandomWordsPageState extends State<RandomWordsPage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // return LayoutBuilder(builder: (context, constraints) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Words")),
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              // extended: constraints.maxWidth >= 600,
              selectedIndex: selectedIndex,
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text("home")),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite), label: Text("收藏"))
              ],
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
              child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page))
        ],
      ),
    );
    // });
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  static String routeName = "/randomWords/generator";

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_outline;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon: Icon(icon),
                label: Text('收藏'),
                onPressed: () => appState.toggleFavorite(),
              ),
              ElevatedButton(
                  onPressed: () => appState.getNext(),
                  child: const Text('下一个')),
            ],
          )
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asLowerCase),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('目前没有收藏'),
      );
    }
    return Material(
        elevation: 16.0,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('我的${appState.favorites.length}个收藏：'),
            ),
            for (var favorite in appState.favorites)
              ListTile(
                  leading: const Icon(Icons.favorite),
                  title: Text(favorite.asLowerCase)),
          ],
        ));
  }
}
