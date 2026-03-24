import 'package:flutter/material.dart';

void main() {
  runApp(Panjim());
}

class Panjim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system, // Theme mode follows system setting
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'mainItem': 'Religious Places',
      'subtitle': 'Panjim',
      'locationIcon': Icons.location_on,
    },
    {
      'mainItem': 'Hotels',
      'subtitle': 'Panjim',
      'locationIcon': Icons.location_on,
    },
    {
      'mainItem': 'Restaurants',
      'subtitle': 'Panjim',
      'locationIcon': Icons.location_on,
    },
    {
      'mainItem': 'Cafeterias',
      'subtitle': 'Panjim',
      'locationIcon': Icons.location_on,
    },
    {
      'mainItem': 'Picnic Spots',
      'subtitle': 'Panjim',
      'locationIcon': Icons.location_on,
    },
    {
      'mainItem': 'Culture',
      'subtitle': 'Panjim',
      'locationIcon': Icons.location_on,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          //padding: EdgeInsets.all(8.0),
          padding: EdgeInsets.fromLTRB(
              8.0, 8.0, 8.0, 16.0), // Increased vertical padding
          height: 250, // Updated height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[400]! // Adjust border color for light theme
                  : Colors.grey[850]!, // Adjust border color for dark theme
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'lib/images/Panjim${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 4),
                        Text(
                          items[index]['mainItem'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 1.0, bottom: 4.0), // Added padding for subtitle
                      child: Row(
                        children: [
                          Icon(
                            items[index]['locationIcon'],
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            items[index]['subtitle'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
