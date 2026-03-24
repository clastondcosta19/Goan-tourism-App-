import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DudhsagarWaterfall extends StatelessWidget {
  final List<String> imageList = [
    'lib/images/DudhsagarWaterfall (1).jpg',
    'lib/images/DudhsagarWaterfall (2).jpg',
    'lib/images/DudhsagarWaterfall (3).jpg',
    'lib/images/DudhsagarWaterfall (4).jpg',
    'lib/images/DudhsagarWaterfall (5).jpg',
  ];

  final List<Map<String, String>> talukas = [
    {
      "title": "Mollem",
      "subtitle": "South Goa",
      "image": "lib/images/Mollem.jpg"
    },
    {
      "title": "Mollem National Park",
      "subtitle": "South Goa",
      "image": "lib/images/MollemNationalPark.jpg"
    },
    {
      "title": "Kulem hidden waterfall’s",
      "subtitle": "South Goa",
      "image": "lib/images/Kulemhiddenwaterfall’s.jpg"
    },
    {
      "title": "Dudhsagar Plantation",
      "subtitle": "South Goa",
      "image": "lib/images/DudhsagarPlantation.webp"
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
                    'Dudhsagar Falls',
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
                    'Dudhsagar Falls (lit. Sea of Milk) is a four-tiered waterfall on the Mandovi River in the Indian state of Goa. It is 60 km from Panaji by road and is located on the Belgaum–Vasco Da Gama rail route about 46 km east of Madgaon and 80 km south of Belgaum. Dudhsagar Falls is amongst Indias tallest waterfalls with a height of 310 m (1017 feet) and an average width of 30 metres (100 feet).\n\n'
                    'The falls are located in the Bhagwan Mahaveer Sanctuary and Mollem National Park among the Western Ghats. The falls are a punctuation mark in the journey of the Mandovi River from the Western Ghats to Panjim where it meets the Arabian sea. The area is surrounded by deciduous forests with rich biodiversity. The falls are not particularly spectacular during the dry season but during the monsoon season, the falls are fed by rains and form a huge sheet of water.\n\n',
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
                        launch('https://maps.app.goo.gl/NX2QZhk5GTZSXsUr9');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/DudhsagarFallsmap.png',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Attractions at Dudhsagar Falls',
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
    home: DudhsagarWaterfall(),
  ));
}
