import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(margaohotel6());
}

class margaohotel6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Page',
      theme: ThemeData.light(), // Default theme is light
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system, // System theme mode
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: HotelPage(),
    );
  }
}

class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final List<String> imageList = [
    'lib/images/hotel1.0.jpg',
    'lib/images/hotel1.1.jpg',
    'lib/images/hotel1.2.jpg',
    'lib/images/hotel1.3.jpg',
    'lib/images/hotel1.4.jpg',
    'lib/images/hotel1.5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hotel Name',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Handle bookmark action
            },
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Located in',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Grand Hyatt',
                          style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text('4.5',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Roboto')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5),
                      Text(
                        'Hotel Address',
                        style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  launch('https://maps.app.goo.gl/3qr3xo1NmwPe3J8B9');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'lib/images/google_map_ColaBeach.jpg',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amenities',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAmenityIcon(Icons.wifi, 'Free Wi-Fi'),
                      _buildAmenityIcon(Icons.pool, 'Swimming Pool'),
                      _buildAmenityIcon(Icons.local_parking, 'Parking'),
                      _buildAmenityIcon(Icons.restaurant, 'Restaurant'),
                      _buildAmenityIcon(Icons.room_service, 'Room Service'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildPriceItem('Room 1: \$100'),
                        _buildPriceItem('Room 2: \$120'),
                        _buildPriceItem('Room 3: \$150'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle book hotel
                },
                child: Text('Book Hotel',
                    style: TextStyle(fontSize: 18, fontFamily: 'Roboto')),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenityIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 30),
        SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
        ),
      ],
    );
  }

  Widget _buildPriceItem(String price) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(price, style: TextStyle(fontSize: 16, fontFamily: 'Roboto')),
    );
  }
}
