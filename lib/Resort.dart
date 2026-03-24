// main.dart
import 'package:flutter/material.dart';
import 'package:goatourism/Beaches/beach11.dart';
import 'package:goatourism/Resort1.dart';
import 'package:goatourism/Resort2.dart';

void main() {
  runApp(Resort());
}

class Resort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
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
      'mainItem': 'Taj Exotica Resort & Spa, Goa',
      'subtitle': 'Benaulim',
      'locationIcon': Icons.location_on,
      'page': Resort1(),
    },
    {
      'mainItem': 'Taj Fort Aguada Resort & Spa',
      'subtitle': 'Candolim',
      'locationIcon': Icons.location_on,
      'page': Resort2(),
    },
    {
      'mainItem': 'Toshali Goan Village Beach Resort',
      'subtitle': 'Bardez',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Andores Resort And Spa',
      'subtitle': 'Calangute',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Novotel Goa Resort & Spa',
      'subtitle': 'Candolim',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Dudhsagar Spa Resort',
      'subtitle': 'Mollem',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Resort Park Avenue',
      'subtitle': 'Calangute',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Keys Select Ronil Resort',
      'subtitle': 'Calangute',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Little India Beach Cottages Goa',
      'subtitle': 'Calangute',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Thalassa Beach Boutique Resort',
      'subtitle': 'Pernem',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Stone Wood Resort',
      'subtitle': 'Mandrem',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Cashew Leaf Resort',
      'subtitle': 'Paliem',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Goa Marriott Resort & Spa',
      'subtitle': 'Miramar',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },
    {
      'mainItem': 'Whispering Palms Beach Resort',
      'subtitle': 'Candolim',
      'locationIcon': Icons.location_on,
      'page': BeachPage11(),
    },

    // Add other items with respective pages
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => items[index]['page']),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[400]!
                    : Colors.grey[850]!,
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
                      'lib/images/Resort${index + 1.0}.jpg',
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
                        padding: const EdgeInsets.only(left: 1.0, bottom: 4.0),
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
          ),
        );
      },
    );
  }
}
