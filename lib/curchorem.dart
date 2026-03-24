import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/PalacioDoDeao.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goa Tourism',
      theme: ThemeData.light(), // Default light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system, // Use system theme mode (light/dark)
      home: Curchorem(),
    );
  }
}

class Curchorem extends StatefulWidget {
  @override
  _CurchoremState createState() => _CurchoremState();
}

class _CurchoremState extends State<Curchorem> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/curchorem1.jpg',
    'lib/images/curchorem2.jpg',
    'lib/images/curchorem3.jpg',
    'lib/images/curchorem4.jpg',
    'lib/images/curchorem5.jpg',
    'lib/images/curchorem6.jpg',
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
                    'Curchorem',
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
                    'Curchorem is a town and municipal council located in South Goa, India. Its considered a twin city with Sanvordem, as the two towns sit on opposite sides of the Zuari River. Curchorem is a self-sufficient town with all the essential amenities for residents, including hospitals, schools, a police station, banks, ATMs, a railway station, markets, restaurants, and places of worship. It also boasts a playground, an electricity station, and even a theatre.\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/DWZoqK1oE6qZfwPf6');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_curchorem.jpg',
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
                  'Attractions at Curchorem',
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
      "title": "Salaulim Dam",
      "subtitle": "Sanguem",
      "image": "lib/images/curchorema1.jpg"
    },
    {
      "title": "Palácio do Deão",
      "subtitle": "Quepem",
      "image": "lib/images/curchorema2.jpg"
    },
    {
      "title": "Menezes Braganca House",
      "subtitle": "chandor",
      "image": "lib/images/curchorema3.jpg"
    },
    {
      "title": "Fernandes Heritage House",
      "subtitle": "chandor",
      "image": "lib/images/curchorema4.jpg"
    },
    {
      "title": "Church of Nossa Senhora de Belem",
      "subtitle": "chandor",
      "image": "lib/images/curchorema5.jpg"
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
      case 'Palácio do Deão':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PalacioDoDeao()),
        );
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}
