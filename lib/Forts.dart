// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/forts/fort1.dart';
import 'package:goatourism/forts/fort10.dart';
import 'package:goatourism/forts/fort11.dart';
import 'package:goatourism/forts/fort2.dart';
import 'package:goatourism/forts/fort3.dart';
import 'package:goatourism/forts/fort4.dart';
import 'package:goatourism/forts/fort5.dart';
import 'package:goatourism/forts/fort6.dart';
import 'package:goatourism/forts/fort7.dart';
import 'package:goatourism/forts/fort8.dart';
import 'package:goatourism/forts/fort9.dart';

void main() {
  runApp(Fort());
}

class Fort extends StatelessWidget {
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
      'mainItem': 'Fort Aguada',
      'subtitle': 'Candolim',
      'locationIcon': Icons.location_on,
      'page': fort1(),
    },
    {
      'mainItem': 'Chapora Fort',
      'subtitle': 'Anjuna',
      'locationIcon': Icons.location_on,
      'page': fort2(),
    },
    {
      'mainItem': 'Tiracol Fort',
      'subtitle': 'Querim',
      'locationIcon': Icons.location_on,
      'page': fort3(),
    },
    {
      'mainItem': 'Reis Magos Fort',
      'subtitle': 'Nerul',
      'locationIcon': Icons.location_on,
      'page': fort4(),
    },
    {
      'mainItem': 'Corjuem Fort',
      'subtitle': 'Aldona',
      'locationIcon': Icons.location_on,
      'page': fort5(),
    },
    {
      'mainItem': 'Cabo de Rama Fort',
      'subtitle': 'Canacona',
      'locationIcon': Icons.location_on,
      'page': fort6(),
    },
    {
      'mainItem': 'Mormugao Fort,',
      'subtitle': 'Mormugao',
      'locationIcon': Icons.location_on,
      'page': fort7(),
    },
    {
      'mainItem': 'Sinquerim Fort',
      'subtitle': 'Candolim',
      'locationIcon': Icons.location_on,
      'page': fort8(),
    },
    {
      'mainItem': 'Rachol Fort',
      'subtitle': 'Rachol',
      'locationIcon': Icons.location_on,
      'page': fort9(),
    },
    {
      'mainItem': 'Nanuz Fort',
      'subtitle': 'Sattari',
      'locationIcon': Icons.location_on,
      'page': fort10(),
    },
    {
      'mainItem': 'St. Estevam Fort',
      'subtitle': 'St. Estevam island',
      'locationIcon': Icons.location_on,
      'page': fort11(),
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
                      'lib/images/Fort${index + 1.0}.jpg',
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
