// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/Waterfalls/DragonWaterfall.dart';
import 'package:goatourism/Waterfalls/DudhsagarWaterfall.dart';
import 'package:goatourism/Waterfalls/HarvalemWaterfall.dart';
import 'package:goatourism/Waterfalls/JalavaneWaterfall.dart';
import 'package:goatourism/Waterfalls/KalayWaterfall.dart';
import 'package:goatourism/Waterfalls/KesarvalWaterfall.dart';
import 'package:goatourism/Waterfalls/SaleliWaterfall.dart';
import 'package:goatourism/Waterfalls/SulsuloWaterfall.dart';
import 'package:goatourism/netravaliwaterfalls.dart';

void main() {
  runApp(Waterfall());
}

class Waterfall extends StatelessWidget {
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
      'mainItem': 'Dudhsagar Waterfall',
      'subtitle': 'South Goa',
      'locationIcon': Icons.location_on,
      'page': DudhsagarWaterfall(),
    },
    {
      'mainItem': 'Netravali Waterfalls',
      'subtitle': 'South Goa',
      'locationIcon': Icons.location_on,
      'page': NetravaliWaterfalls(),
    },
    /*{
      'mainItem': 'Borim Waterfall',
      'subtitle': 'South Goa',
      'locationIcon': Icons.location_on,
      'page': Borimwaterf(),
    },*/
    {
      'mainItem': 'Saleli Waterfall',
      'subtitle': 'North Goa',
      'locationIcon': Icons.location_on,
      'page': SaleliWaterfall(),
    },
    {
      'mainItem': 'Dragon Waterfall',
      'subtitle': 'South Goa',
      'locationIcon': Icons.location_on,
      'page': DragonWaterfall(),
    },
    {
      'mainItem': 'Sulsulo Waterfall',
      'subtitle': 'North Goa',
      'locationIcon': Icons.location_on,
      'page': SulsuloWaterfall(),
    },
    {
      'mainItem': 'Jalavane Waterfall',
      'subtitle': 'North Goa',
      'locationIcon': Icons.location_on,
      'page': JalavaneWaterfall(),
    },
    {
      'mainItem': 'Harvalem Waterfall',
      'subtitle': 'North Goa',
      'locationIcon': Icons.location_on,
      'page': HarvalemWaterfall(),
    },
    /*{
      'mainItem': 'Tambdi Surla Waterfall',
      'subtitle': 'South Goa',
      'locationIcon': Icons.location_on,
      'page': TambdiSurlaWaterfall(),
    },*/
    {
      'mainItem': 'Kesarval Waterfall',
      'subtitle': 'South Goa',
      'locationIcon': Icons.location_on,
      'page': KesarvalWaterfall(),
    },
    {
      'mainItem': 'Kalay Waterfall',
      'subtitle': 'South Goa',
      'locationIcon': Icons.location_on,
      'page': KalayWaterfall(),
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
                      'lib/images/wtr${index + 1}.jpg',
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
