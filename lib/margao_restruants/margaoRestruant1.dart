import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MargaoRestaurant1());
}

class MargaoRestaurant1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Margao Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, // Set default brightness to light
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Define dark theme
      ),
      home: MargaoRestaurantScreen(),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class MargaoRestaurantScreen extends StatefulWidget {
  @override
  _MargaoRestaurantScreenState createState() => _MargaoRestaurantScreenState();
}

class _MargaoRestaurantScreenState extends State<MargaoRestaurantScreen> {
  bool isBookmarked = false;

  final List<String> imageList = [
    'lib/images/MargaoRestaurant1.1.jpg',
    'lib/images/MargaoRestaurant1.2.jpg',
    'lib/images/MargaoRestaurant1.3.jpg',
    'lib/images/MargaoRestaurant1.4.jpg',
    'lib/images/MargaoRestaurant1.5.jpg',
    'lib/images/MargaoRestaurant1.6.jpg',
    'lib/images/MargaoRestaurant1.7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Margao Restaurant'),
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
                    'The Kitchen On Top',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'South Goa',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Restaurants in Goa, Goa Restaurants, Margao restaurants, Best Margao restaurants, South Goa restaurants, Casual Dining in Goa, Casual Dining near me, Casual Dining in South Goa, Casual Dining in Margao, in Goa, near me, in South Goa, in Margao, in Goa, near me, in South Goa, in Margao, Order food online in Margao, Order food online in Goa, Order food online in South Goa.\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      launch('https://maps.app.goo.gl/FsBQdGh2RBp6VHgv8');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/images/google_map_MargaoRestaurant.jpg',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Opening Hours:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _days.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _days[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(_times[index]),
                      );
                    },
                  ),
                ],
              ),
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

// Sample schedule data for days and times
final List<String> _days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

final List<String> _times = [
  '11:00 AM - 11:00 PM',
  'Closed',
  '11:00 AM - 11:00 PM',
  '11:00 AM - 11:00 PM',
  '11:00 AM - 11:00 PM',
  '11:00 AM - 11:00 PM',
  '11:00 AM - 11:00 PM',
];
