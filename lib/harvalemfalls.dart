import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/about_us.dart';
import 'package:url_launcher/url_launcher.dart'; // Import WishlistApp and WishlistPage

class Harvalemfalls extends StatefulWidget {
  @override
  _HarvalemfallsState createState() => _HarvalemfallsState();
}

class _HarvalemfallsState extends State<Harvalemfalls> {
  bool isBookmarked = false; // Variable to track bookmark status

  final List<String> imageList = [
    'assets/images/Harvalemfalls1.jpg',
    'assets/images/Harvalemfalls2.jpg',
    'assets/images/Harvalemfalls3.jpg',
    'assets/images/Harvalemfalls4.jpg',
    'assets/images/Harvalemfalls5.jpg',
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
                    'Harvalem falls',
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
                    'The Arvalem Waterfall also known as Harvalem falls is a very scenic and beautiful picnic spot. This beautiful waterfall forms a huge lake at the bottom, which is much popular amongst the swimmers. The color of the waterfall becomes muddy brown in monsoon rains and the water flow is quite less in summer.\n\n'
                    'At a distance of 30 km from Panjim Kadamba Bus stand, 2 km from Sanquelim and 8 km from Bicholim, Arvalem waterfalls is one of the most amazing spots situated in North Goa. Cascading down from a height of 50 m (24 ft), Arvalem is one of the top places to visit in Goa.\n\n'
                    'This waterfall is set amidst charming surroundings, with the Rudreshwar temple in its vicinity. The temple holds importance for the Hindus who believe in releasing the soul on the 12th day after death. The Rock cut caves are just situated nearby. The Arvalem waterfall is one of the most crowded tourist spots in Goa. The Government has developed a park at the waterfall where one can peacefully sit and enjoy the beauty of the waterfall.\n\n',
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
                        launch('https://maps.app.goo.gl/jjeaKciMyjvsxUMo7');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/google_map_Harvalemfalls.png',
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
                    'Attractions near Harvalem falls',
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
        WishlistApp.addPage("Harvalem falls", Harvalemfalls());
      } else {
        WishlistApp.removePage("Harvalem falls");
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
      "title": "Arvalem Caves",
      "subtitle": "North Goa",
      "image": "assets/images/ArvalemCaves.jpg"
    },
    {
      "title": "Shree Rudreshwar Devalay",
      "subtitle": "North Goa",
      "image": "assets/images/ShreeRudreshwarDevalay.jpg"
    },
    {
      "title": "Goa aqua world",
      "subtitle": "North Goa",
      "image": "assets/images/Goaaquaworld.jpg"
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
