import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import WishlistApp and WishlistPage

class HolySpiritChurch extends StatefulWidget {
  @override
  _HolySpiritChurchState createState() => _HolySpiritChurchState();
}

class _HolySpiritChurchState extends State<HolySpiritChurch> {
  bool isBookmarked = false; // Variable to track bookmark status

  final List<String> imageList = [
    'lib/images/holyspiritchurch1.jpg',
    'lib/images/holyspiritchurch2.jpg',
    'lib/images/holyspiritchurch3.jpg',
    'lib/images/holyspiritchurch4.jpg',
    'lib/images/holyspiritchurch5.jpg',
    'lib/images/holyspiritchurch6.jpg',
    'lib/images/holyspiritchurch7.jpg',
    'lib/images/holyspiritchurch8.jpg',
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
                    'Holy Spirit Church',
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
                    'The Holy Spirit Church, located in Margao, South Goa, is one of the oldest and most prominent churches in the region. Built during the Portuguese colonial era, the church stands as a testament to Goa\'s rich cultural and religious heritage.\n\n'
                    'Adorned with stunning architecture and intricate designs, the Holy Spirit Church attracts visitors with its serene ambiance and historical significance. The majestic facade and towering spires of the church are a sight to behold, offering a glimpse into Goa\'s colonial past.\n\n'
                    'Inside the church, visitors can admire beautiful frescoes, ornate altars, and exquisite religious artifacts. The tranquil atmosphere provides a perfect setting for prayer, meditation, and quiet reflection.\n\n',
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
                        launch('https://maps.app.goo.gl/8RkXJjTKNYccFBwa7');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/google_map_holyspiritchurch.jpg',
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
                    'Attractions near Holy Spirit Church',
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
      // Your logic to add or remove from wishlist goes here
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
      "title": "Colva Beach",
      "subtitle": "Colva",
      "image": "lib/images/colvabeachm.jpg"
    },
    {
      "title": "Benaulim Beach",
      "subtitle": "Benaulim",
      "image": "lib/images/benaulimbeachm.jpg"
    },
    {
      "title": "Margao Municipal Park",
      "subtitle": "Margao",
      "image": "lib/images/margaoparkm.jpg"
    },
    {
      "title": "Big Foot Cross Museum",
      "subtitle": "Loutolim",
      "image": "lib/images/bigfootcrossmuseum.jpg"
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
                        width: 230,
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
