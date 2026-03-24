import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Festival2());
}

class Festival2 extends StatelessWidget {
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
      home: Sangodd(),
    );
  }
}

class Sangodd extends StatefulWidget {
  @override
  _SangoddState createState() => _SangoddState();
}

class _SangoddState extends State<Sangodd> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/Sangodd1.jpg',
    'lib/images/Sangodd2.jpg',
    'lib/images/Sangodd3.jpg',
    'lib/images/Sangodd4.jpg',
    'lib/images/Sangodd5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sangodd'),
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
                    'Sangodd',
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
                    'The Sangodd Festival, celebrated with great enthusiasm in Goa, is a captivating cultural event that pays homage to Saint Peter, the patron saint of fishermen. Held annually on June 29th, aligning with the feast day of Saints Peter and Paul, this vibrant festival is particularly cherished by the coastal communities of Goa. Among the various villages that partake in the celebrations, Cumbharjua, Marcel, and Assolna are known for hosting some of the grandest and most spectacular festivities.\n\n'
                    'The festivities commence with an impressive boat procession. These boats are meticulously adorned with a riot of colors, including vivid flowers, twinkling lights, and religious symbols. Amid this nautical parade, one boat stands out with its elaborate stage, where a priest conducts a ceremonial blessing for the boats and the fishermen who steer them.\n\n'
                    'Following the blessing ceremony, an air of jubilation sweeps through the festival grounds. Music fills the air, and people break into spontaneous dance, celebrating the bounty of the sea. Food plays a central role in the festivities, as families and communities come together to share sumptuous feasts. However, the crowning jewel of the Sangodd Festival is undoubtedly the boat race. Teams of skilled fishermen participate in an exhilarating race down the river, striving for the honor of receiving Saint Peters blessings for an abundant and safe fishing season.\n',
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
                        'lib/images/google_map_Sangodd.jpg',
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
                  'Attractions at Sangodd',
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
      "title": "Benz Wax Museum",
      "subtitle": "Old Goa",
      "image": "lib/images/benz_wax_museum.jpg"
    },
    {
      "title": "Blue Marine Resort",
      "subtitle": "Agonda Beach",
      "image": "lib/images/blue_marine_resort.jpg"
    },
    {
      "title": "La Mer Beach Resorts",
      "subtitle": "Calangute Beach",
      "image": "lib/images/la_mer_beach_resorts.jpg"
    },
    {
      "title": "Ratna Sagar Restaurant",
      "subtitle": "Panaji",
      "image": "lib/images/ratna_sagar_restaurant.jpg"
    },
    {
      "title": "Souza Lobo",
      "subtitle": "Calangute Beach",
      "image": "lib/images/souza_lobo.jpg"
    },
    {
      "title": "St. Alex Church",
      "subtitle": "Calangute",
      "image": "lib/images/st_alex_church.jpg"
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
      case 'Benz Wax Museum':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BenzWaxMuseum()));
        break;
      case 'Blue Marine Resort':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BlueMarineResort()));
        break;
      case 'La Mer Beach Resorts':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LaMerBeachResorts()));
        break;
      case 'Ratna Sagar Restaurant':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RatnaSagarRestaurant()));
        break;
      case 'Souza Lobo':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SouzaLobo()));
        break;
      case 'St. Alex Church':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StAlexChurch()));
        break;
      // Add cases for other attractions here
      default:
        // Handle unknown attractions or add custom logic
        break;
    }
  }
}

// Placeholder classes for attraction detail pages
class BenzWaxMuseum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Benz Wax Museum')),
      body: Center(child: Text('Benz Wax Museum details')),
    );
  }
}

class BlueMarineResort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blue Marine Resort')),
      body: Center(child: Text('Blue Marine Resort details')),
    );
  }
}

class LaMerBeachResorts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('La Mer Beach Resorts')),
      body: Center(child: Text('La Mer Beach Resorts details')),
    );
  }
}

class RatnaSagarRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ratna Sagar Restaurant')),
      body: Center(child: Text('Ratna Sagar Restaurant details')),
    );
  }
}

class SouzaLobo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Souza Lobo')),
      body: Center(child: Text('Souza Lobo details')),
    );
  }
}

class StAlexChurch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('St. Alex Church')),
      body: Center(child: Text('St. Alex Church details')),
    );
  }
}
