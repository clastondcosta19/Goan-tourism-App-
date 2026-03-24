import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goatourism/Beaches/bagabeach.dart';
import 'package:goatourism/Sanguem.dart';
import 'package:goatourism/Sattari.dart';
import 'package:goatourism/calangute.dart';
import 'package:goatourism/Mapusa.dart';
import 'package:goatourism/Ponda.dart';
import 'package:goatourism/Talukas/canacona.dart';
import 'package:goatourism/butterflybeach.dart';
import 'package:goatourism/calangutebeach.dart';
import 'package:goatourism/ExplorePage.dart';
import 'package:goatourism/ShortsPage.dart';
import 'package:goatourism/colabeach.dart';
import 'package:goatourism/cumbarjuacanal.dart';
import 'package:goatourism/margao.dart';
import 'package:goatourism/panjim.dart';
import 'package:goatourism/quepem1.dart';
import 'UserPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User = FirebaseAuth.instance.currentUser!;

  int _selectedIndex = 0;

  final List<Color> _bottomNavigationItemColors = [
    Colors.black, // Home
    Colors.black, // Wishlists
    Colors.black, // Shorts
    Colors.black, // Explore
    Colors.black, // User
  ];

  final List<Color> _activeBottomNavigationItemColors = [
    Colors.orange, // Home
    Colors.orange, // Wishlists
    Colors.orange, // Explore
    Colors.orange, // Shorts
    Colors.orange, // User
  ];

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  List<String> imagelist = [
    'lib/images/slide1.jpg',
    'lib/images/slide2.jpg',
    'lib/images/slide3.jpg',
    'lib/images/slide4.jpg',
    'lib/images/slide5.jpg',
  ];

  List<Map<String, String>> talukas = [
    {
      "title": "Margao",
      "subtitle": "South Goa",
      "image": "lib/images/margao.jpg"
    },
    {
      "title": "Panjim",
      "subtitle": "North Goa",
      "image": "lib/images/panjim.jpg"
    },
    {
      "title": "Canacona",
      "subtitle": "South Goa",
      "image": "lib/images/Cancona.jpg"
    },
    {
      "title": "Calangute",
      "subtitle": "North Goa",
      "image": "lib/images/calangute.jpg"
    },
    {
      "title": "Ponda",
      "subtitle": "North Goa",
      "image": "lib/images/ponda.jpg"
    },
    {
      "title": "Quepem",
      "subtitle": "South Goa",
      "image": "lib/images/Quepem.jpg"
    },
    {
      "title": "Mapusa",
      "subtitle": "North Goa",
      "image": "lib/images/mapusa.jpg"
    },
    {
      "title": "Sanguem",
      "subtitle": "South Goa",
      "image": "lib/images/sanguem.jpg"
    },
    {
      "title": "Sattari",
      "subtitle": "North Goa",
      "image": "lib/images/sattari.jpg"
    },
    {
      "title": "Dharbandora",
      "subtitle": "South Goa",
      "image": "lib/images/dharbandora.jpg"
    },
    {
      "title": "Bicholim",
      "subtitle": "North Goa",
      "image": "lib/images/bicholim.jpg"
    },
    {
      "title": "Vasco",
      "subtitle": "South Goa",
      "image": "lib/images/Vasco.jpg"
    },
  ];

  List<Map<String, String>> popularPlaces = [
    {
      "title": "Calangute Beach",
      "subtitle": "North Goa",
      "image": "lib/images/p1.jpg"
    },
    {
      "title": "Baga Beach",
      "subtitle": "North Goa",
      "image": "lib/images/p2.jpg"
    },
    {
      "title": "Agonda Beach",
      "subtitle": "South Goa",
      "image": "lib/images/p5.jpg"
    },
    {
      "title": "Basilica of Bom Jesus",
      "subtitle": "North Goa",
      "image": "lib/images/p6.jpg"
    },
    {
      "title": "Fort Aguada",
      "subtitle": "North Goa",
      "image": "lib/images/p7.jpg"
    },
    {
      "title": "Se Cathedral",
      "subtitle": "North Goa",
      "image": "lib/images/p8.jpg"
    },
    {
      "title": "Shantadurga Temple",
      "subtitle": "North Goa",
      "image": "lib/images/p9.jpg"
    },
    {
      "title": "Dudhsagar Waterfalls",
      "subtitle": "South Goa",
      "image": "lib/images/p10.jpg"
    },
    {
      "title": "Divar Island",
      "subtitle": "North Goa",
      "image": "lib/images/p11.jpg"
    },
    {
      "title": "Saturday Night Market",
      "subtitle": "North Goa",
      "image": "lib/images/p12.jpg"
    },
    {
      "title": "Casino crusise",
      "subtitle": "North Goa",
      "image": "lib/images/p13.jpg"
    },
  ];

  List<Map<String, String>> upcomingEvents = [
    {"image": "lib/images/c1.jpg"},
    {"image": "lib/images/c2.jpg"},
    {"image": "lib/images/c3.jpg"},
    {"image": "lib/images/c4.jpg"},
    {"image": "lib/images/c5.jpg"},
    {"image": "lib/images/c6.jpg"},
    {"image": "lib/images/c7.jpg"},
    {"image": "lib/images/c8.jpg"},
    {"image": "lib/images/c9.jpg"},
  ];

  List<Map<String, String>> hiddenPlacesNorthGoa = [
    {
      "title": "Cumbarjua Canal",
      "subtitle": "Cumbarjua",
      "image": "lib/images/n1.jpg"
    },
    {
      "title": "Harvalem Falls",
      "subtitle": "Sanquelim",
      "image": "lib/images/n2.jpg"
    },
    {
      "title": "Dr Salim Ali Bird Santcuary",
      "subtitle": "Ribandar",
      "image": "lib/images/n3.jpg"
    },
    {
      "title": "Arvalem Caves",
      "subtitle": "Sanquelim",
      "image": "lib/images/n4.jpg"
    },
    {
      "title": "Vanxim Island",
      "subtitle": "IIhas Region",
      "image": "lib/images/n5.jpg"
    },
    {
      "title": "Sahakari Spice Farm",
      "subtitle": "Ponda",
      "image": "lib/images/n6.jpg"
    },
    {
      "title": "Querim Beach",
      "subtitle": "Pernem",
      "image": "lib/images/n7.jpg"
    },
  ];

  List<Map<String, String>> hiddenPlacesSouthGoa = [
    {"title": "Cola Beach", "subtitle": "Cola", "image": "lib/images/s1.jpg"},
    {
      "title": "Bamanbudo Waterfalls",
      "subtitle": "Gaodongrem",
      "image": "lib/images/s2.jpg"
    },
    {
      "title": "Netravali Bubbling Lake",
      "subtitle": "Neturlim",
      "image": "lib/images/s3.jpg"
    },
    {
      "title": "Rivona Buddhist Caves",
      "subtitle": "Rivona",
      "image": "lib/images/s4.jpg"
    },
    {
      "title": "Netravali Waterfalls",
      "subtitle": "Netravali",
      "image": "lib/images/s5.jpg"
    },
    {
      "title": "Galgibaga Beach",
      "subtitle": "Canacona",
      "image": "lib/images/s6.jpg"
    },
    {
      "title": "Mollem National Park",
      "subtitle": "Mollem",
      "image": "lib/images/s7.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Goa Tourism',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
              ),
            ),
            IconButton(
              onPressed: signUserOut,
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: imagelist
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                e,
                                height: 200,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  height: 250,
                ),
              ),
              SizedBox(height: 20), // Add space below CarouselSlider
              SizedBox(height: 10), // Add space above "Talukas" text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Places in Goa',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: talukas.map((taluka) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the corresponding taluka page
                        switch (taluka["title"]) {
                          case "Margao":
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Margao()),
                            );
                            break;
                          case "Panjim":
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Panjim()),
                            );
                            break;
                          case "Canacona":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => canacona()),
                            );
                            break;
                          case "Calangute":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calangute()),
                            );
                            break;
                          case "Ponda":
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Ponda()),
                            );
                            break;
                          case "Quepem":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Quepem1()),
                            );
                            break;
                          case "Mapusa":
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Mapusa()),
                            );
                            break;
                          case "Sanguem":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sanguem()),
                            );
                            break;
                          case "Sattari":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sattari()),
                            );
                            break;
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  taluka["image"]!,
                                  height: 200,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  taluka["title"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  taluka["subtitle"]!,
                                  style: TextStyle(
                                    fontSize: 13,
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
              ),

              // Similar modifications for other carousel sliders...
              // Add carousel sliders for other categories

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Most Popular Places',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: popularPlaces.map((place) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the corresponding detail page based on the tapped taluka
                        switch (place['title']) {
                          case 'Calangute Beach':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalanguteBeach()),
                            );
                            break;
                          case 'Baga Beach':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BagaBeach()),
                            );
                            break;
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  place["image"]!,
                                  height: 200,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  place["title"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  place["subtitle"]!,
                                  style: TextStyle(
                                    fontSize: 13,
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
              ),

              // Similar modifications for other carousel sliders...
              // Add carousel sliders for upcoming events, hidden places, etc.
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Upcoming Events in Goa',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              CarouselSlider(
                items: upcomingEvents
                    .map((event) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                event["image"]!,
                                height: 200,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  height: 200,
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Hidden Places in North Goa',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: hiddenPlacesNorthGoa.map((place) {
                    return GestureDetector(
                      onTap: () {
                        switch (place['title']) {
                          // Access 'title' property of 'place'
                          case 'Cumbarjua Canal':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CumbarjuaCanal(),
                              ),
                            );
                            break; // Don't forget to break after each case
                          // Add more cases for other places if needed
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  place["image"]!,
                                  height: 200,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  place["title"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  place["subtitle"]!,
                                  style: TextStyle(
                                    fontSize: 13,
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
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Hidden Places in South Goa',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: hiddenPlacesSouthGoa.map((place) {
                    return GestureDetector(
                      onTap: () {
                        switch (place['title']) {
                          // Access 'title' property of 'place'
                          case 'Cola Beach':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ColaBeach(),
                              ),
                            );
                            break;
                          case 'Butterfly Beach':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButterflyBeach(),
                              ),
                            );
                            break; // Don't forget to break after each case
                          // Add more cases for other places if needed
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  place["image"]!,
                                  height: 200,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  place["title"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  place["subtitle"]!,
                                  style: TextStyle(
                                    fontSize: 13,
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Glimpses of Goa',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 250, // Set the height of the CarouselSlider
                      child: CarouselSlider(
                        items: [
                          buildImageWithOverlay(
                            'lib/images/quote1.jpg',
                            '"A RECIPE NO SOUL you as the Cook MUST BRING SOUL TO THE RECIPE."',
                            '-THOMAS KELLER',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote2.jpg',
                            '"Sky Above, Sand Below And Peace Within."',
                            '-Bhumi Manraja',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote3.jpg',
                            '"Dance is an art, Paint your dream and follow it."',
                            '-Steven Thompson',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote4.jpg',
                            '"Festivals are the positive vibes which always bring a new beginning!."',
                            '-Shreya Shanbhag',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote5.jpg',
                            '"Chruch is a place of mercy and hope, every one is welcomed, loved and forgiven."',
                            '-Pope Francis',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote6.jpg',
                            '"What you leave behind is not what is graved in stone monuments, but what is woven into the lives of others."',
                            '-Brainy Quotes',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote7.jpg',
                            '"Mosque: A Divine Place To Seel Allah the Merciful."',
                            '-Quaran',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote8.jpg',
                            '"Festivals are the positive vibes which always bring a new beginning!"',
                            '-Shreya Shanbhag',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote9.jpg',
                            '"Beutiful places are almost alive! when you visit them, you can feel their breaths!."',
                            '-Mehmel Mural Hdan',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote10.jpg',
                            '"Forts speak out the stories of strength and valour."',
                            '',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote11.jpg',
                            '"Temples are an expression of gods love."',
                            '-Jean A. Steven',
                          ),
                          buildImageWithOverlay(
                            'lib/images/quote12.jpg',
                            '"Be kind to every kind, not just mankind."',
                            '-Anthony Douglas Williams',
                          ),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8, // Adjust as needed
                          aspectRatio: 16 / 9, // Adjust as needed
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).brightness == Brightness.light
            ? _activeBottomNavigationItemColors[_selectedIndex]
            : Colors.orange,
        unselectedItemColor: Theme.of(context).brightness == Brightness.light
            ? _bottomNavigationItemColors[_selectedIndex]
            : Colors.white,
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ExplorePage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShortsPage()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
              break;
            default:
              break;
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

Widget buildImageWithOverlay(String imagePath, String title, String author) {
  return Stack(
    children: [
      Image.asset(
        imagePath,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                author,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget buildCard(String imagePath, String title, String author) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 220, // Increase the width to accommodate the increased image size
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            height: 220, // Increase the height to match the width
            width: 220, // Increase the width to match the height
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    author,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// DetailPage widget for displaying detailed information
class DetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const DetailPage({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
