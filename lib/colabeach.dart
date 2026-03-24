import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/about_us.dart';
import 'package:url_launcher/url_launcher.dart'; // Import WishlistApp and WishlistPage

class ColaBeach extends StatefulWidget {
  @override
  _ColaBeachState createState() => _ColaBeachState();
}

class _ColaBeachState extends State<ColaBeach> {
  bool isBookmarked = false; // Variable to track bookmark status

  final List<String> imageList = [
    'lib/images/colabeach1.jpg',
    'lib/images/colabeach2.jpg',
    'lib/images/colabeach3.jpg',
    'lib/images/colabeach4.jpg',
    'lib/images/colabeach5.jpg',
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
                    'Cola Beach',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'South Goa',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Tucked away in South Goa, Cola Beach is a hidden gem waiting to be discovered. This secluded paradise boasts a stunning coastline with soft, golden sand and gentle waves lapping at the shore. Unlike the bustling beaches of North Goa, Cola Beach offers a tranquil atmosphere, perfect for those seeking relaxation and escape.\n\n'
                    'Beyond its pristine beauty, Cola Beach offers exciting activities for all kinds of travelers. You can explore the serene freshwater lagoon, perfect for kayaking and paddleboarding, or embark on a thrilling adventure through the verdant hills on scenic hiking trails. For a unique experience, opt for comfortable tent accommodations nestled amidst the palm groves and wake up to the soothing sounds of the ocean. Whether you\'re seeking relaxation, adventure, or a combination of both, Cola Beach promises an unforgettable experience.\n\n',
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
                        launch('https://maps.app.goo.gl/iPUnjYQU2oZ2AXTC7');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/google_map_ColaBeach.jpg',
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
                    'Attractions at Cola Beach',
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
        WishlistApp.addPage("Cola Beach", ColaBeach());
      } else {
        WishlistApp.removePage("Cola Beach");
      }
    });
  }
}

class AttractionList extends StatefulWidget {
  @override
  _AttractionListState createState() => _AttractionListState();
}

class _AttractionListState extends State<AttractionList> {
  final List<Map<String, String>> talukas = [
    {
      "title": "Cola Beach",
      "subtitle": "South Goa",
      "image": "lib/images/cb1.jpg"
    },
    {
      "title": "Cola Beach Lagoon",
      "subtitle": "South Goa",
      "image": "lib/images/cb2.jpg"
    },
    {
      "title": "Tenting Accommodations",
      "subtitle": "South Goa",
      "image": "lib/images/cb3.jpg"
    },
    {
      "title": "Hiking Trails",
      "subtitle": "South Goa",
      "image": "lib/images/cb4.jpg"
    },
    {
      "title": "Water Sports",
      "subtitle": "South Goa",
      "image": "lib/images/cb5.jpg"
    },
    {
      "title": "Sunset Views",
      "subtitle": "South Goa",
      "image": "lib/images/cb6.jpg"
    },
  ];

  late List<Map<String, String>> shuffledList;

  @override
  void initState() {
    super.initState();
    shuffledList = shuffleList(talukas);
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
        children: shuffledList.map((taluka) {
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
                        taluka["image"]!,
                        height: 200,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        taluka["title"]!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        taluka["subtitle"]!,
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
