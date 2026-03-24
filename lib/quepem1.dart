// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/QuepemHistoricalSitesinsidePage.dart';
import 'package:goatourism/naturalwonders.dart';
import 'package:goatourism/religiousplaces.dart';

void main() {
  runApp(Quepem1());
}

class Quepem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'mainItem': 'Historical Sites',
      'subtitle': 'Quepem',
      'locationIcon': Icons.location_on,
      'page': Quepemhistoric(),
    },
    {
      'mainItem': 'Religious Places',
      'subtitle': 'Quepem',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlaces(),
    },
    {
      'mainItem': 'Natural Wonders',
      'subtitle': 'Quepem',
      'locationIcon': Icons.location_on,
      'page': NaturalWondersPage(),
    },
    {
      'mainItem': 'Hotels & Restruant',
      'subtitle': 'Quepem',
      'locationIcon': Icons.location_on,
      'page': NaturalWondersPage(),
    },
    {
      'mainItem': 'Cafeterias',
      'subtitle': 'Quepem',
      'locationIcon': Icons.location_on,
      'page': NaturalWondersPage(),
    },
    {
      'mainItem': 'Picnic Spots',
      'subtitle': 'Quepem',
      'locationIcon': Icons.location_on,
      'page': NaturalWondersPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => items[index]['page']),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[400]!
                    : Colors.grey[850]!,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'lib/images/quepem${index + 1}.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 4),
                          Text(
                            items[index]['mainItem'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0, bottom: 4.0),
                        child: Row(
                          children: [
                            Icon(
                              items[index]['locationIcon'],
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              items[index]['subtitle'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
