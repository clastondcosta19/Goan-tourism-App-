// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/Picnic%20Spot1.dart';
import 'package:goatourism/Picnic%20Spot2.dart';

void main() {
  runApp(PicnicSpot());
}

class PicnicSpot extends StatelessWidget {
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
      'mainItem': 'Azaans PicnicSpot',
      'subtitle': 'Loutolim',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Goa Science Centre & Planetarium',
      'subtitle': 'Panjim',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot2(),
    },
    {
      'mainItem': 'Salaulim Dam',
      'subtitle': 'Sanguem',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Big Foot Goa',
      'subtitle': 'Salcete',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Bondla Wildlife Sanctuary',
      'subtitle': 'Usgao',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Indian Naval Aviation Museum',
      'subtitle': 'Vasco Da Gama',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Amona Riverside PicnicSpot,',
      'subtitle': 'Amona',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Mountain view picnicspot',
      'subtitle': 'Molcornem',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Tess Farm',
      'subtitle': 'Quepem',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Birondem PicnicSpot',
      'subtitle': 'Birondem',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Safari Pisces Farm House',
      'subtitle': 'Shelden',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Quepem Dam',
      'subtitle': 'Quepem',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Kapsan Farm',
      'subtitle': 'Ponda',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
    },
    {
      'mainItem': 'Paradise Farm',
      'subtitle': 'Cavorem',
      'locationIcon': Icons.location_on,
      'page': PicnicSpot1(),
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
                      'lib/images/PicnicSpot${index + 1.0}.jpg',
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
