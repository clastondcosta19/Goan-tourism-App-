import 'package:flutter/material.dart';

void main() {
  runApp(canacona());
}

class canacona extends StatelessWidget {
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
            title: Text('canacona'),
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
                  children: canaconataluka.map((place) {
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

List<Map<String, dynamic>> canaconataluka = [
  {
    "title": "Canacona",
    "image": "lib/images/canacona.jpg",
  },
  {
    "title": "Chaudi",
    "image": "lib/images/chaudi.jpg",
  },
  {
    "title": "Palolem",
    "image": "lib/images/palolem.jpg",
  },
  {
    "title": "Agonda",
    "image": "lib/images/agonda.jpg",
  },
  {
    "title": "Loliem",
    "image": "lib/images/loliem.jpg",
  },
  {
    "title": "Poinguinim",
    "image": "lib/images/poinguinim.jpg",
  },
  {
    "title": "Cola",
    "image": "lib/images/cola.jpg",
  },
  {
    "title": "Rajbag",
    "image": "lib/images/rajbag.jpg",
  },
];

List<Map<String, dynamic>> OtherAttractions = [
  {
    "title": "One At Goa",
    "subtitle": "Xingalem Ponsolem",
    "image": "lib/images/canaconah1.jpg",
  },
  {
    "title": "The LaLiT Golf & Spa Resort Goa",
    "subtitle": "Rajbaga",
    "image": "lib/images/canaconah2.jpg",
  },
  {
    "title": "Agonda Shell Beach Resort",
    "subtitle": "tambdem agonda",
    "image": "lib/images/canaconah3.jpg",
  },
  {
    "title": "The Shore beach resort Palolem",
    "subtitle": "Ourem Road",
    "image": "lib/images/canaconah4.jpg",
  },
  {
    "title": "The Nine Beach Resort",
    "subtitle": "Patnem beach",
    "image": "lib/images/canaconah5.jpg",
  },
  {
    "title": "Baywatch Beach Resort patnem",
    "subtitle": "Palolem Patnem Beach",
    "image": "lib/images/canaconah6.jpg",
  },
  {
    "title": "Pont Bleu Suites",
    "subtitle": "Sadolxem",
    "image": "lib/images/canaconah6.jpg",
  },
  // Add more attractions as needed
];

List<Map<String, dynamic>> Restaurants = [
  {
    "title": "SABINA'S COASTAL DELIGHTS",
    "subtitle": "Palolem",
    "image": "lib/images/restruantc1.jpg",
  },
  {
    "title": "Mollu's Classic Multicuisine Restaurant",
    "subtitle": "Palolem",
    "image": "lib/images/restruantc2.jpg",
  },
  {
    "title": "Sai Jc Restaurant And Bar",
    "subtitle": "Rajbag",
    "image": "lib/images/restruantc3.jpg",
  },
  {
    "title": "Sumaya Goan authentic cuisine",
    "subtitle": "Palolem",
    "image": "lib/images/restruantc4.jpg",
  },
  {
    "title": "Dropadi Bar And Restaurant",
    "subtitle": "Palolem",
    "image": "lib/images/restruantc5.jpg",
  },
  {
    "title": "Cafe Abel Cressida",
    "subtitle": "canacona",
    "image": "lib/images/restruantc6.jpg",
  },
  {
    "title": "Tantra Cafe Restaurant and Beach Huts",
    "subtitle": " Palolem",
    "image": "lib/images/restruantc7.jpg",
  },
  {
    "title": "Royal Italy",
    "subtitle": "Mohanbagh, Palolem",
    "image": "lib/images/restruantc8.jpg",
  },
  // Add more restaurants as needed
];
