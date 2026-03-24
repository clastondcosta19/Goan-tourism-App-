import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/Bomras.dart';
import 'package:goatourism/Coconut%20tree%20road%20Para.dart';
import 'package:goatourism/Fontainhas.dart';
import 'package:goatourism/Forts.dart';
import 'package:goatourism/Instagrammableplaces.dart';
import 'package:goatourism/Picnic%20Spot.dart';
import 'package:goatourism/Pousada%20by%20the%20beach.dart';
import 'package:goatourism/Resort.dart';
import 'package:goatourism/ShortsPage.dart';
import 'package:goatourism/Talukas/canacona.dart';
import 'package:goatourism/Talukas/quepem.dart';
import 'package:goatourism/Talukas/salcete.dart';
import 'package:goatourism/Talukas/sanguem.dart';
import 'package:goatourism/Talukas/tiswadi.dart';
import 'package:goatourism/UserPage.dart';
import 'package:goatourism/Waterfalls/DudhsagarWaterfall.dart';
import 'package:goatourism/Waterfalls/KesarvalWaterfall.dart';
import 'package:goatourism/beaches.dart';
import 'package:goatourism/beachesinnorthgoa.dart';
import 'package:goatourism/beachesinsouthgoa.dart';
import 'package:goatourism/butterflybeach.dart';
import 'package:goatourism/colabeach.dart';
import 'package:goatourism/culture.dart';
import 'package:goatourism/divarisland.dart';
import 'package:goatourism/events.dart';
import 'package:goatourism/farms.dart';
import 'package:goatourism/harvalemfalls.dart';
import 'package:goatourism/home_page.dart';
import 'package:goatourism/hotels.dart';
import 'package:goatourism/religiousplaces.dart';
import 'package:goatourism/restruant.dart';
import 'package:goatourism/waterfalls.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExplorePage(),
    );
  }
}

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _currentIndex = 1; // Set the current index to 2 for "Explore" page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200, // Adjust the height as needed
              child: MyListView(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Popular Tourist Spots',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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

            //Talukas Section
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Talukas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: talukas.map((taluka) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the corresponding detail page based on the tapped taluka
                      switch (taluka['title']) {
                        case 'Quepem Taluka':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Quepem()),
                          );
                          break;
                        case 'Canacona Taluka':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => canacona()),
                          );
                          break;
                        case 'Salcete Taluka':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Salcete()),
                          );
                          break;
                        case 'Sanguem Taluka':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sanguem()),
                          );
                          break;
                        case 'Tiswadi Taluka':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Tiswadi()),
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
            ),
            SizedBox(height: 20),

            //Beaches in south goa section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Beaches in South Goa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Beachessouth()),
                    );
                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // Add desired color for See All text
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Beachesinsouthgoa.map((beach) {
                  return GestureDetector(
                    onTap: () {
                      switch (beach['title']) {
                        // Access 'title' property of 'place'

                        case 'Butterfly Beach':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButterflyBeach(),
                            ),
                          );
                          break;
                        case 'Cola Beach':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ColaBeach(),
                            ),
                          );
                          break;
                        // Don't forget to break after each case
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
                                beach["image"]!,
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                beach["title"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                beach["subtitle"]!,
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
            ),
            SizedBox(height: 20),

            //Beaches in north goa section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Beaches in North Goa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BeachesNorth()),
                    );
                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // Add desired color for See All text
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Beachesinnorthgoa.map((Beaches) {
                  return GestureDetector(
                    onTap: () {
                      switch (Beaches['title']) {
                        // Access 'title' property of 'place'

                        case 'Butterfly Beach':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButterflyBeach(),
                            ),
                          );
                          break;
                        // Don't forget to break after each case
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
                                Beaches["image"]!,
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Beaches["title"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Beaches["subtitle"]!,
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
            ),
            SizedBox(height: 20),

            //Hotels Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Hotels',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hotel()),
                    );

                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // Add desired color for See All text
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Hotels.map((Hotels) {
                  return GestureDetector(
                    onTap: () {
                      switch (Hotels['title']) {
                        // Access 'title' property of 'place'

                        case 'Butterfly Beach':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButterflyBeach(),
                            ),
                          );
                          break;
                        // Don't forget to break after each case
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
                                Hotels["image"]!,
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Hotels["title"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Hotels["subtitle"]!,
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
            ),
            SizedBox(height: 20),

            //Restruant section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Restruants',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Restruant()),
                    );
                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // Add desired color for See All text
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Resturant.map((Hotels) {
                  return GestureDetector(
                    onTap: () {
                      switch (Hotels['title']) {
                        // Access 'title' property of 'place'

                        case 'Bomras':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => bomras(),
                            ),
                          );
                          break;
                        case 'Pousada by the beach':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pousadabythebeach(),
                            ),
                          );
                          break;
                        // Don't forget to break after each case
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
                                Hotels["image"]!,
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Hotels["title"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Hotels["subtitle"]!,
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
            ),
            SizedBox(height: 20),

            //Off beat location section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Off beat locations',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // Add desired color for See All text
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: OffBeatLocation.map((places) {
                  return GestureDetector(
                    onTap: () {
                      switch (places['title']) {
                        // Access 'title' property of 'place'

                        case 'Butterfly Beach':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButterflyBeach(),
                            ),
                          );
                          break;
                        case 'Fontainhas':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Fontainhas(),
                            ),
                          );
                          break;
                        case 'Divar Island':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DivarIsland(),
                            ),
                          );
                          break;
                        // Don't forget to break after each case
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
                                places["image"]!,
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                places["title"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                places["subtitle"]!,
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
            ),
            SizedBox(height: 20),

            //best places for inst
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Best Places for instagram pics',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Instagrammableplaces()),
                    );
                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // Add desired color for See All text
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: PerfectLocationForInstagramPics.map((places) {
                  return GestureDetector(
                    onTap: () {
                      switch (places['title']) {
                        // Access 'title' property of 'place'
                        case 'Coconut Tree Road Para':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CoconutTreeRoadParra(),
                            ),
                          );
                          break;
                        case 'Fontainhas':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Fontainhas(),
                            ),
                          );
                          break;
                        // Don't forget to break after each case
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
                                places["image"]!,
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                places["title"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                places["subtitle"]!,
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
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Stunning Sunset Viewpoint',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // Add desired color for See All text
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: StunningSunset.map((places) {
                  return GestureDetector(
                    onTap: () {
                      switch (places['title']) {
                        // Access 'title' property of 'place'
                        case 'Butterfly Beach':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButterflyBeach(),
                            ),
                          );
                          break;
                        // Don't forget to break after each case
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
                                places["image"]!,
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                places["title"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                places["subtitle"]!,
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
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Waterfalls',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Waterfall()),
                    );
                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // Add desired color for See All text
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: waterfalls.map((places) {
                  return GestureDetector(
                    onTap: () {
                      switch (places['title']) {
                        // Access 'title' property of 'place
                        case 'Dudhsagar Waterfall':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DudhsagarWaterfall(),
                            ),
                          );
                          break;
                        case 'Harvalem Waterfall':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Harvalemfalls(),
                            ),
                          );
                          break;
                        case 'Keserval Waterfall':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KesarvalWaterfall(),
                            ),
                          );
                          break;
                        // Don't forget to break after each case
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
                                places["image"]!,
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                places["title"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                places["subtitle"]!,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
        selectedItemColor: Colors.orange,
        unselectedItemColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              // No need to navigate if already on the ExplorePage
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
        },
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'mainItem': 'Beaches',
      'imagePath': 'lib/images/places1.jpg',
    },
    {
      'mainItem': 'Religious Places',
      'imagePath': 'lib/images/places2.jpg',
    },
    {
      'mainItem': 'Waterfalls',
      'imagePath': 'lib/images/places3.jpg',
    },
    {
      'mainItem': 'Forts',
      'imagePath': 'lib/images/places4.jpg',
    },
    {
      'mainItem': 'Farms',
      'imagePath': 'lib/images/places5.jpg',
    },
    {
      'mainItem': 'Hotels',
      'imagePath': 'lib/images/places6.jpg',
    },
    {
      'mainItem': 'Restaurants',
      'imagePath': 'lib/images/places7.jpg',
    },
    {
      'mainItem': 'Resorts',
      'imagePath': 'lib/images/places8.jpg',
    },
    {
      'mainItem': 'Culture',
      'imagePath': 'lib/images/places9.jpg',
    },
    {
      'mainItem': 'Picnic Spots',
      'imagePath': 'lib/images/places10.jpg',
    },
    {
      'mainItem': 'Events',
      'imagePath': 'lib/images/places11.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 8),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (items[index]['mainItem'] == 'Beaches') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beaches()),
                );
              } else if (items[index]['mainItem'] == 'Religious Places') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReligiousPlaces()),
                );
              } else if (items[index]['mainItem'] == 'Waterfalls') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Waterfall()),
                );
              } else if (items[index]['mainItem'] == 'Forts') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fort()),
                );
              } else if (items[index]['mainItem'] == 'Farms') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Farm()),
                );
              } else if (items[index]['mainItem'] == 'Hotels') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Hotel()),
                );
              } else if (items[index]['mainItem'] == 'Restruant') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Restruant()),
                );
              } else if (items[index]['mainItem'] == 'Events') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => events()),
                );
              } else if (items[index]['mainItem'] == 'Culture') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Culture()),
                );
              } else if (items[index]['mainItem'] == 'Events') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => events()),
                );
              } else if (items[index]['mainItem'] == 'Resorts') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Resort()),
                );
              } else if (items[index]['mainItem'] == 'Picnic Spots') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PicnicSpot()),
                );
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: Image.asset(
                      items[index]['imagePath'],
                      width: 150, // Adjusted width to match container width
                      height: 150, // Adjusted height to match container height
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index]['mainItem'],
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> imagelist = [
  'lib/images/slider1.jpg',
  'lib/images/slider2.jpg',
  'lib/images/slider3.jpg',
  'lib/images/slider4.jpg',
  'lib/images/slider5.jpg',
  'lib/images/slider6.jpg',
];

List<Map<String, String>> talukas = [
  {
    "title": "Quepem Taluka",
    "subtitle": "South Goa",
    "image": "lib/images/t1.jpg"
  },
  {
    "title": "Canacona Taluka",
    "subtitle": "South Goa",
    "image": "lib/images/t2.jpg"
  },
  {
    "title": "Salcete Taluka",
    "subtitle": "South Goa",
    "image": "lib/images/t3.jpg"
  },
  {
    "title": "Tiswadi Taluka",
    "subtitle": "North Goa",
    "image": "lib/images/t4.jpg"
  },
  {
    "title": "Ponda Taluka",
    "subtitle": "North Goa",
    "image": "lib/images/t5.jpg"
  },
  {
    "title": "Bardez Taluka",
    "subtitle": "North Goa",
    "image": "lib/images/t6.jpg"
  },
  {
    "title": "Sanguem Taluka",
    "subtitle": "South Goa",
    "image": "lib/images/t7.jpg"
  },
  {
    "title": "Dharbandora Taluka",
    "subtitle": "South Goa",
    "image": "lib/images/t8.jpg"
  },
  {
    "title": "Sattari Taluka",
    "subtitle": "North Goa",
    "image": "lib/images/t9.jpg"
  },
  {
    "title": "Mormugao Taluka",
    "subtitle": "South Goa",
    "image": "lib/images/t10.jpg"
  },
  {
    "title": "Bicholim Taluka",
    "subtitle": "North Goa",
    "image": "lib/images/t11.jpg"
  },
  {
    "title": "Pernem Taluka",
    "subtitle": "North Goa",
    "image": "lib/images/t12.jpg"
  },
];

List<Map<String, String>> Beachesinsouthgoa = [
  {
    "title": "Cola Beach",
    "subtitle": "South Goa",
    "image": "lib/images/colabeach.jpg"
  },
  {
    "title": "Butterfly Beach",
    "subtitle": "South Goa",
    "image": "lib/images/ButterflyBeach.jpg"
  },
  {
    "title": "Betalbatim Beach",
    "subtitle": "South Goa",
    "image": "lib/images/betalbatimbeach.jpg"
  },
  {
    "title": "Colva Beach",
    "subtitle": "South Goa",
    "image": "lib/images/colvabeach.jpg"
  },
  {
    "title": "Palolem Beach",
    "subtitle": "South Goa",
    "image": "lib/images/palolembeach.jpg"
  },
];

List<Map<String, String>> Beachesinnorthgoa = [
  {
    "title": "Baga Beach",
    "subtitle": "North Goa",
    "image": "lib/images/bagabeach.jpg"
  },
  {
    "title": "Calangute Beach",
    "subtitle": "North Goa",
    "image": "lib/images/calangutebeach.jpg"
  },
  {
    "title": "Arambol Beach",
    "subtitle": "North Goa",
    "image": "lib/images/arambolbeach.jpg"
  },
  {
    "title": "Miramar Beach",
    "subtitle": "North Goa",
    "image": "lib/images/miramarbeach.jpg"
  },
  {
    "title": "Mobor Beach",
    "subtitle": "North Goa",
    "image": "lib/images/morjimbeach.jpg"
  },
];

List<Map<String, String>> Hotels = [
  {
    "title": "Taj Cidade de Goa Horizon",
    "subtitle": "North Goa",
    "image": "lib/images/hotel1.0.jpg"
  },
  {
    "title": "Grand Hyatt",
    "subtitle": "North Goa",
    "image": "lib/images/hotel2.0.jpg"
  },
  {
    "title": "JW Marriott",
    "subtitle": "North Goa",
    "image": "lib/images/hotel3.0.jpg"
  },
  {
    "title": "Le Méridien",
    "subtitle": "South Goa",
    "image": "lib/images/hotel4.0.jpg"
  },
  {
    "title": "Fairfield by Marriott",
    "subtitle": "South Goa",
    "image": "lib/images/hotel5.0.jpg"
  },
];

List<Map<String, String>> Resturant = [
  {
    "title": "Bomras",
    "subtitle": "North Goa",
    "image": "lib/images/restruant1.0.jpg"
  },
  {
    "title": "Pousada by the Beach",
    "subtitle": "North Goa",
    "image": "lib/images/restruant2.0.jpg"
  },
  {
    "title": "Martins Corner",
    "subtitle": "South Goa",
    "image": "lib/images/restruant3.0.jpg"
  },
  {
    "title": "Fisherman’s Wharf",
    "subtitle": "North Goa",
    "image": "lib/images/restruant4.0.jpg"
  },
  {
    "title": "Mum's Kitchen",
    "subtitle": "North Goa",
    "image": "lib/images/restruant5.0.jpg"
  },
];

List<Map<String, String>> OffBeatLocation = [
  {
    "title": "Fontainhas",
    "subtitle": "North Goa",
    "image": "lib/images/fontinahas.jpg"
  },
  {
    "title": "Divar island",
    "subtitle": "North Goa",
    "image": "lib/images/divarisland.jpg"
  },
  {
    "title": "Butterfly Beach",
    "subtitle": "North Goa",
    "image": "lib/images/ButterflyBeach.jpg"
  },
  {
    "title": "Tiracol Fort",
    "subtitle": "North Goa",
    "image": "lib/images/TiracolFort.jpg"
  },
  {
    "title": "Mahadev Temple",
    "subtitle": "North Goa",
    "image": "lib/images/mahadevtemple.jpg"
  },
];

List<Map<String, String>> PerfectLocationForInstagramPics = [
  {
    "title": "Coconut Tree Road Para",
    "subtitle": "North Goa",
    "image": "lib/images/parraroad.jpg"
  },
  {
    "title": "Fontainhas",
    "subtitle": "North Goa",
    "image": "lib/images/fontinahas.jpg"
  },
  {
    "title": "Sazora Lake",
    "subtitle": "North Goa",
    "image": "lib/images/sazoralake.jpg"
  },
  {
    "title": "Chapora Fort",
    "subtitle": "North Goa",
    "image": "lib/images/chaporafort.jpg"
  },
  {
    "title": "Cabo de Rama",
    "subtitle": "North Goa",
    "image": "lib/images/caboderama.jpg"
  },
];

List<Map<String, String>> StunningSunset = [
  {
    "title": "Betul Beach",
    "subtitle": "North Goa",
    "image": "lib/images/betulbeach.jpg"
  },
  {
    "title": "Vagator Beach",
    "subtitle": "North Goa",
    "image": "lib/images/vagatorbeach.jpg"
  },
  {
    "title": "Sinquerim Beach",
    "subtitle": "North Goa",
    "image": "lib/images/sinquerimbeach.jpg"
  },
  {
    "title": "Cabo de Rama Beach",
    "subtitle": "North Goa",
    "image": "lib/images/caboderama.jpg"
  },
  {
    "title": "Chapora Fort",
    "subtitle": "North Goa",
    "image": "lib/images/chaporafort.jpg"
  },
];

List<Map<String, String>> waterfalls = [
  {
    "title": "Dudhsagar Waterfall",
    "subtitle": "South Goa",
    "image": "lib/images/dudhsagarwaterfall.jpg"
  },
  {
    "title": "Harvalem Waterfall",
    "subtitle": "North Goa",
    "image": "lib/images/harvalemwaterfall.jpg"
  },
  {
    "title": "Kesarval Waterfall",
    "subtitle": "South Goa",
    "image": "lib/images/keservalwaterfall.jpg"
  },
  {
    "title": "Kuskem Waterfall",
    "subtitle": "South Goa",
    "image": "lib/images/kuskemwaterfall.jpg"
  },
  {
    "title": "Arvalem Wterfall",
    "subtitle": "North Goa",
    "image": "lib/images/arvalemwaterfall.jpg"
  },
];
