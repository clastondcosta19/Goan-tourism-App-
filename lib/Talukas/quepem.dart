import 'package:flutter/material.dart';
import 'package:goatourism/Beaches/beach1.dart';
import 'package:goatourism/curchorem.dart';

void main() {
  runApp(Quepem());
}

class Quepem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text('Quepem Taluka'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCardList(Quepemtaluka),
              buildCardList(OtherAttractions),
              buildCardList(Restaurants),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardList(List<Map<String, dynamic>> itemList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            itemList == Quepemtaluka
                ? 'Villages'
                : itemList == OtherAttractions
                    ? 'Hotels'
                    : 'Restaurants',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: itemList.map((item) {
              return Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    if (item['page'] != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => item['page'](),
                        ),
                      );
                    } else {
                      // Handle default tap action (if needed)
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      height: 280,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                              child: Image.asset(
                                item["image"],
                                height: 200,
                                width: 240,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    item["subtitle"],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> Quepemtaluka = [
  {
    "title": "Curchorem",
    "subtitle": "South Goa",
    "image": "lib/images/curchorem.jpg",
    "page": () => Curchorem(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Xeldem",
    "subtitle": "South Goa",
    "image": "lib/images/xeldem.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Assolda",
    "subtitle": "South Goa",
    "image": "lib/images/assolda.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Avedem",
    "subtitle": "South Goa",
    "image": "lib/images/avadem.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Balli",
    "subtitle": "South Goa",
    "image": "lib/images/balli.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "tilamol",
    "subtitle": "South Goa",
    "image": "lib/images/tilamol.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Xelvona",
    "subtitle": "South Goa",
    "image": "lib/images/xelvona.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more places as needed
];

List<Map<String, dynamic>> OtherAttractions = [
  {
    "title": "Cottages, Eden Farms, Goa",
    "subtitle": "Ambaulim",
    "image": "lib/images/quepemh2.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Peace Valley Hotel",
    "subtitle": "Sirvoi",
    "image": "lib/images/quepemh3.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Amã Stays & Trails Eden Farms Emerald",
    "subtitle": "Ambaulim",
    "image": "lib/images/quepemh4.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Chrisander's Resort & Restaurant",
    "subtitle": "Quepem",
    "image": "lib/images/quepemh5.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Flagship Club Nirvana Resort",
    "subtitle": "Sirvoi",
    "image": "lib/images/quepemh6.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more attractions as needed
];

List<Map<String, dynamic>> Restaurants = [
  {
    "title": "Mom's kitchen",
    "subtitle": "Tilamol",
    "image": "lib/images/restruantq1.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Amit's Kitchen",
    "subtitle": "Tilamol",
    "image": "lib/images/restruantq2.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Pascoals Classic Multi Cuisine and Bar",
    "subtitle": "Nirmala nagar",
    "image": "lib/images/restruantq3.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Seby's Place",
    "subtitle": "Paroda",
    "image": "lib/images/restruantq4.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Authentic Goan kHAVAD restaurant",
    "subtitle": "Tanki",
    "image": "lib/images/restruantq5.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Shree Durgadevi Food Corner",
    "subtitle": "Quepem",
    "image": "lib/images/restruantq6.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Wild West Bar n Restaurant",
    "subtitle": "Bansai",
    "image": "lib/images/restruantq7.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Aaswad - family restaurant",
    "subtitle": "Bansai",
    "image": "lib/images/restruantq8.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Hill-View Bar and Restaurant",
    "subtitle": "Xeldem",
    "image": "lib/images/restruantq9.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more restaurants as needed
];
