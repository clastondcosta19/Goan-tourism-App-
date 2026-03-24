// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/farms/farm1.dart';
import 'package:goatourism/farms/farm10.dart';
import 'package:goatourism/farms/farm11.dart';
import 'package:goatourism/farms/farm2.dart';
import 'package:goatourism/farms/farm3.dart';
import 'package:goatourism/farms/farm4.dart';
import 'package:goatourism/farms/farm5.dart';
import 'package:goatourism/farms/farm6.dart';
import 'package:goatourism/farms/farm7.dart';
import 'package:goatourism/farms/farm8.dart';
import 'package:goatourism/farms/farm9.dart';


void main() {
  runApp(Farm());
}

class Farm extends StatelessWidget {
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
      'mainItem': 'Sahakari Spice Farm',
      'subtitle': 'Ponda',
      'locationIcon': Icons.location_on,
      'page': farm1(),
    },
    {
      'mainItem': 'Tanshikar Spice Farm',
      'subtitle': 'Snaguem',
      'locationIcon': Icons.location_on,
      'page': farm2(),
    },
    {
      'mainItem': 'Tropical spice plantation',
      'subtitle': 'Keryem Ponda',
      'locationIcon': Icons.location_on,
      'page': farm3(),
    },
    {
      'mainItem': 'Dudhsagar Plantation',
      'subtitle': 'Molem',
      'locationIcon': Icons.location_on,
      'page': farm4(),
    },
    {
      'mainItem': 'Sahyadri Spice Farm',
      'subtitle': 'Kolem',
      'locationIcon': Icons.location_on,
      'page': farm5(),
    },
    {
      'mainItem': 'Gaonkars Nandanvan',
      'subtitle': 'Kodar',
      'locationIcon': Icons.location_on,
      'page': farm6(),
    },
    {
      'mainItem': 'Atreya Vedic Farm',
      'subtitle': 'Molem',
      'locationIcon': Icons.location_on,
      'page': farm7(),
    },
    {
      'mainItem': 'Rods Farm',
      'subtitle': 'Nuvem',
      'locationIcon': Icons.location_on,
      'page': farm8(),
    },
    {
      'mainItem': 'Pascoal spice village',
      'subtitle': 'Khandepar',
      'locationIcon': Icons.location_on,
      'page': farm9(),
    },
    {
      'mainItem': 'Dr. Maliks Farms',
      'subtitle': 'Hasapur',
      'locationIcon': Icons.location_on,
      'page': farm10(),
    },
    {
      'mainItem': 'Kikara Farm',
      'subtitle': 'Shigaon',
      'locationIcon': Icons.location_on,
      'page': farm11(),
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
                      'lib/images/Farm${index + 1.0}.jpg',
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
