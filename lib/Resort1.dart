import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Resort1());
}

class Resort1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goa Tourism',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, // Default to light mode
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Dark mode theme
      ),
      home: TajExoticaResortSpaGoa(),
    );
  }
}

class TajExoticaResortSpaGoa extends StatefulWidget {
  @override
  _TajExoticaResortSpaGoaState createState() => _TajExoticaResortSpaGoaState();
}

class _TajExoticaResortSpaGoaState extends State<TajExoticaResortSpaGoa> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/TajExoticaResortSpaGoa1.jpg',
    'lib/images/TajExoticaResortSpaGoa2.jpg',
    'lib/images/TajExoticaResortSpaGoa3.jpg',
    'lib/images/TajExoticaResortSpaGoa4.jpg',
    'lib/images/TajExoticaResortSpaGoa5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taj Exotica Resort & Spa'),
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
                    'Taj Exotica Resort & Spa',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Benaulim',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Taj Exotica Resort & Spa in Goa earns high marks for its spacious rooms with stunning views, though some guests suggest a touch-up could be in order. The service stands out for its warmth and professionalism, with many guests appreciating the personalized attention.\n\n'
                    'Situated on the south coast of Goa on the Benaulim beach, a mere 27 km from the airport, this 56-acre 140-room resort has an 800-meter beach frontage and a lovely view of the sea. With 3 specialty restaurants, a beachfront seasonal seafood shack, a 24-hour all-day diner, 2 bars, 2 spas, and a seasonal outdoor spa pavilion, this resort is a popular haunt for international as well as domestic travelers.\n\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/nMtDv5tUc4w7mEXm6');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_TajExoticaResortSpaGoa.jpg',
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
                  'Attractions at Taj Exotica Resort & Spa',
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
      "title": "Cavatina by Avinash Martins",
      "subtitle": "Benaulim",
      "image": "lib/images/TERAS1.jpg"
    },
    {
      "title": "Benaulim pond dukle",
      "subtitle": "Benaulim",
      "image": "lib/images/TERAS2.jpg"
    },
    {
      "title": "Trinity Beach",
      "subtitle": "Benaulim",
      "image": "lib/images/TERAS3.jpg"
    },
    {
      "title": "Joecons Beach Shack",
      "subtitle": "Benaulim",
      "image": "lib/images/TERAS4.jpg"
    },
    {
      "title": "Pele's Water Sports and Activities",
      "subtitle": "Benaulim",
      "image": "lib/images/TERAS5.jpg"
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
      case 'Cavatina by Avinash Martins':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CavatinaAttraction()));
        break;
      case 'Benaulim pond dukle':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BenaulimAttraction()));
        break;
      case 'Trinity Beach':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TrinityBeachAttraction()));
        break;
      case 'Joecons Beach Shack':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => JoeconsBeachAttraction()));
        break;
      case "Pele's Water Sports and Activities":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PelesWaterAttraction()));
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}

class CavatinaAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cavatina by Avinash Martins')),
      body: Center(child: Text('Cavatina by Avinash Martins details')),
    );
  }
}

class BenaulimAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Benaulim pond dukle')),
      body: Center(child: Text('Benaulim pond dukle details')),
    );
  }
}

class TrinityBeachAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trinity Beach')),
      body: Center(child: Text('Trinity Beach details')),
    );
  }
}

class JoeconsBeachAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Joecons Beach Shack')),
      body: Center(child: Text('Joecons Beach Shack details')),
    );
  }
}

class PelesWaterAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pele's Water Sports and Activities")),
      body: Center(child: Text("Pele's Water Sports and Activities details")),
    );
  }
}
