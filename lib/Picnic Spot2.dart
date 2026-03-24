import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/benzwaxmuseum.dart';
import 'package:goatourism/bluemarineresort.dart';
import 'package:goatourism/lamerbeachresorts.dart';
import 'package:goatourism/ratnasagarrestaurant.dart';
import 'package:goatourism/souzalobo.dart';
import 'package:goatourism/stalexchruch.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(PicnicSpot2());
}

class PicnicSpot2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goa Tourism',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoaScienceCentrePlanetarium(),
    );
  }
}

class GoaScienceCentrePlanetarium extends StatefulWidget {
  @override
  _GoaScienceCentrePlanetariumState createState() =>
      _GoaScienceCentrePlanetariumState();
}

class _GoaScienceCentrePlanetariumState
    extends State<GoaScienceCentrePlanetarium> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/GoaScienceCentrePlanetarium1.jpg',
    'lib/images/GoaScienceCentrePlanetarium2.jpg',
    'lib/images/GoaScienceCentrePlanetarium3.jpg',
    'lib/images/GoaScienceCentrePlanetarium4.jpg',
    'lib/images/GoaScienceCentrePlanetarium5.jpg',
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
            ),
            onPressed: () {
              toggleBookmark();
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
                    'Goa Science Centre & Planetarium',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Panjim',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Calangute Beach is one of the most popular beaches in Goa, known for its vibrant atmosphere and bustling activities. With its expansive coastline of soft golden sand and clear blue waters, Calangute attracts visitors from around the world.\n\n'
                    'The beach offers a plethora of water sports activities such as parasailing, jet skiing, and banana boat rides, providing an adrenaline rush for adventure enthusiasts. Additionally, Calangute is dotted with shacks serving delicious seafood and refreshing beverages, allowing visitors to indulge in the local culinary delights.\n\n'
                    'Apart from water sports and culinary experiences, Calangute also boasts a lively nightlife scene with numerous bars and clubs hosting parties until the early hours of the morning. Whether youre looking for adventure, relaxation, or vibrant nightlife, Calangute Beach has something to offer for everyone.\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://mGSCP.app.goo.gl/uR4nFqCcx9xMYPwo8');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_GoaScienceCentrePlanetarium.jpg',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Attractions at Goa Science Centre & Planetarium',
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

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      // Implement your bookmark logic here
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
      "title": "Miramar Beach",
      "subtitle": "Panjim",
      "image": "lib/images/GSCP1.jpg"
    },
    {
      "title": "Vivanta Goa",
      "subtitle": "Panjim",
      "image": "lib/images/GSCP2.jpg"
    },
    {
      "title": "Mum's Kitchen",
      "subtitle": "Panjim",
      "image": "lib/images/GSCP3.jpg"
    },
    {
      "title": "Café Ashwini Caranzalem",
      "subtitle": "Panjim",
      "image": "lib/images/GSCP4.jpg"
    },
    {
      "title": "Clube Tennis De Gaspar Dias",
      "subtitle": "Panjim",
      "image": "lib/images/GSCP5.jpg"
    },
    {
      "title": "Serene Home Stay",
      "subtitle": "Panjim",
      "image": "lib/images/GSCP6.jpg"
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
              onTap: () {
                // Navigate to the corresponding attraction detail page
                navigateToAttractionPage(attraction['title']!);
              },
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

  void navigateToAttractionPage(String title) {
    // Navigate to the appropriate attraction page based on the title
    switch (title) {
      case 'Miramar Beach':
         Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions1()));
        break;
      case 'Vivanta Goa':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions2()));
        break;
      case 'Mums Kitchen':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions3()));
        break;
      case 'Café Ashwini Caranzalem':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions4()));
        break;
      case 'Clube Tennis De Gaspar Dias':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions5()));
        break;
      case 'Serene Home Stay':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions6()));
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}
