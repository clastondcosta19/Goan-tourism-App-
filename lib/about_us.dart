import 'package:flutter/material.dart';

class WishlistApp {
  static List<Map<String, dynamic>> bookmarkedPages = [];

  static void addPage(String title, dynamic page) {
    bookmarkedPages.add({
      "title": title,
      "page": page,
    });
  }

  static void removePage(String title) {
    bookmarkedPages.removeWhere((page) => page["title"] == title);
  }
}

class Wishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing:
              0, // Set mainAxisSpacing to 0 to remove space between rows
          crossAxisSpacing:
              0, // Set crossAxisSpacing to 0 to remove space between columns
          childAspectRatio: 0.8, // Aspect ratio of the items
        ),
        itemCount: WishlistApp.bookmarkedPages.length,
        itemBuilder: (context, index) {
          final page = WishlistApp.bookmarkedPages[index];
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8.0), // Add padding only on right and left sides
            child: Card(
              elevation: 3, // Add elevation for shadow
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => page['page']),
                  );
                },
                child: Center(
                  child: Text(
                    page['title'],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
