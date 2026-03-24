import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class NetravaliWaterfalls extends StatelessWidget {
  final List<String> imageList = [
    'lib/images/NetravaliWaterfalls (1).jpg',
    'lib/images/NetravaliWaterfalls (2).jpg',
    'lib/images/NetravaliWaterfalls (3).jpg',
    'lib/images/NetravaliWaterfalls (4).jpg',
    'lib/images/NetravaliWaterfalls (5).jpg',
  ];

  final List<Map<String, String>> talukas = [
    {
      "title": "Bubbling Lake",
      "subtitle": "South Goa",
      "image": "lib/images/BubblingLake.jpg"
    },
    {
      "title": "Netravali Wildlife Sanctuary",
      "subtitle": "South Goa",
      "image": "lib/images/NetravaliWildlifeSanctuary.jpg"
    },
    {
      "title": "Bamanbudo Waterfall",
      "subtitle": "South Goa",
      "image": "lib/images/BamanbudoWaterfall.jpg"
    },
    {
      "title": "Rivona Waterfall",
      "subtitle": "South Goa",
      "image": "lib/images/RivonaWaterfall.jpg"
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
                    'Netravali Waterfalls',
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
                        'South Goa',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'The lesser-known Netravali Falls is tucked away within the Netravali Wildlife Sanctuary. To access this hidden gem, one must trek 3 kilometers inside the sanctuary with the assistance of a guide. Nestled deep in a thick forest, the waterfall offers a captivating scene, slicing its way through the lush woods before cascading into a serene lake below. Though the lakes water appears greenish, it is pristine, inviting visitors for a refreshing swim or bath. Notably, locals refer to this fall as Savari Falls.\n\n'
                    'The monsoon season, particularly between June and August, is the ideal time to experience the beauty of the Netravali Falls.\n\n',
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
                        launch('https://maps.app.goo.gl/Ax8zscpCshPA8146A');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/Screenshot 2024-03-31 151931',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Attractions at Netravali Waterfalls',
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
    home: NetravaliWaterfalls(),
  ));
}
