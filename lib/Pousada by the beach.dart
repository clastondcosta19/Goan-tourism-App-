import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Pousadabythebeach());
}

class Pousadabythebeach extends StatelessWidget {
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
      home: PousadaByTheBeachScreen(),
    );
  }
}

class PousadaByTheBeachScreen extends StatefulWidget {
  @override
  _PousadaByTheBeachScreenState createState() => _PousadaByTheBeachScreenState();
}

class _PousadaByTheBeachScreenState extends State<PousadaByTheBeachScreen> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/Pousadabythebeach1.jpg',
    'lib/images/Pousadabythebeach2.jpg',
    'lib/images/Pousadabythebeach3.jpg',
    'lib/images/Pousadabythebeach4.jpg',
    'lib/images/Pousadabythebeach5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pousada by the Beach'),
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
                    'Pousada by the Beach',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Calangute',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Pousada by the Beach in Calangute, Goa, is a beachside restaurant offering a laid-back and relaxed atmosphere with stunning ocean views. Enjoy colorful decor, comfortable seating, and live music during peak seasons.\n\n'
                    'The menu features diverse cuisine blending Portuguese, Indian, and international influences. Expect fresh seafood like grilled fish and prawn curry, alongside Goan specialties such as vindaloo and xacuti.\n\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/9tjzxwDzSSeGo2xB6');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_Pousadabythebeach.jpg',
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
                  'Attractions at Pousada by the Beach',
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
      "title": "The Park Calangute Goa",
      "subtitle": "Calangute",
      "image": "lib/images/PBTB1.jpg"
    },
    {
      "title": "Elrow Ocean Front",
      "subtitle": "Calangute",
      "image": "lib/images/PBTB2.jpg"
    },
    {
      "title": "Aqua Marina Beach Resort Goa",
      "subtitle": "Calangute",
      "image": "lib/images/PBTB3.jpg"
    },
    {
      "title": "Resort Terra Paraiso",
      "subtitle": "Calangute",
      "image": "lib/images/PBTB4.jpg"
    },
    {
      "title": "Yashdeep",
      "subtitle": "Calangute",
      "image": "lib/images/PBTB5.jpg"
    },
    {
      "title": "Lillywoods Zac Beach Resort",
      "subtitle": "Calangute",
      "image": "lib/images/PBTB6.jpg"
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
      case 'The Park Calangute Goa':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CalanguteAttractions1()));
        break;
      case 'Elrow Ocean Front':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CalanguteAttractions2()));
        break;
      case 'Aqua Marina Beach Resort Goa':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CalanguteAttractions3()));
        break;
      case 'Resort Terra Paraiso':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CalanguteAttractions4()));
        break;
      case 'Yashdeep':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CalanguteAttractions5()));
        break;
      case 'Lillywoods Zac Beach Resort':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CalanguteAttractions6()));
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}

// Define screens for each attraction detail page (replace with actual screens)
class CalanguteAttractions1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Park Calangute Goa')),
      body: Center(child: Text('The Park Calangute Goa details')),
    );
  }
}

class CalanguteAttractions2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Elrow Ocean Front')),
      body: Center(child: Text('Elrow Ocean Front details')),
    );
  }
}

class CalanguteAttractions3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aqua Marina Beach Resort Goa')),
      body: Center(child: Text('Aqua Marina Beach Resort Goa details')),
    );
  }
}

class CalanguteAttractions4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resort Terra Paraiso')),
      body: Center(child: Text('Resort Terra Paraiso details')),
    );
  }
}

class CalanguteAttractions5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yashdeep')),
      body: Center(child: Text('Yashdeep details')),
    );
  }
}

class CalanguteAttractions6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lillywoods Zac Beach Resort')),
      body: Center(child: Text('Lillywoods Zac Beach Resort details')),
    );
  }
}
