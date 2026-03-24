import 'package:flutter/material.dart';
import 'package:goatourism/butterflybeach.dart';
import 'package:goatourism/colabeach.dart';

void main() {
  runApp(Tiswadi());
}

class Tiswadi extends StatelessWidget {
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
            title: Text('Tiswadi'),
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
                  children: Tiswaditaluka.map((place) {
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

List<Map<String, dynamic>> Tiswaditaluka = [
  {
    "title": "Bambolim",
    "image": "lib/images/bambolim.jpg",
  },
  {
    "title": "Chimbel",
    "image": "lib/images/chimbel.jpg",
  },
  {
    "title": "Goa Velha",
    "image": "lib/images/goavelha.jpg",
  },
  {
    "title": "Naroa",
    "image": "lib/images/naroa.jpg",
  },
  {
    "title": "Taleigao",
    "image": "lib/images/taleigao.jpg",
  },
  {
    "title": "Siridao",
    "image": "lib/images/siridao.jpg",
  },
  {
    "title": "Old Goa",
    "image": "lib/images/oldgoa.jpg",
  },
  // Add more places as needed
];

List<Map<String, dynamic>> OtherAttractions = [
  {
    "title": "Taj Cidade de Goa Heritage, Goa",
    "subtitle": "Panaji",
    "image": "lib/images/tiswadih1.jpg",
  },
  {
    "title": "DoubleTree by Hilton Goa",
    "subtitle": "Panaji",
    "image": "lib/images/tiswadih2.jpg",
  },
  {
    "title": "Goa Marriott Resort & Spa",
    "subtitle": "Sirvoi",
    "image": "lib/images/tiswadih3.jpg",
  },
  {
    "title": "Regenta Inn Palacio De Goa",
    "subtitle": "Panajim",
    "image": "lib/images/tiswadih4.jpg",
  },
  {
    "title": "Taj Cidade de Goa Horizon",
    "subtitle": "Panjim",
    "image": "lib/images/tiswadih5.jpg",
  },
  {
    "title": "Vivanta Goa",
    "subtitle": "Panaji",
    "image": "lib/images/tiswadih6.jpg",
  },
];

List<Map<String, dynamic>> Restaurants = [
  {
    "title": "Rohit Multicuisine Restaurant & Bar",
    "subtitle": "Agacaim",
    "image": "lib/images/restruantt1.jpg",
  },
  {
    "title": "Ratnasagar Family Restaurant & Bar",
    "subtitle": "Velha",
    "image": "lib/images/restruantt2.jpg",
  },
  {
    "title": "Sanman Restaurant & Bar",
    "subtitle": "Velha",
    "image": "lib/images/restruantt3.jpg",
  },
  {
    "title": "Mi Casa",
    "subtitle": "Siridao",
    "image": "lib/images/restruantt4.jpg",
  },
  {
    "title": "Rio DeGoa",
    "subtitle": "Tiswadi",
    "image": "lib/images/restruantt5.jpg",
  },
  {
    "title": "ShrHoble's River Lounge",
    "subtitle": "Tiswadi",
    "image": "lib/images/restruantt6.jpg",
  },
  {
    "title": "Sarina Bar and Restaurant",
    "subtitle": "Agacaim",
    "image": "lib/images/restruantt7.jpg",
  },
  // Add more restaurants as needed
];
