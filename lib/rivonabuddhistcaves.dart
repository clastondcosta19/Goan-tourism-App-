import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class RivonaBuddhistCaves extends StatelessWidget {
  final List<String> imageList = [
    'lib/images/bagabeach1.jpg',
    'lib/images/bagabeach2.jpg',
    'lib/images/bagabeach3.jpg',
    'lib/images/bagabeach4.jpg',
    'lib/images/bagabeach5.jpg',
  ];

  final List<Map<String, String>> talukas = [
    {
      "title": "Baga Creek",
      "subtitle": "North Goa",
      "image": "lib/images/ba1.jpg"
    },
    {
      "title": "Snow Park Goa",
      "subtitle": "North Goa",
      "image": "lib/images/ba2.jpg"
    },
    {
      "title": "Watersports",
      "subtitle": "North Goa",
      "image": "lib/images/ba3.jpg"
    },
    {"title": "Titos", "subtitle": "North Goa", "image": "lib/images/ba4.jpg"},
    {
      "title": "Flea Market",
      "subtitle": "North Goa",
      "image": "lib/images/ba5.jpg"
    },
    {
      "title": "Fort Aguada",
      "subtitle": "North Goa",
      "image": "lib/images/ba6.jpg"
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
                    'Baga Beach',
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
                    'One of the most popular beaches of Goa, Baga Beach is a place not to be missed. This shimmering golden beach lies between the two other popular beaches. It has Anjuna Beach on it one side and Calangute Beach on the other side. This is a perfect beach for all of us who want to be away from the crowd of tourists on the other beaches. This beach is known for its sheer beauty. Its mesmerizing scenic beauty has tranquilizing effect on its visitors. A beautiful scene is created when majestic waves when touch the glittering sand which are surrounded by various palm trees. Its beauty is worth capturing.'
                    'This beach is extremely popular for its salty bath. You can find many tourists enjoying taking a dip into the sea water from time to time as they lounge at the sun beds.\n\n'
                    ' The nightlife here is also quite exciting. Baga house famous Café Tito and Cafe Mambo as well, places which are visited by almost every tourists in Goa.'
                    'The Saturday night Flea Market at the Baga beach is extremely famous. Here you will find stalls and small shacks selling almost everything under the sun at affordable prices.'
                    'Tourists can also choose from the three to five star hotels if they want a luxurious stay. Royal Goans Club and the Marinha Douradoa Resort Complex are two of the choices.\n\n',
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
                        launch('https://maps.app.goo.gl/up7ovFkD6fPrr9k38');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/google_map_BagaBeach.jpg',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Attractions at Baga Beach',
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
    home: RivonaBuddhistCaves(),
  ));
}
