import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MargaoHotel1());
}

class MargaoHotel1 extends StatelessWidget {
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
    'lib/images/mh1.1.jpg',
    'lib/images/mh1.2.jpg',
    'lib/images/mh1.3.jpg',
    'lib/images/mh1.4.jpg',
    'lib/images/mh1.5.jpg',
    'lib/images/mh1.6.jpg',
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
                    StarRating(rating: 4),
                    SizedBox(width: 8.0),
                    Text(
                      '4', // Numeric rating
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
                  'Hotel Laxmi Empire', // Display the hotel name
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia', // Example font family
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 7.0),
                Text(
                  'Railway Station, Rawanfond Cir, opposite Margao,\n Sanscar Society, Madgaon, Goa', // Display the hotel address
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontFamily: 'Roboto', // Example font family
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Hotel Laxmi Empire features a garden, shared lounge, a terrace and bar in Madgaon. Featuring a concierge service, this property also provides guests with an outdoor pool. The accommodation offers a 24-hour front desk, airport transfers, room service and free WiFi throughout the property. At the hotel, all rooms are equipped with a desk. Complete with a private bathroom equipped with a bidet, the units at Hotel Laxmi Empire have a TV and air conditioning, and some rooms come with a seating area.\n\n'
                  'At the accommodation, you will find a restaurant serving Chinese, Indian, and Italian cuisine. Vegetarian, halal, and kosher options can also be requested. Margao Railway Station is 2 km from Hotel Laxmi Empire, while Basilica Of Bom Jesus is 31 km away. The nearest airport is Dabolim Airport, 24 km from the hotel.\n',
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
                    _buildAmenityItem(Icons.restaurant, '2 Restaurants'),
                    _buildAmenityItem(
                        Icons.room_service_rounded, 'Room Services'),
                    _buildAmenityItem(Icons.wine_bar, 'Bar'),
                    _buildAmenityItem(Icons.coffee_rounded, 'Breakfast'),
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
                      'lib/images/google_map_margaohotel1.jpg',
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
                      _launchURL(
                          'https://live.ipms247.com/booking/book-rooms-hotellaxmiempire'); // Open booking URL
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
        'https://maps.app.goo.gl/rH2uov5hA7WTMV7Z8'; // Replace with actual coordinates
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      throw 'Could not launch $url';
    }
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
