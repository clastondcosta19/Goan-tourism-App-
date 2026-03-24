import 'package:flutter/material.dart';
import 'package:goatourism/butterflybeach.dart';
import 'package:goatourism/colabeach.dart';

void main() {
  runApp(Sanguem());
}

class Sanguem extends StatelessWidget {
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
            title: Text('Sanguem'),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Sanguemtaluka.map((place) {
                    return GestureDetector(
                      onTap: () {
                        switch (place['title']) {
                          case 'Cola Beach':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ColaBeach(),
                              ),
                            );
                            break;
                          case 'Butterfly Beach':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButterflyBeach(),
                              ),
                            );
                            break;
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 180,
                          height: 260,
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
                                    place["image"]!,
                                    height: 200,
                                    width: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    place["title"]!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text(
                  'Hotels',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: OtherAttractions.map((attraction) {
                    return GestureDetector(
                      onTap: () {
                        // Handle onTap action
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 240,
                          height: 290,
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
                                    attraction["image"]!,
                                    height: 200,
                                    width: 240,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        attraction["title"]!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        attraction["subtitle"]!,
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
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text(
                  'Restaurants',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Restaurants.map((restaurant) {
                    return GestureDetector(
                      onTap: () {
                        // Handle onTap action
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 240,
                          height: 290,
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
                                    restaurant["image"]!,
                                    height: 200,
                                    width: 240,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurant["title"]!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        restaurant["subtitle"]!,
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
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> Sanguemtaluka = [
  {
    "title": "Curchorem",
    "image": "lib/images/curchorem.jpg",
  },
  {
    "title": "Xeldem",
    "image": "lib/images/xeldem.jpg",
  },
  {
    "title": "Assolda",
    "image": "lib/images/assolda.jpg",
  },
  {
    "title": "Avedem",
    "image": "lib/images/avadem.jpg",
  },
  {
    "title": "Balli",
    "image": "lib/images/balli.jpg",
  },
  {
    "title": "Tilamol",
    "image": "lib/images/tilamol.jpg",
  },
  {
    "title": "Xelvona",
    "image": "lib/images/xelvona.jpg",
  },
  {
    "title": "Cuncolim",
    "image": "lib/images/cuncolim.jpg",
  },
  // Add more places as needed
];

List<Map<String, dynamic>> OtherAttractions = [
  {
    "title": "THE EDEN GOA ECO RESORT",
    "subtitle": "Cuncolim",
    "image": "lib/images/quepemh1.jpg",
  },
  {
    "title": "Cottages, Eden Farms, Goa",
    "subtitle": "Ambaulim",
    "image": "lib/images/quepemh2.jpg",
  },
  {
    "title": "Peace Valley Hotel",
    "subtitle": "Sirvoi",
    "image": "lib/images/quepemh3.jpg",
  },
  {
    "title": "Amã Stays & Trails Eden Farms Emerald",
    "subtitle": "Ambaulim",
    "image": "lib/images/quepemh4.jpg",
  },
  {
    "title": "Chrisander's Resort & Restaurant",
    "subtitle": "Quepem",
    "image": "lib/images/quepemh5.jpg",
  },
  {
    "title": "Flagship Club Nirvana Resort",
    "subtitle": "Sirvoi",
    "image": "lib/images/quepemh6.jpg",
  },

  // Add more attractions as needed
];

List<Map<String, dynamic>> Restaurants = [
  {
    "title": "Mom's kitchen",
    "subtitle": "Tilamol",
    "image": "lib/images/restruantq1.jpg",
  },
  {
    "title": "Amit's Kitchen",
    "subtitle": "Tilamol",
    "image": "lib/images/restruantq2.jpg",
  },
  {
    "title": "Pascoals Classic Multi Cuisine and Bar",
    "subtitle": "Nirmala nagar",
    "image": "lib/images/restruantq3.jpg",
  },
  {
    "title": "Seby's Place",
    "subtitle": "Paroda",
    "image": "lib/images/restruantq4.jpg",
  },
  {
    "title": "Authentic Goan kHAVAD restaurant",
    "subtitle": "tanki",
    "image": "lib/images/restruantq5.jpg",
  },
  {
    "title": "Shree Durgadevi Food Corner",
    "subtitle": "Quepem",
    "image": "lib/images/restruantq6.jpg",
  },
  {
    "title": "Wild West Bar n Restaurant",
    "subtitle": "Bansai",
    "image": "lib/images/restruantq7.jpg",
  },
  {
    "title": "Aaswad - family restaurant",
    "subtitle": "Bansai",
    "image": "lib/images/restruantq8.jpg",
  },
  // Add more restaurants as needed
];
