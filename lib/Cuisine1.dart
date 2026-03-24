import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Cuisine1());
}

class Cuisine1 extends StatelessWidget {
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
      home: SahakariSpiceFarm(),
    );
  }
}

class SahakariSpiceFarm extends StatefulWidget {
  @override
  _SahakariSpiceFarmState createState() => _SahakariSpiceFarmState();
}

class _SahakariSpiceFarmState extends State<SahakariSpiceFarm> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/SahakariSpiceFarm1.jpg',
    'lib/images/SahakariSpiceFarm2.jpg',
    'lib/images/SahakariSpiceFarm3.jpg',
    'lib/images/SahakariSpiceFarm4.jpg',
    'lib/images/SahakariSpiceFarm5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sahakari Spice Farm'),
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
                    'Fish Curry Rice',
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
                    'Although Goan cuisine finds its roots in the Konkani food, but it carries a lot of influence of Sultanate & Portuguese rule. For over four centuries, Goa was ruled by the Portuguese and for brief periods the state turned into Muslim and Hindu kingdoms and the influences of all these cultures are palpable in Goan cuisine.\n\n'
                    'Fish: Fish is an excellent source of protein, vitamins, and minerals. Its particularly rich in omega-3 fatty acids, which are beneficial for heart health. The specific nutritional content can vary depending on the type of fish used.\n'
                    'Curry: The curry sauce typically contains spices such as turmeric, cumin, coriander, and chili peppers. These spices not only add flavor but also offer various health benefits. Turmeric, for example, contains curcumin, which has anti-inflammatory properties.\n'
                    'Rice: Rice is a staple carbohydrate in many cuisines. It provides energy in the form of carbohydrates and also contains some protein and small amounts of vitamins and minerals.\n\n'
                    'A multi-cuisine restaurant based in Goa renowned for its seafood & Goan Thali since 1978. Experience the best of Goan, Indian & Oriental cuisine at Ritz Classic Panjim. Armed with his secret recipe in hand, Rohidas “Daad” Dessai made the short journey from his ancestral village in Cuncolim (South Goa) to set up his restaurant, Cafe Ritz Restaurant & Bar in Panjim.\n',
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
                        'lib/images/google_map_SahakariSpiceFarm.jpg',
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
            MaterialPageRoute(builder: (context) => UrbanWoods()));
        break;
      case 'Cafe Bhonsle':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CafeBhonsle()));
        break;
      case 'Royal Garden':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RoyalGarden()));
        break;
      case 'Hotel Menino':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HotelMenino()));
        break;
      case 'Hotel Sungrace':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HotelSungrace()));
        break;
      case 'Silva Nagar Garden':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SilvaNagarGarden()));
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}

// Placeholder classes for attraction detail pages
class UrbanWoods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urban Woods'),
      ),
      body: Center(
        child: Text('Urban Woods Page'),
      ),
    );
  }
}

class CafeBhonsle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafe Bhonsle'),
      ),
      body: Center(
        child: Text('Cafe Bhonsle Page'),
      ),
    );
  }
}

class RoyalGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Royal Garden'),
      ),
      body: Center(
        child: Text('Royal Garden Page'),
      ),
    );
  }
}

class HotelMenino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Menino'),
      ),
      body: Center(
        child: Text('Hotel Menino Page'),
      ),
    );
  }
}

class HotelSungrace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Sungrace'),
      ),
      body: Center(
        child: Text('Hotel Sungrace Page'),
      ),
    );
  }
}

class SilvaNagarGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Silva Nagar Garden'),
      ),
      body: Center(
        child: Text('Silva Nagar Garden Page'),
      ),
    );
  }
}
