import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goatourism/about_us.dart';
import 'package:url_launcher/url_launcher.dart'; // Import WishlistApp and WishlistPage

class PalacioDoDeao extends StatefulWidget {
  @override
  _PalacioDoDeaoState createState() => _PalacioDoDeaoState();
}

class _PalacioDoDeaoState extends State<PalacioDoDeao> {
  bool isBookmarked = false; // Variable to track bookmark status

  final List<String> imageList = [
    'lib/images/palacio1.jpg',
    'lib/images/palacio2.jpg',
    'lib/images/palacio3.jpg',
    'lib/images/palacio4.jpg',
    'lib/images/palacio5.jpg',
    'lib/images/palacio6.jpg',
    'lib/images/palacio7.jpg',
    'lib/images/palacio8.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              // Change the bookmark icon based on the bookmark status
            ),
            onPressed: () {
              // Call toggleBookmark function when the bookmark icon is pressed
              toggleBookmark(context);
            },
          ),
          /*IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Navigate to WishlistPage
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Wishlist()));
            },
          ),*/
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
                    'Palacio do Deao',
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
                    'Palacio do Deao is a magnificent mansion located in Quepem, South Goa, built in the 18th century by a noble Portuguese family. Steeped in history and architectural splendor, the palace offers visitors a glimpse into the colonial past of Goa.\n\n'
                    'Surrounded by lush greenery and overlooking the tranquil Kushavati River, Palacio do Deao exudes grandeur and elegance. Visitors can explore the opulent interiors adorned with intricate Portuguese and Indian design elements, including ornate furniture, exquisite tiles, and religious artifacts.\n\n'
                    'One of the highlights of a visit to Palacio do Deao is the delightful fusion of Portuguese and Goan cuisine offered at the in-house restaurant. Guests can savor authentic Goan delicacies infused with colonial flavors while enjoying panoramic views of the picturesque surroundings.\n\n',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {
                        launch('https://maps.app.goo.gl/qFvxKUvbKkKf4BkR7');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/google_map_PalacioDoDeao.jpg',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Conditional rendering of AttractionList based on bookmark status
            if (!isBookmarked)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attractions at Palacio do Deao',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  AttractionList(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void toggleBookmark(BuildContext context) {
    setState(() {
      isBookmarked = !isBookmarked;
      if (isBookmarked) {
        WishlistApp.addPage("Palacio do Deao", PalacioDoDeao());
      } else {
        WishlistApp.removePage("Palacio do Deao");
      }
    });
  }
}

class AttractionList extends StatefulWidget {
  @override
  _AttractionListState createState() => _AttractionListState();
}

class _AttractionListState extends State<AttractionList> {
  final List<Map<String, String>> attractions = [
    {
      "title": "6 Shades Of Nature",
      "subtitle": "Xeldem",
      "image": "lib/images/q1.jpg"
    },
    {
      "title": "Nossa Senhora De Belem Church",
      "subtitle": "chandor",
      "image": "lib/images/q2.jpg"
    },
    {
      "title": "Shri Chandreshwar Bhoothnath Temple",
      "subtitle": "Paroda",
      "image": "lib/images/q3.jpg"
    },
    {
      "title": "Paradise Farm",
      "subtitle": "Cavorem",
      "image": "lib/images/q4.jpg"
    },
    {"title": "Rivona", "subtitle": "Quepem", "image": "lib/images/q5.jpg"},
  ];

  late List<Map<String, String>> shuffledList;

  @override
  void initState() {
    super.initState();
    shuffledList = shuffleList(attractions);
  }

  List<Map<String, String>> shuffleList(List<Map<String, String>> list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: shuffledList.map((attraction) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
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
                        attraction["image"]!,
                        height: 200,
                        width: 230,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        attraction["title"]!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        attraction["subtitle"]!,
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
    );
  }
}
