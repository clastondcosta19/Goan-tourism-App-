// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/Beaches/beach1.dart';
import 'package:goatourism/Beaches/beach10.dart';
import 'package:goatourism/Beaches/beach11.dart';
import 'package:goatourism/Beaches/beach13.dart';
import 'package:goatourism/Beaches/beach14.dart';
import 'package:goatourism/Beaches/beach15.dart';
import 'package:goatourism/Beaches/beach16.dart';
import 'package:goatourism/Beaches/beach17.dart';
import 'package:goatourism/Beaches/beach19.dart';
import 'package:goatourism/Beaches/beach2.dart';
import 'package:goatourism/Beaches/beach20.dart';
import 'package:goatourism/Beaches/beach3.dart';
import 'package:goatourism/Beaches/beach7.dart';

void main() {
  runApp(BeachesNorth());
}

class BeachesNorth extends StatelessWidget {
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
      'mainItem': 'Baga Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage1(),
    },
    {
      'mainItem': 'Arambol Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage2(),
    },
    {
      'mainItem': 'Candolim Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage3(),
    },
    {
      'mainItem': 'Morjim Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage7(),
    },
    {
      'mainItem': 'Mandrem Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage10(),
    },
    {
      'mainItem': 'Vagator Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Calangute Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage13(),
    },
    {
      'mainItem': 'Ashwem Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage14(),
    },
    {
      'mainItem': 'Sinquerim Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage15(),
    },
    {
      'mainItem': 'Anjuna Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage16(),
    },
    {
      'mainItem': 'Dona Paula Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage17(),
    },
    {
      'mainItem': 'Keri Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage19(),
    },
    {
      'mainItem': 'Miramar Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage20(),
    },
    {
      'mainItem': 'Patnem - Colomb Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage20(),
    },
    {
      'mainItem': 'Ozran Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage20(),
    },
    {
      'mainItem': 'Chapora Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage20(),
    },
    {
      'mainItem': 'Kerim Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage20(),
    },
    {
      'mainItem': 'Odxel Beach',
      'subtitle': 'BeachesNorth',
      'locationIcon': Icons.location_on,
      'page': BeachPage20(),
    },
    // Add other items with respective pages
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
                      'lib/images/beachs${index + 1.0}.jpg',
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
