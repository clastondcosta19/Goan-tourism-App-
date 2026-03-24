import 'package:flutter/material.dart';

void main() {
  runApp(Salcete());
}

class Salcete extends StatelessWidget {
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
            title: Text('Salcete'),
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
                  children: Salcetetaluka.map((place) {
                    return GestureDetector(
                      onTap: () {
                        // Handle onTap action
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
                  children: Restaurants.map((restaurantct) {
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
                                    restaurantct["image"]!,
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
                                        restaurantct["title"]!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        restaurantct["subtitle"]!,
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

List<Map<String, dynamic>> Salcetetaluka = [
  {
    "title": "Margao",
    "image": "lib/images/margaos.jpg",
  },
  {
    "title": "Colva",
    "image": "lib/images/colva.jpg",
  },
  {
    "title": "Benaulim",
    "image": "lib/images/benaulim.jpg",
  },
  {
    "title": "Varca",
    "image": "lib/images/varca.jpg",
  },
  {
    "title": "Cavelossim",
    "image": "lib/images/cavelossim.jpg",
  },
  {
    "title": "Assolna",
    "image": "lib/images/assolna.jpg",
  },
  {
    "title": "Chinchinim",
    "image": "lib/images/chinchinim.jpg",
  },
  {
    "title": "Majorda",
    "image": "lib/images/majorda.jpg",
  },
  {
    "title": "Betul",
    "image": "lib/images/betul.jpg",
  },
  // Add more villages as needed
];

List<Map<String, dynamic>> OtherAttractions = [
  {
    "title": "Alila Diwa Goa",
    "subtitle": "Majorda",
    "image": "lib/images/salceteh1.jpg",
  },
  {
    "title": "Kenilworth Resort & Spa, Goa",
    "subtitle": "Utorda",
    "image": "lib/images/salceteh2.jpg",
  },
  {
    "title": "Holiday Inn Resort Goa",
    "subtitle": "Mobor Beach",
    "image": "lib/images/salceteh3.jpg",
  },
  {
    "title": "ITC Grand Goa, a Luxury Collection Resort & Spa, Goa",
    "subtitle": "Cansaulim",
    "image": "lib/images/salceteh4.jpg",
  },
  {
    "title": "The Zuri White Sands, Goa Resort & Casino",
    "subtitle": "Varca",
    "image": "lib/images/salceteh5.jpg",
  },
  {
    "title": "Planet Hollywood Beach Resort Goa",
    "subtitle": "Utorda",
    "image": "lib/images/salceteh6.jpg",
  },
  {
    "title": "Radisson Blu Resort Goa Cavelossim Beach",
    "subtitle": "Cavelossim",
    "image": "lib/images/salceteh7.jpg",
  },
  {
    "title": "Taj Exotica Resort & Spa, Goa",
    "subtitle": "Benaulim Beach",
    "image": "lib/images/salceteh8.jpg",
  },

  // Add more attractions as needed
];

List<Map<String, dynamic>> Restaurants = [
  {
    "title": "Martin's Corner",
    "subtitle": "Betalbatim",
    "image": "lib/images/restaurantct1.jpg",
  },
  {
    "title": "Fishka",
    "subtitle": "Colva",
    "image": "lib/images/restaurantct2.jpg",
  },
  {
    "title": "Papa Joe's Family Restaurant",
    "subtitle": "Benaulim",
    "image": "lib/images/restaurantct3.jpg",
  },
  {
    "title": "Mike's Place",
    "subtitle": "Majorda",
    "image": "lib/images/restaurantct4.jpg",
  },
  {
    "title": "Cavatina Cuchina",
    "subtitle": "Cansaulim",
    "image": "lib/images/restaurantct8.jpg",
  },
  {
    "title": "Zeebop by the Sea",
    "subtitle": "Utorda",
    "image": "lib/images/restaurantct9.jpg",
  },
  {
    "title": "Sagar Kinara Pure Veg Resturants",
    "subtitle": "Colva",
    "image": "lib/images/restaurantct10.jpg",
  },

  // Add more restaurantcts as needed
];
