import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Resort2());
}

class Resort2 extends StatelessWidget {
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
      home: TajFortAguadaResortSpa(),
    );
  }
}

class TajFortAguadaResortSpa extends StatefulWidget {
  @override
  _TajFortAguadaResortSpaState createState() => _TajFortAguadaResortSpaState();
}

class _TajFortAguadaResortSpaState extends State<TajFortAguadaResortSpa> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/TajFortAguadaResortSpa1.jpg',
    'lib/images/TajFortAguadaResortSpa2.jpg',
    'lib/images/TajFortAguadaResortSpa3.jpg',
    'lib/images/TajFortAguadaResortSpa4.jpg',
    'lib/images/TajFortAguadaResortSpa5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taj Fort Aguada Resort & Spa'),
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
                    'Taj Fort Aguada Resort & Spa',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Candolim',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'The Taj Fort Aguada Resort & Spa in Goa garners high marks for its spotless environment and exceptional service, with staff members who go above and beyond to create memorable experiences. The resort\'s atmosphere oozes elegance, complete with live music and a luxurious vibe.\n\n'
                    'Taj Fort Aguada Resort & Spa, Goa, spreading across a picturesque 42 acres, meanders into the ramparts of the 17th century Portuguese coastal fort. The resort spreads on the seafront along the Sinquerim to Calangute beach stretch. It is an hour and a half drive from the airport.\n\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/QXmDncjtvpXkTYCP8');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_TajFortAguadaResortSpa.jpg',
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
                  'Attractions at Taj Fort Aguada Resort & Spa',
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
      "title": "Sinquerim Fort",
      "subtitle": "Candolim",
      "image": "lib/images/TFARS1.jpg"
    },
    {
      "title": "Sinquerim Fort",
      "subtitle": "Candolim",
      "image": "lib/images/TFARS2.jpg"
    },
    {
      "title": "Wok & Roll Restaurant",
      "subtitle": "Candolim",
      "image": "lib/images/TFARS3.jpg"
    },
    {
      "title": "Shiv Mandir Nerul",
      "subtitle": "Candolim",
      "image": "lib/images/TFARS4.jpg"
    },
    {
      "title": "Sinq Night Club",
      "subtitle": "Candolim",
      "image": "lib/images/TFARS5.jpg"
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
      case 'Sinquerim Fort':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SinquerimFortAttraction()));
        break;
      case 'Wok & Roll Restaurant':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WokRollRestaurantAttraction()));
        break;
      case 'Shiv Mandir Nerul':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShivMandirNerulAttraction()));
        break;
      case 'Sinq Night Club':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SinqNightClubAttraction()));
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}

class SinquerimFortAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sinquerim Fort')),
      body: Center(child: Text('Sinquerim Fort details')),
    );
  }
}

class WokRollRestaurantAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wok & Roll Restaurant')),
      body: Center(child: Text('Wok & Roll Restaurant details')),
    );
  }
}

class ShivMandirNerulAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shiv Mandir Nerul')),
      body: Center(child: Text('Shiv Mandir Nerul details')),
    );
  }
}

class SinqNightClubAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sinq Night Club')),
      body: Center(child: Text('Sinq Night Club details')),
    );
  }
}
