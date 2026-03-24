import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/Beaches/beach16.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Cuisine2());
}

class Cuisine2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goa Tourism',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Dark mode theme
      ),
      home: ChickenCafreal(),
    );
  }
}

class ChickenCafreal extends StatefulWidget {
  @override
  _ChickenCafrealState createState() => _ChickenCafrealState();
}

class _ChickenCafrealState extends State<ChickenCafreal> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/ChickenCafreal1.jpg',
    'lib/images/ChickenCafreal2.jpg',
    'lib/images/ChickenCafreal3.jpg',
    'lib/images/ChickenCafreal4.jpg',
    'lib/images/ChickenCafreal5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chicken Cafreal'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    'Chicken Cafreal',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Cuisine',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '‘Chicken Cafreal‘ is an aromatic, delicious and low-effort recipe from beautiful coastal state – Goa, India. Cafreal was introduced to Goan Cuisine by the Portuguese which is traditionally served with fried potatoes. Recipe is pretty straightforward where chicken is marinated and cooked with cafreal masala. This cafreal paste is a fiery, flavour-packed blend of coriander, chillies and bunch of whole spices. And that’s how recipe gets it’s dark green colour. Unlike other Goan recipes, this one doesn’t require any coconut while prepared using simply cafreal masala.\n\n'
                    'Chicken Cafreal is a Goan dish originating from the Indian state of Goa. Its typically made with chicken marinated in a blend of spices, herbs, and vinegar, then pan-fried or grilled. While the exact nutritional values can vary based on the specific recipe and cooking method, heres a general idea of the nutritional composition of Chicken Cafreal per serving (approximately 100 grams):\n'
                    'Calories: Around 200-250 kcal\n'
                    'Protein: Approximately 20-25 grams\n'
                    'Fat: Approximately 10-15 grams\n'
                    'Carbohydrates: Minimal, around 2-5 grams\n'
                    'Fiber: Minimal\n'
                    'Sodium: The amount of sodium can vary greatly depending on the amount of salt used in the marinade and seasoning. Its advisable to monitor sodium intake, especially if watching your blood pressure.\n\n'
                    'For those of you who drooled over your phones or laptops at the sight of Cafreal, but are too lazy to go and cook it yourself, there are quite a few restaurants in Goa which serve you some delicious Cafreal. Florentine in Saligao, Martin’s Corner in Betalbatim and Bhatti Village in Nerul are just some of them.\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/zamFHvSL2mtb4x259');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_ChickenCafreal.jpg',
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
                  'Attractions at Sahakari Spice Farm',
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
      "title": "Urban Woods",
      "subtitle": "Phonda",
      "image": "lib/images/SSF1.jpg"
    },
    {
      "title": "Cafe Bhonsle",
      "subtitle": "Phonda",
      "image": "lib/images/SSF2.jpg"
    },
    {
      "title": "Royal Garden",
      "subtitle": "Phonda",
      "image": "lib/images/SSF3.jpg"
    },
    {
      "title": "Hotel Menino",
      "subtitle": "Phonda",
      "image": "lib/images/SSF4.jpg"
    },
    {
      "title": "Hotel Sungrace",
      "subtitle": "Phonda",
      "image": "lib/images/SSF5.jpg"
    },
    {
      "title": "Silva Nagar Garden",
      "subtitle": "Phonda",
      "image": "lib/images/SSF6.jpg"
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
      case 'Urban Woods':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BeachPage16()));
        break;
      case 'Cafe Bhonsle':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BeachPage16()));
        break;
      case 'Royal Garden':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BeachPage16()));
        break;
      case 'Hotel Menino':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BeachPage16()));
        break;
      case 'Hotel Sungrace':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BeachPage16()));
        break;
      case 'Silva Nagar Garden':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BeachPage16()));
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}
