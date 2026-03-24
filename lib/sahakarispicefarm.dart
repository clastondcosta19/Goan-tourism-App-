import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/about_us.dart';
import 'package:url_launcher/url_launcher.dart'; // Import WishlistApp and WishlistPage

class SahakariSpiceFarm extends StatefulWidget {
  @override
  _SahakariSpiceFarmState createState() => _SahakariSpiceFarmState();
}

class _SahakariSpiceFarmState extends State<SahakariSpiceFarm> {
  bool isBookmarked = false; // Variable to track bookmark status

  final List<String> imageList = [
    'assets/images/SahakariSpiceFarm1.jpg',
    'assets/images/SahakariSpiceFarm2.jpg',
    'assets/images/SahakariSpiceFarm3.jpg',
    'assets/images/SahakariSpiceFarm4.jpg',
    'assets/images/SahakariSpiceFarm5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              // Change the bookmark icon based on the bookmark status
            ),
            onPressed: () {
              // Call toggleBookmark function when the bookmark icon is pressed
              toggleBookmark(context);
            },
          ),
          /*IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Navigate to WishlistPage
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Wishlist()));
            },
          ),*/
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: imageList.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                height: 250,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sahakari Spice Farm',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'North Goa',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sahakari Spice Farm is situated amidst lush green surroundings at Curti. The taluka of Ponda in which it is located is extremely popular amongst tourists for its rich cultural heritage and magnificently designed places of worship.\n\n'
                    'This Spice farm adds to the variety of tourist destinations that Ponda has to boast of.\n\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {
                        launch('https://maps.app.goo.gl/Xfy9rBd8QECSEmn36');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/google_map_SahakariSpiceFarm.png',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Conditional rendering of AttractionList based on bookmark status
            if (!isBookmarked)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attractions near Sahakari Spice Farm',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  AttractionList(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void toggleBookmark(BuildContext context) {
    setState(() {
      isBookmarked = !isBookmarked;
      if (isBookmarked) {
        WishlistApp.addPage("Sahakari Spice Farm", SahakariSpiceFarm());
      } else {
        WishlistApp.removePage("Sahakari Spice Farm");
      }
    });
  }
}

class AttractionList extends StatefulWidget {
  @override
  _AttractionListState createState() => _AttractionListState();
}

class _AttractionListState extends State<AttractionList> {
  final List<Map<String, String>> attractions = [
    {
      "title": "Rajiv Gandhi Kala Mandir",
      "subtitle": "North Goa",
      "image": "assets/images/RajivGandhiKalaMandir.jpg"
    },
    {
      "title": "Nandanvan Spice Farm",
      "subtitle": "North Goa",
      "image": "assets/images/NandanvanSpiceFarm.jpg"
    },
    {
      "title": "Mystic Woods",
      "subtitle": "North Goa",
      "image": "assets/images/MysticWoods.jpg"
    },
  ];

  late List<Map<String, String>> shuffledList;

  @override
  void initState() {
    super.initState();
    shuffledList = shuffleList(attractions);
  }

  List<Map<String, String>> shuffleList(List<Map<String, String>> list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: shuffledList.map((attraction) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        attraction["image"]!,
                        height: 200,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        attraction["title"]!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        attraction["subtitle"]!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
