import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DragonWaterfall extends StatelessWidget {
  final List<String> imageList = [
    'lib/images/DragonWaterfall (1).jpg',
    'lib/images/DragonWaterfall (2).jpg',
    'lib/images/DragonWaterfall (3).jpg',
    'lib/images/DragonWaterfall (4).jpg',
    'lib/images/DragonWaterfall (5).jpg',
  ];

  final List<Map<String, String>> talukas = [
    {
      "title": "Shri Chandreshwar Bhootnath Temple",
      "subtitle": "South Goa",
      "image": "lib/images/ChandreshwarBhoothnathpic.jpg"
    },
    {
      "title": "Ambaulim Church",
      "subtitle": "South Goa",
      "image": "lib/images/AmbaulimChurch.jpg"
    },
    {
      "title": "Palácio do Deão",
      "subtitle": "South Goa",
      "image": "lib/images/PaláciodoDeão.jpg"
    },
    {
      "title": "Buddha Statue",
      "subtitle": "South Goa",
      "image": "lib/images/BuddhaStatue.jpg"
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
                    'Dragon Waterfall',
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
                    'The Dragon Waterfall, nestled within the scenic landscapes of Ambaulim, Goa, stands as a captivating natural wonder waiting to be discovered. Often considered a hidden gem, this waterfall exudes an air of mystique and charm that draws visitors seeking a serene retreat amidst natures beauty. Its relative obscurity adds to its allure, making it a treasure trove for those in search of offbeat experiences.\n\n'
                    'Dragon Waterfall graces the picturesque terrain of Ambaulim, a village nestled in the southern part of Goa, India. Accessible by road, the waterfall is situated in the verdant heart of Goa, inviting travelers to embark on a journey of exploration. Nearby landmarks and signposts provide guidance for reaching the waterfall, ensuring that the journey is both adventurous and accessible.\n\n',
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
                        launch('https://maps.app.goo.gl/MCCopTT9QeEEY5JJ7');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/dragonwaterfallmap.png',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Attractions at Dragon Waterfall',
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
    home: DragonWaterfall(),
  ));
}
