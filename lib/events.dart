import 'package:flutter/material.dart';
import 'package:goatourism/Beaches/beach1.dart';
import 'package:goatourism/curchorem.dart';

void main() {
  runApp(events());
}

class events extends StatelessWidget {
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
            title: Text('Events'),
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
              buildCardList("May", May, context),
              buildCardList("June", June, context),
              buildCardList("July", July, context),
              buildCardList("August", August, context),
              buildCardList("September", September, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardList(
      String title, List<Map<String, dynamic>> itemList, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            title,
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
              return GestureDetector(
                onTap: () {
                  if (item['page'] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => item['page'](),
                      ),
                    );
                  } else {
                    // Handle default tap action (if needed)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Page not available for ${item["title"]}'),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 220,
                    height: 270,
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
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> May = [
  {
    "title": "Cashew Fest",
    "subtitle": "May 10 - 12 2024",
    "image": "lib/images/CashewFest.jpg",
    "page": () => Curchorem(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Holy Spirit Church feast",
    "subtitle": "May 26 2024",
    "image": "lib/images/HolySpiritChurch.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Magdalena",
    "subtitle": "May 10 2024",
    "image": "lib/images/Magdalena.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Sound Of Estuary 29",
    "subtitle": "May 25 2024",
    "image": "lib/images/SoundOfEstuary29.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Igitun Chalne",
    "subtitle": "first week of May",
    "image": "lib/images/IgitunChalne.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Feast of Saint Mathias",
    "subtitle": " May 12 2024",
    "image": "lib/images/FeastofSaintMathias.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more places as needed
];

List<Map<String, dynamic>> June = [
  {
    "title": "São João",
    "subtitle": "June 24",
    "image": "lib/images/saojao.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "World Yoga Day",
    "subtitle": "June 21 2024",
    "image": "lib/images/ChickenCafreal.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Sangodd",
    "subtitle": "June 29 2024",
    "image": "lib/images/Sangodd.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "FENI FLAVOURS & FESTIVAL FUN",
    "subtitle": "June 23 2024",
    "image": "lib/images/FENIFLAVOURS&FESTIVALFUN.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Furniture Fair",
    "subtitle": "June 28 2024",
    "image": "lib/images/FurnitureFair.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more attractions as needed
];

List<Map<String, dynamic>> July = [
  {
    "title": "Touxeachem Fest",
    "subtitle": "July 31 2024",
    "image": "lib/images/TouxeachemFest.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },

  // Add more restaurants as needed
];

List<Map<String, dynamic>> August = [
  {
    "title": "Independence Day",
    "subtitle": "August 15",
    "image": "lib/images/independanceday.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Bonderam",
    "subtitle": "August 24",
    "image": "lib/images/Bonderam.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Feast of Our Lady of Snows Raia Feast",
    "subtitle": "August 5 2024",
    "image": "lib/images/FeastofOurLadyofSnowsRaia.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Feast of St. Cajetan Church, Assagao, Goa",
    "subtitle": "August 7 2024",
    "image": "lib/images/StCajetanChurchAssagao.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more restaurants as needed
];
List<Map<String, dynamic>> September = [
  {
    "title": "Ganesh Chaturthi",
    "subtitle": "September 7 2024",
    "image": "lib/images/GaneshChaturti.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "World Tourism Day",
    "subtitle": "September 27 2024",
    "image": "lib/images/WorldTourismDay.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more restaurants as needed
];
