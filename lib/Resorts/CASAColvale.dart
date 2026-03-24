import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class CASAColvale extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/CASAColvale (1).jpg',
    'assets/images/CASAColvale (2).jpg',
    'assets/images/CASAColvale (3).jpg',
    'assets/images/CASAColvale (4).jpg',
  ];

  final List<Map<String, String>> talukas = [
    {
      "title": "Chaporakayaking",
      "subtitle": "North Goa",
      "image": "assets/images/chaporakayaking.jpg"
    },
    {
      "title": "St. Francis of Assisi Church",
      "subtitle": "North Goa",
      "image": "assets/images/St.FrancisofAssisiChurch.jpg"
    },
    {
      "title": "Chapora Fort",
      "subtitle": "North Goa",
      "image": "assets/images/ChaporaFort.jpg"
    },
    {
      "title": "Thalassa",
      "subtitle": "North Goa",
      "image": "assets/images/Thalassa.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Implement your bookmark functionality here
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
                    'CASA Colvale',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20),
                      SizedBox(width: 4),
                      Text(
                        'North Goa',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Tucked away down a narrow red mud lane, flanked by a meandering river, Casa Colvale is arguably Goa’s best kept secret. The village of Colvale itself bears the rustic charm of a Goa gone by, covered by expanses of lush paddy fields and the gentle wash of the Chapora river. \n\n'
                    'While it has all the qualities to keep you in a calm and relaxed state of vacation, it’s not so far from the throb of Goa’s famous nightlife, beaches and casinos to be completely cut off. Casa Colvale literally offers the best of both worlds.\n\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textDirection: TextDirection.ltr,
                    textScaleFactor: 1.0,
                    maxLines: 100,
                    semanticsLabel: '...',
                    textWidthBasis: TextWidthBasis.parent,
                    textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: true,
                    ),
                    // Apply equal padding on both sides
                    // Adjust the EdgeInsets.symmetric value as needed
                  ),
                  //SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {
                        launch('https://maps.app.goo.gl/9xo7q1C6GtecFbkm7');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/CASAColvalemap.jpg',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Attractions at CASA Colvale',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: talukas.map((taluka) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            title: taluka['title']!,
                            subtitle: taluka['subtitle']!,
                            image: taluka['image']!,
                          ),
                        ),
                      );
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
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  DetailPage({
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
      body: Column(
        children: [
          Image.asset(image),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(subtitle),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CASAColvale(),
  ));
}
