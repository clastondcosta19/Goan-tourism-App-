import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(bomras());
}

class bomras extends StatelessWidget {
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
      home: BomrasScreen(),
    );
  }
}

class BomrasScreen extends StatefulWidget {
  @override
  _BomrasScreenState createState() => _BomrasScreenState();
}

class _BomrasScreenState extends State<BomrasScreen> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/Bomras1.jpg',
    'lib/images/Bomras2.jpg',
    'lib/images/Bomras3.jpg',
    'lib/images/Bomras4.jpg',
    'lib/images/Bomras5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bomras'),
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
                    'Bomras',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Anjuna',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Bomras is an F&B-Nightlife outlet located in the heart of the city. It offers a unique experience with its modern and vibrant atmosphere. The menu features a variety of dishes from around the world, including Thai, Indian, and Chinese cuisines. The bar offers a wide selection of drinks, from classic cocktails to craft beers. The venue also features live music and DJs, making it the perfect spot for a night out. With its friendly staff and great atmosphere, Bomras is the perfect place to enjoy a night out with friends.\n\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/hCFhwJugL85QX2Yw8');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_Bomras.jpg',
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
                  'Attractions at Bomras',
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
      "title": "Parijaat Goa",
      "subtitle": "Anjuna",
      "image": "lib/images/BMS1.jpg"
    },
    {
      "title": "The Orange House",
      "subtitle": "Anjuna",
      "image": "lib/images/BMS2.jpg"
    },
    {
      "title": "Bhumika Temple",
      "subtitle": "Anjuna",
      "image": "lib/images/BMS3.jpg"
    },
    {
      "title": "Splashdown Waterpark",
      "subtitle": "Anjuna",
      "image": "lib/images/BMS4.jpg"
    },
    {
      "title": "Goa Karting",
      "subtitle": "Anjuna",
      "image": "lib/images/BMS5.jpg"
    },
    {
      "title": "Fairfield by Marriott Goa Anjuna",
      "subtitle": "Anjuna",
      "image": "lib/images/BMS6.jpg"
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
      case 'Parijaat Goa':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ParijaatGoaScreen()),
        );
        break;
      case 'The Orange House':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrangeHouseScreen()),
        );
        break;
      case 'Bhumika Temple':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BhumikaTempleScreen()),
        );
        break;
      case 'Splashdown Waterpark':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplashdownScreen()),
        );
        break;
      case 'Goa Karting':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GoaKartingScreen()),
        );
        break;
      case 'Fairfield by Marriott Goa Anjuna':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FairfieldScreen()),
        );
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}

// Define screens for each attraction detail page (replace with actual screens)
class ParijaatGoaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parijaat Goa')),
      body: Center(child: Text('Parijaat Goa details')),
    );
  }
}

class OrangeHouseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Orange House')),
      body: Center(child: Text('The Orange House details')),
    );
  }
}

class BhumikaTempleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bhumika Temple')),
      body: Center(child: Text('Bhumika Temple details')),
    );
  }
}

class SplashdownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Splashdown Waterpark')),
      body: Center(child: Text('Splashdown Waterpark details')),
    );
  }
}

class GoaKartingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Goa Karting')),
      body: Center(child: Text('Goa Karting details')),
    );
  }
}

class FairfieldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fairfield by Marriott Goa Anjuna')),
      body: Center(child: Text('Fairfield by Marriott details')),
    );
  }
}
