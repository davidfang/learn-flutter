import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

///文档说明
///扑克demo

class CardHome extends StatefulWidget {
  const CardHome({super.key});
  static String routeName = '/CardHome';

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _randCards();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(CardHome oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Suit _suit = Suit.spades;
  CardValue _cardValue = CardValue.ace;

  // This style object overrides the styles for the suits, replacing the
  // image-based default implementation for the suit emblems with a text based
  // implementation.
  PlayingCardViewStyle myCardStyles = PlayingCardViewStyle(suitStyles: {
    Suit.spades: SuitStyle(
        builder: (context) => const FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "♠",
                style: TextStyle(
                  fontSize: 500,
                  color: Colors.black,
                ),
              ),
            ),
        style: const TextStyle(color: Colors.black)),
    Suit.hearts: SuitStyle(
        builder: (context) => const FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "♥",
                style: TextStyle(fontSize: 500, color: Colors.red),
              ),
            ),
        style: const TextStyle(color: Colors.red)),
    Suit.diamonds: SuitStyle(
        builder: (context) => const FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "♦",
                style: TextStyle(fontSize: 500, color: Colors.red),
              ),
            ),
        style: const TextStyle(color: Colors.red)),
    Suit.clubs: SuitStyle(
        builder: (context) => const FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "♣",
                style: TextStyle(fontSize: 500, color: Colors.black),
              ),
            ),
        style: const TextStyle(color: Colors.black)),
    Suit.joker: SuitStyle(builder: (context) => Container()),
  });
  final Set<Puke> _cards = {};

  Set<String> _point24 = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('扑克demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randCards,
        child: const Icon(Icons.flip),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Wrap(
                  // mainAxisSize: MainAxisSize.min,
                  children: _cards
                      .map((puke) => SizedBox(
                            height: 300,
                            child: PlayingCardView(
                                card: PlayingCard(Suit.values[puke.suit],
                                    CardValue.values[puke.value]),
                                style: myCardStyles),
                          ))
                      .toList()),
            ),
            Center(
              child: _point24.isEmpty
                  ? const Text('无法组合24点')
                  : Column(
                      children: _point24.toList().map((e) => Text(e)).toList(),
                    ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              DropdownButton<Suit>(
                  value: _suit,
                  items: Suit.values
                      .map((s) =>
                          DropdownMenuItem(value: s, child: Text(s.toString())))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _suit = val!;
                    });
                  }),
              DropdownButton<CardValue>(
                  value: _cardValue,
                  items: CardValue.values
                      .map((s) =>
                          DropdownMenuItem(value: s, child: Text(s.toString())))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _cardValue = val!;
                    });
                  }),
            ])
          ],
        ),
      ),
    );
  }

  void _randCards() {
    var random = Random();
    setState(() {
      _cards.clear();
      // _point24.clear();
      for (var i = 0; _cards.length < 4; i++) {
        _cards.add(Puke(random.nextInt(Suit.values.length - 1),
            random.nextInt(CardValue.values.length - 2)));
      }
      var abcd = _cards.map((e) => e.value).toList();
      // _point24 = _get24(abcd[0], abcd[1], abcd[2], abcd[3]);

      if (_point24.isNotEmpty) {
        print(_point24);
      }
    });
  }
}

class Puke {
  final int suit;
  final int value;

  Puke(this.suit, this.value);
}
