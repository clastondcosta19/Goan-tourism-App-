import 'package:flutter/material.dart';

void main() {
  runApp(Bicholim());
}

class Bicholim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'mainItem': 'Pernem',
      'subItems': ['SubItem 1.1']
    },
    {
      'mainItem': 'Bardez',
      'subItems': ['SubItem 2.1']
    },
    {
      'mainItem': 'Bicholim',
      'subItems': ['SubItem 3.1']
    },
    {
      'mainItem': 'Satari',
      'subItems': ['SubItem 4.1']
    },
    {
      'mainItem': 'Tiswadi',
      'subItems': ['SubItem 5.1']
    },
    {
      'mainItem': 'Ponda',
      'subItems': ['SubItem 6.1']
    },
    {
      'mainItem': 'Murmgoa',
      'subItems': ['SubItem 1.1']
    },
    {
      'mainItem': 'Salcete',
      'subItems': ['SubItem 2.1']
    },
    {
      'mainItem': 'Sanguem',
      'subItems': ['SubItem 3.1']
    },
    {
      'mainItem': 'Quepem',
      'subItems': ['SubItem 4.1']
    },
    {
      'mainItem': 'Dharbandora',
      'subItems': ['SubItem 5.1']
    },
    {
      'mainItem': 'Canacona',
      'subItems': ['SubItem 6.1']
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(4.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'lib/images/Image${index + 1}.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index]['mainItem'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    // Displaying sub-items
                    for (var subItem in items[index]['subItems'])
                      Text(
                        subItem,
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
        );
      },
    );
  }
}
