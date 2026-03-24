import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/about_us.dart';
import 'package:url_launcher/url_launcher.dart'; // Import WishlistApp and WishlistPage

class BagaBeach extends StatefulWidget {
  @override
  _BagaBeachState createState() => _BagaBeachState();
}

class _BagaBeachState extends State<BagaBeach> {
  bool isBookmarked = false; // Variable to track bookmark status

  final List<String> imageList = [
    'lib/images/bagabeach1.jpg',
    'lib/images/bagabeach2.jpg',
    'lib/images/bagabeach3.jpg',
    'lib/images/bagabeach4.jpg',
    'lib/images/bagabeach5.jpg',
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
                    'Baga Beach',
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
                    'Baga Beach is a popular tourist destination in North Goa, known for its lively atmosphere, beautiful beaches, and exciting nightlife. It is located between Calangute Beach and Anjuna Beach, making it a part of a larger beach stretch crammed with activity. During the day, Baga Beach offers a variety of water sports like parasailing, jet skiing, and banana boat rides. You can also find many beach shacks serving delicious Goan food and seafood.\n\n'
                    'In the evenings, Baga Beach transforms into a party hotspot. Titos Lane, located just behind the beach, is lined with pubs, clubs, and restaurants that come alive with music and dancing. If you are looking for a fun and vibrant beach experience in Goa, Baga Beach is the perfect place to be.\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: InkWell(
                      onTap: () {
                        launch('https://maps.app.goo.gl/VWBhz7ngvT6VfXfe7');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/google_map_BagaBeach.jpg',
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
                    'Attractions at Baga Beach',
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
        WishlistApp.addPage("Baga Beach", BagaBeach());
      } else {
        WishlistApp.removePage("Baga Beach");
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
      "title": "Tito's Lane",
      "subtitle": "North Goa",
      "image": "lib/images/baganearby1.jpg"
    },
    {
      "title": "Baga Flea Market",
      "subtitle": "North Goa",
      "image": "lib/images/baganearby2.jpg"
    },
    {
      "title": "Hotel Baga Grande",
      "subtitle": "North Goa",
      "image": "lib/images/baganearby3.jpg"
    },
    {
      "title": "Baga Hideout Resort",
      "subtitle": "North Goa",
      "image": "lib/images/baganearby4.jpg"
    },
    {
      "title": "Shining Sand Beach Resort",
      "subtitle": "North Goa",
      "image": "lib/images/baganearby5.jpg"
    },
    {
      "title": "Cherry Olive",
      "subtitle": "North Goa",
      "image": "lib/images/ca6.jpg"
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
