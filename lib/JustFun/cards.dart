import 'package:flutter/material.dart';

class Cards {
  String name;
  String city;

  Cards({this.name, this.city});
}

class QuoteCard extends StatelessWidget {
  final Cards cards;
  final Function delete;

  QuoteCard({this.cards, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(cards.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Text(cards.city),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              FlatButton.icon(
                  onPressed: delete,
                  label: Text('Delete'),
                  icon: Icon(Icons.account_box))
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Cards> cards = [
    Cards(name: 'Juan', city: 'Bodota'),
    Cards(name: 'Juan', city: 'Pedro'),
    Cards(name: 'Juan', city: 'Pedro'),
    Cards(name: 'Juan', city: 'Pedro'),
    Cards(name: 'Juan', city: 'Pedro'),
    Cards(name: 'Juan', city: 'Pedro'),
    Cards(name: 'Juan', city: 'Pedro'),
    Cards(name: 'Juan', city: 'Pedro'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: cards
            .map((card) => QuoteCard(
                cards: card,
                delete: () {
                  setState(() {
                    cards.remove(card);
                  });
                }))
            .toList(),
      ),
    );
  }
}
