import 'package:flutter/material.dart';
import 'package:goatourism/Beaches/beach1.dart';
import 'package:goatourism/Cuisine1.dart';
import 'package:goatourism/Cuisine2.dart';
import 'package:goatourism/Festival1.dart';
import 'package:goatourism/Festival2.dart';

void main() {
  runApp(Culture());
}

class Culture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text('Culture'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCardList("Festivals", Festivals, context),
              buildCardList("Cuisine", Cuisine, context),
              buildCardList("Dance", Dance, context),
              buildCardList("Art & Craft", ArtCraft, context),
              buildCardList("Architecture", Architecture, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardList(
      String title, List<Map<String, dynamic>> itemList, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: itemList.map((item) {
              return GestureDetector(
                onTap: () {
                  if (item['page'] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => item['page'](),
                      ),
                    );
                  } else {
                    // Handle default tap action (if needed)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Page not available for ${item["title"]}'),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 220,
                    height: 270,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.0),
                            ),
                            child: Image.asset(
                              item["image"],
                              height: 200,
                              width: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  item["subtitle"],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> Festivals = [
  {
    "title": "Sao Jao",
    "subtitle": "June 24",
    "image": "lib/images/saojao.jpg",
    "page": Festival1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Sangodd",
    "subtitle": "June 29",
    "image": "lib/images/Sangodd.jpg",
    "page": Festival2(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Bonderam",
    "subtitle": "August 24",
    "image": "lib/images/Bonderam.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Zatra of Shantadurga",
    "subtitle": " May 2024",
    "image": "lib/images/ZatraofShantadurga.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Shigmo",
    "subtitle": "26 Mar - 08 Apr 2024",
    "image": "lib/images/Shigmo.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Carnival",
    "subtitle": " February 10 – 13, 2024",
    "image": "lib/images/Carnival.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Diwali",
    "subtitle": "November 1 2024",
    "image": "lib/images/Diwali.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Ganesh Chaturti",
    "subtitle": "7 – 8 Sept 2024",
    "image": "lib/images/GaneshChaturti.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Christmas",
    "subtitle": "25 Dec 2024",
    "image": "lib/images/christmas.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more places as needed
];

List<Map<String, dynamic>> Cuisine = [
  {
    "title": "Fish Curry Rice",
    "subtitle": "Cuisine",
    "image": "lib/images/FishCurryRice.jpg",
    "page": Cuisine1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Chicken Cafreal",
    "subtitle": "Cuisine",
    "image": "lib/images/ChickenCafreal.jpg",
    "page": Cuisine2(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Prawn Balchao",
    "subtitle": "Cuisine",
    "image": "lib/images/PrawnBalchao.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Solkadi",
    "subtitle": "Cuisine",
    "image": "lib/images/Solkadi.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Crab Curry",
    "subtitle": "Cuisine",
    "image": "lib/images/CrabCurry.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Chicken Xacuti",
    "subtitle": "Cuisine",
    "image": "lib/images/ChickenXacuti.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Sannas",
    "subtitle": "Cuisine",
    "image": "lib/images/Sannas.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Sorpotel",
    "subtitle": "Cuisine",
    "image": "lib/images/Sorpotel.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more attractions as needed
];

List<Map<String, dynamic>> Dance = [
  {
    "title": "Dekhni",
    "subtitle": "Dance",
    "image": "lib/images/Dekhni.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Kunbi",
    "subtitle": "Dance",
    "image": "lib/images/kunbi.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Fugdi",
    "subtitle": "Dance",
    "image": "lib/images/Fugdi.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Dhalo",
    "subtitle": "Dance",
    "image": "lib/images/Dhalo.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Ghodemodni",
    "subtitle": "Dance",
    "image": "lib/images/Ghodemodni.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Romta Mel",
    "subtitle": "Dance",
    "image": "lib/images/RomtaMel.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more restaurants as needed
];

List<Map<String, dynamic>> ArtCraft = [
  {
    "title": "Wood Carving",
    "subtitle": "Art & Craft",
    "image": "lib/images/WoodCarving.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Azulejos",
    "subtitle": "Art & Craft",
    "image": "lib/images/Azulejos.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Brass Metalwork",
    "subtitle": "Art & Craft",
    "image": "lib/images/BrassMetalwork.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Pottery",
    "subtitle": "Art & Craft",
    "image": "lib/images/Pottery.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Seashell Craft",
    "subtitle": "Art & Craft",
    "image": "lib/images/SeashellCraft.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Jute Craft",
    "subtitle": "Art & Craft",
    "image": "lib/images/JuteCraft.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Bamboo and Cane Craft",
    "subtitle": "Art & Craft",
    "image": "lib/images/BambooandCaneCraft.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Coconut Shell Crafts",
    "subtitle": "Art & Craft",
    "image": "lib/images/CoconutShellCrafts.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Khola (Palm Leaf) Craft",
    "subtitle": "Art & Craft",
    "image": "lib/images/KholaCraft.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more restaurants as needed
];
List<Map<String, dynamic>> Architecture = [
  {
    "title": "Basilica of Bom Jesus",
    "subtitle": "Old Goa",
    "image": "lib/images/BasilicaofBomJesus.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Shri Manguesh Temple",
    "subtitle": "Mardol",
    "image": "lib/images/ShriMangueshTemple.jpg",
    "page": () => BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Fort Aguada",
    "subtitle": "Candolim",
    "image": "lib/images/FortAguada.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Church of St. Cajetan",
    "subtitle": "Old Goa",
    "image": "lib/images/ChurchofsaintCajetan.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Palácio do Deão",
    "subtitle": "Quepem",
    "image": "lib/images/PaláciodoDeão.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Shri Shantadurga Temple",
    "subtitle": "Ponda",
    "image": "lib/images/ShriShantadurgaTemple.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Chapora Fort",
    "subtitle": "Anjuna",
    "image": "lib/images/ChaporaForts.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  {
    "title": "Se Cathedral",
    "subtitle": "Old Goa",
    "image": "lib/images/SeCathedral.jpg",
    "page": BeachPage1(), // Navigate to BeachPage1 when tapped
  },
  // Add more restaurants as needed
];
