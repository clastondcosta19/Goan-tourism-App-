import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(BookmarksApp());
}

class Bookmark {
  final String title;
  final String imageUrl;
  final String url;

  Bookmark({required this.title, required this.imageUrl, required this.url});

  String toJsonString() {
    return '{"title": "$title", "imageUrl": "$imageUrl", "url": "$url"}';
  }

  factory Bookmark.fromJson(Map<String, dynamic> map) {
    return Bookmark(
      title: map.containsKey('title') ? map['title'] as String : '',
      imageUrl: map.containsKey('imageUrl') ? map['imageUrl'] as String : '',
      url: map.containsKey('url') ? map['url'] as String : '',
    );
  }
}

class BookmarksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookmarks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookmarkPage(),
    );
  }
}

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late SharedPreferences _prefs;
  List<Bookmark> bookmarks = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  _loadBookmarks() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      List<String>? bookmarkList = _prefs.getStringList('bookmarks');
      if (bookmarkList != null) {
        setState(() {
          bookmarks = bookmarkList
              .map((e) => Bookmark.fromJson(Map<String, dynamic>.from(json.decode(e))))
              .toList();
        });
      }
    } catch (e) {
      print('Error loading bookmarks: $e');
      // Handle error, e.g., show a dialog to the user
    }
  }

  _saveBookmarks() {
    List<String> bookmarkList = bookmarks.map((e) => e.toJsonString()).toList();
    _prefs.setStringList('bookmarks', bookmarkList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: bookmarks.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Handle bookmark tap
              print('Opening ${bookmarks[index].title}');
            },
            child: Card(
              elevation: 2.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    bookmarks[index].imageUrl,
                    height: 100.0,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    bookmarks[index].title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        bookmarks.removeAt(index);
                        _saveBookmarks();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Bookmark deleted')),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
