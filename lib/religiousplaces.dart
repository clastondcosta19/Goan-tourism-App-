// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/ReligiousPlaces/religious1.dart';
import 'package:goatourism/ReligiousPlaces/religious10.dart';
import 'package:goatourism/ReligiousPlaces/religious12.dart';
import 'package:goatourism/ReligiousPlaces/religious13.dart';
import 'package:goatourism/ReligiousPlaces/religious14.dart';
import 'package:goatourism/ReligiousPlaces/religious16.dart';
import 'package:goatourism/ReligiousPlaces/religious17.dart';
import 'package:goatourism/ReligiousPlaces/religious18.dart';
import 'package:goatourism/ReligiousPlaces/religious19.dart';
import 'package:goatourism/ReligiousPlaces/religious2.dart';
import 'package:goatourism/ReligiousPlaces/religious20.dart';
import 'package:goatourism/ReligiousPlaces/religious3.dart';
import 'package:goatourism/ReligiousPlaces/religious4.dart';
import 'package:goatourism/ReligiousPlaces/religious5.dart';
import 'package:goatourism/ReligiousPlaces/religious6.dart';
import 'package:goatourism/ReligiousPlaces/religious7.dart';
import 'package:goatourism/ReligiousPlaces/religious9.dart';

void main() {
  runApp(ReligiousPlaces());
}

class ReligiousPlaces extends StatelessWidget {
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
      'mainItem': 'Basilica of Bom Jesus',
      'subtitle': 'Churches',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace1(),
    },
    {
      'mainItem': 'St. Sebastian Church',
      'subtitle': 'churches',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace2(),
    },
    {
      'mainItem': 'Se Cathedral',
      'subtitle': 'Churches',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace3(),
    },
    {
      'mainItem': 'Shanta Durga Temple',
      'subtitle': 'Temples',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace4(),
    },
    {
      'mainItem': 'Church of St. Francis of Assisi',
      'subtitle': 'Churches',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace5(),
    },
    {
      'mainItem': 'Mahalasa Narayani Temple',
      'subtitle': 'Temples',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace6(),
    },
    {
      'mainItem': 'Chapel of St. Catherine',
      'subtitle': 'Churches',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace7(),
    },
    {
      'mainItem': 'Our Lady of the Immaculate Conception',
      'subtitle': 'Churches',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace9(),
    },
    {
      'mainItem': 'Shri Navdurga Saunsthan',
      'subtitle': 'Temples',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace10(),
    },
    {
      'mainItem': 'Safa Masjid',
      'subtitle': 'Mosques',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace12(),
    },
    {
      'mainItem': 'Sri Kamakshi Saunsthan Shiroda',
      'subtitle': 'Temples',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace13(),
    },
    {
      'mainItem': 'Brahma Temple',
      'subtitle': 'Temples',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace14(),
    },
    {
      'mainItem': 'Mangeshi Temple',
      'subtitle': 'Temples',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace16(),
    },
    {
      'mainItem': 'Shri Mahalaxmi Saunsthan, Bandora',
      'subtitle': 'Temples',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace17(),
    },
    {
      'mainItem': 'Church of Our Lady of Rosary',
      'subtitle': 'Churches',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace18(),
    },
    {
      'mainItem': 'Reis Magos Church',
      'subtitle': 'Churches',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace19(),
    },
    {
      'mainItem': 'Mallikarjun Temple',
      'subtitle': 'Temples',
      'locationIcon': Icons.location_on,
      'page': ReligiousPlace20(),
    }
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
                      'lib/images/religious${index + 1.0}.jpg',
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
