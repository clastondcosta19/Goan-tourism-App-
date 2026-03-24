// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/hotels/hotel10Page.dart';
import 'package:goatourism/hotels/hotel12Page.dart';
import 'package:goatourism/hotels/hotel13Page.dart';
import 'package:goatourism/hotels/hotel14Page.dart';
import 'package:goatourism/hotels/hotel16Page.dart';
import 'package:goatourism/hotels/hotel17Page.dart';
import 'package:goatourism/hotels/hotel18Page.dart';
import 'package:goatourism/hotels/hotel19Page.dart';
import 'package:goatourism/hotels/hotel1Page.dart';
import 'package:goatourism/hotels/hotel20Page.dart';
import 'package:goatourism/hotels/hotel2Page.dart';
import 'package:goatourism/hotels/hotel7Page.dart';

void main() {
  runApp(Hotel());
}

class Hotel extends StatelessWidget {
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
      'mainItem': 'Taj Cidade de Goa Horizon',
      'subtitle': 'Panaji',
      'locationIcon': Icons.location_on,
      'page': hotelPage1(),
    },
    {
      'mainItem': 'Grand Hyatt',
      'subtitle': 'Bamboli',
      'locationIcon': Icons.location_on,
      'page': HotelPage2(),
    },
    {
      'mainItem': 'JW Marriott',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage7(),
    },
    {
      'mainItem': 'Le Meridien',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage11(),
    },
    {
      'mainItem': 'Fairfield by Marriott',
      'subtitle': 'Anjuna',
      'locationIcon': Icons.location_on,
      'page': hotelPage12(),
    },
    {
      'mainItem': 'Taj Exotica Resort & Spa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage13(),
    },
    {
      'mainItem': 'The Leela Goa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage14(),
    },
    {
      'mainItem': 'Cidade De Goa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage16(),
    },
    {
      'mainItem': 'Park Hyatt Goa Resort and Spa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage16(),
    },
    {
      'mainItem': 'Alila Diwa Goa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage17(),
    },
    {
      'mainItem': 'W Goa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage18(),
    },
    {
      'mainItem': 'Vivanta Goa, Panaji',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage19(),
    },
    {
      'mainItem': 'The Lalit Golf & Spa Resort Goa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage20(),
    },
    {
      'mainItem': 'Planet Hollywood Beach Resort Goa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage18(),
    },
    {
      'mainItem': 'Novotel Goa Resort & Spa',
      'subtitle': 'Hotel',
      'locationIcon': Icons.location_on,
      'page': hotelPage13(),
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
                      'lib/images/hotel${index + 1.0}.jpg',
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
