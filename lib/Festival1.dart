import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Festival1());
}

class Festival1 extends StatelessWidget {
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
      home: SaoJao(),
    );
  }
}

class SaoJao extends StatefulWidget {
  @override
  _SaoJaoState createState() => _SaoJaoState();
}

class _SaoJaoState extends State<SaoJao> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/SaoJao1.jpg',
    'lib/images/SaoJao2.jpg',
    'lib/images/SaoJao3.jpg',
    'lib/images/SaoJao4.jpg',
    'lib/images/SaoJao5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sao Jao'),
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
                    'Sao Jao',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Festival',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'San Juanv or São João is an annual Catholic religious festival celebrated on 24th June in Goa, India. According to tradition, after attending Mass, young Goan Catholic men leap into and swim in local wells, streams, and ponds as a tribute to Saint John the Baptist.\n\n'
                    'The feast of São João is a celebration of the birth anniversary of St John the Baptiser. St John was the son of St Elizabeth, a relative of Mary, the mother of Jesus. This feast is celebrated on 24th June. The significance of this date is that it falls three months after the Feast of the Annunciation (25th March). At the Annunciation, the angel Gabriel told Mary that she would bear a son (Jesus), and that Elizabeth was already six months pregnant with a son (Luke 1:36). Mary visited Elizabeth, and when Elizabeth heard Marys greeting, the baby St John "leapt" in her womb (Luke 1:44). The Annunciation itself occurs nine months before Christmas, the feast of Jesus birth.\n\n'
                    'When John grew up, he is described as living in the wilderness, wearing clothes of camels hair, eating locusts and wild honey. John foretold the coming of the Messiah, Jesus. When Jesus was thirty years old, he was baptised by St John in the river Jordan.\n',
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
                        'lib/images/google_map_SaoJao.jpg',
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
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UrbanWoodsAttraction()));
        break;
      case 'Cafe Bhonsle':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CafeBhonsleAttraction()));
        break;
      case 'Royal Garden':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RoyalGardenAttraction()));
        break;
      case 'Hotel Menino':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HotelMeninoAttraction()));
        break;
      case 'Hotel Sungrace':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HotelSungraceAttraction()));
        break;
      case 'Silva Nagar Garden':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SilvaNagarGardenAttraction()));
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}

class UrbanWoodsAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Urban Woods')),
      body: Center(child: Text('Urban Woods details')),
    );
  }
}

class CafeBhonsleAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cafe Bhonsle')),
      body: Center(child: Text('Cafe Bhonsle details')),
    );
  }
}

class RoyalGardenAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Royal Garden')),
      body: Center(child: Text('Royal Garden details')),
    );
  }
}

class HotelMeninoAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hotel Menino')),
      body: Center(child: Text('Hotel Menino details')),
    );
  }
}

class HotelSungraceAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hotel Sungrace')),
      body: Center(child: Text('Hotel Sungrace details')),
    );
  }
}

class SilvaNagarGardenAttraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Silva Nagar Garden')),
      body: Center(child: Text('Silva Nagar Garden details')),
    );
  }
}
