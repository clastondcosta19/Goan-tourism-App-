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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goa Tourism',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DivarIsland(),
    );
  }
}

class DivarIsland extends StatefulWidget {
  @override
  _DivarIslandState createState() =>
      _DivarIslandState();
}

class _DivarIslandState
    extends State<DivarIsland> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/DivarIsland1.jpg',
    'lib/images/DivarIsland2.jpg',
    'lib/images/DivarIsland3.jpg',
    'lib/images/DivarIsland4.jpg',
    'lib/images/DivarIsland5.jpg',
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
                    'Divar Island',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Cumbarjua',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Once known as Piedade, Divar Island sits in the path of the Mandovi River. The island derives its name from a Konkani word that means ‘small island’. Part of Ilhas taluka in North Goa, this island is situated at an altitude of 26 feet above sea level.\n\n'
                    'The history of Divar Island can be traced back to the 14th century when the idol of the patron deity of the Kadamba Dynasty was moved to the village of Naroa in the municipal council of Bicholim after the original temple of Saptakoteshwar was destroyed by the Sultan of the Deccan.\n\n'
                    'At the end of the 14th century, Madhav Mantri of the Kingdom of Vijaynagara reconstructed the Saptakoteshwar temple on Divar Island, which attracted around 3,000 worshippers from across Goa during the time of the annual procession of the deity. About a 100 years later, when the Portuguese arrived on Divar Island, the temple complex was a ruin.\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/AyJbCAPGKab6iZaBA');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_DivarIsland.jpg',
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
                  'Attractions at Divar Island',
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
      "title": "Greenyard Restaurant",
      "subtitle": "Cumbarjua",
      "image": "lib/images/DI1.jpg"
    },
    {
      "title": "Avinash Restaurant",
      "subtitle": "Cumbarjua",
      "image": "lib/images/DI2.jpg"
    },
    {
      "title": "Mercure Goa Devaaya Resort",
      "subtitle": "Cumbarjua",
      "image": "lib/images/DI3.jpg"
    },
    {
      "title": "Swarnam - Banquet Hall and Hotel",
      "subtitle": "Cumbarjua",
      "image": "lib/images/DI4.jpg"
    },
    {
      "title": "La Grande Residencya",
      "subtitle": "Cumbarjua",
      "image": "lib/images/DI5.jpg"
    },
    {
      "title": "Our Lady of Piety Church",
      "subtitle": "Cumbarjua",
      "image": "lib/images/DI6.jpg"
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
      case 'Greenyard Restaurant':
         Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions1()));
        break;
      case 'Avinash Restaurant':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions2()));
        break;
      case 'Mercure Goa Devaaya Resort':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions3()));
        break;
      case 'Swarnam - Banquet Hall and Hotel':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions4()));
        break;
      case 'La Grande Residencya':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions5()));
        break;
      case 'Our Lady of Piety Church':
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
