import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(HotelPage2());
}

class HotelPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
                // Implement bookmark functionality
              },
            ),
          ],
        ),
        body: HotelDetails(),
      ),
    );
  }
}

class HotelDetails extends StatelessWidget {
  final List<String> imageList = [
    'lib/images/hotel2.0.jpg',
    'lib/images/hotel2.1.jpg',
    'lib/images/hotel2.2.jpg',
    'lib/images/hotel2.3.jpg',
    'lib/images/hotel2.4.jpg',
    'lib/images/hotel2.5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: imageList.map((image) {
              return Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    StarRating(rating: 5),
                    SizedBox(width: 8.0),
                    Text(
                      '5.0', // Numeric rating
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                        fontFamily: 'Arial', // Example font family
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Text(
                  'Grand Hyatt Goa', // Display the hotel name
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia', // Example font family
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 7.0),
                Text(
                  'P.O.Goa University, 403206 Bambolim, Goa', // Display the hotel address
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontFamily: 'Roboto', // Example font family
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 7.0),
                Text(
                  'Grand Hyatt Goa is an enchanting destination resort and spa set on the calm waters of Bambolim Bay in North Goa, seven km from the capital of Panaji and 25 km from Dabolim Airport. Inspired by a 17th century Indo-Portuguese palace, the resort is spread over 28 acres of colourful, tropical gardens and lush lawns that roll down to the water’s edge. Grand Hyatt Goa presents spectacular views from several of its rooms, suites and restaurants. With a wide selection of authentic cuisines and flavours from different parts of the world, the resort’s several restaurants welcome guests with the traditional warmth of a Goan residence. An extensive spa and fitness centre, indoor and outdoor swimming pools and Camp Hyatt facilities for kids offer a complete recreational and wellness experience for couples, friends and the entire family throughout the year.\n',
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'Arial'), // Example font family
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Facilities Provided',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia', // Example font family
                  ),
                ),
                SizedBox(height: 8.0),
                Column(
                  children: [
                    _buildAmenityItem(Icons.pool, 'Outdoor Swimming Pool'),
                    _buildAmenityItem(Icons.wifi, 'Free Wifi'),
                    _buildAmenityItem(Icons.airport_shuttle, 'Airport Shuttle'),
                    _buildAmenityItem(Icons.family_restroom, 'Family rooms'),
                    _buildAmenityItem(Icons.spa, 'Spa & Wellness center'),
                    _buildAmenityItem(Icons.fitness_center, 'Fitness Center'),
                    _buildAmenityItem(
                        Icons.room_service_rounded, 'Room Services'),
                    _buildAmenityItem(
                        Icons.coffee_maker, 'Tea/Coffe maker in all Room'),
                    _buildAmenityItem(Icons.wine_bar, 'Bar'),
                    _buildAmenityItem(
                        Icons.coffee_rounded, 'Fabulous breakfast'),
                  ],
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    launchMap(); // Open Google Maps
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'lib/images/google_map_cumbarjuacanal.jpg',
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0, // Set desired height
                  child: ElevatedButton(
                    onPressed: () {
                      launchBooking(); // Implement booking functionality
                    },
                    child: Text(
                      'BOOK HOTEL',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Arial', // Example font family
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.blue,
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Arial', // Example font family
            ),
          ),
        ],
      ),
    );
  }

  void launchMap() async {
    const url =
        'https://maps.app.goo.gl/3ecUGru3q4Lm23j87'; // Replace with actual coordinates
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchBooking() {
    // Implement booking functionality
    print('Booking button pressed!');
  }
}

class StarRating extends StatelessWidget {
  final int rating;

  const StarRating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            rating,
            (index) => Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
          ),
        ),
        SizedBox(width: 4.0),
      ],
    );
  }
}
