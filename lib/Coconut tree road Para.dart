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
      home: CoconutTreeRoadParra(),
    );
  }
}

class CoconutTreeRoadParra extends StatefulWidget {
  @override
  _CoconutTreeRoadParraState createState() =>
      _CoconutTreeRoadParraState();
}

class _CoconutTreeRoadParraState
    extends State<CoconutTreeRoadParra> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/CoconutTreeRoadParra1.jpg',
    'lib/images/CoconutTreeRoadParra2.jpg',
    'lib/images/CoconutTreeRoadParra3.jpg',
    'lib/images/CoconutTreeRoadParra4.jpg',
    'lib/images/CoconutTreeRoadParra5.jpg',
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
                    'Coconut Tree Road Parra',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Porvorim',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'The picturesque village of Parra, nestled in the Bardez sub-district of North Goa, India, offers visitors a tranquil escape into the heart of Goas natural beauty and cultural heritage. Just a short distance from Mapusa City and neighboring villages like Saligao, Calangute, Assagaon, Anjuna, and Vagator, Parra is renowned for its captivating Coconut Tree Road. This enchanting stretch, lined with swaying coconut palms, provides a serene and tropical ambiance, making it the perfect destination for leisurely strolls and scenic bike rides.\n\n'
                    'Coconut Tree Road in Parra, Goa, lives up to its name, as it is flanked by towering coconut palms on both sides. The rustling of coconut leaves and the gentle sea breeze create a soothing atmosphere, offering respite from the Goan sun. Nature enthusiasts and photographers alike will be captivated by the vibrant green foliage against the backdrop of the clear blue sky.\n\n',
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/AYWXDGooikEGrwrC7');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_CoconutTreeRoadParra.jpg',
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
                  'Attractions at Coconut Tree Road Parra',
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
      "title": "Plated Restaurant",
      "subtitle": "Porvorim",
      "image": "lib/images/CTRP1.jpg"
    },
    {
      "title": "St. Anne's Church",
      "subtitle": "Porvorim",
      "image": "lib/images/CTRP2.jpg"
    },
    {
      "title": "Treebo Trend Green Park Hotel",
      "subtitle": "Porvorim",
      "image": "lib/images/CTRP3.jpg"
    },
    {
      "title": "Masala House",
      "subtitle": "Porvorim",
      "image": "lib/images/CTRP4.jpg"
    },
    {
      "title": "Prestige Hotel",
      "subtitle": "Porvorim",
      "image": "lib/images/CTRP5.jpg"
    },
    {
      "title": " El Raso by The Blue Kite",
      "subtitle": "Porvorim",
      "image": "lib/images/CTRP6.jpg"
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
      case 'Plated Restaurant':
         Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions1()));
        break;
      case 'St. Annes Church':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions2()));
        break;
      case 'Treebo Trend Green Park Hotel':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions3()));
        break;
      case 'Masala House':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions4()));
        break;
      case 'Prestige Hotel':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => calanguteattractions5()));
        break;
      case ' El Raso by The Blue Kite':
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
