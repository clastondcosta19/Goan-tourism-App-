import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goatourism/ExplorePage.dart';
import 'package:goatourism/ShortsPage.dart';
import 'package:goatourism/TermsConditions.dart';
import 'package:goatourism/about_us.dart';
import 'package:goatourism/home_page.dart';
import 'package:goatourism/login_or_register_page.dart';
import 'package:goatourism/privacypage.dart';
import 'package:goatourism/profilepage.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final User? _user = FirebaseAuth.instance.currentUser;
  bool _showSettings = false;

  void _toggleSettings() {
    setState(() {
      _showSettings = !_showSettings;
    });
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginOrRegisterPage()), // Navigate to login page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Show back button
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implement notification action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: _user != null
                  ? NetworkImage(_user.photoURL ?? '')
                  : AssetImage('assets/default_avatar.png') as ImageProvider,
            ),
            SizedBox(height: 16),
            Text(
              _user != null
                  ? _user.displayName ?? _user.email ?? 'Guest User'
                  : 'Guest User',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            // List of ListTile widgets
            Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  UserInfoTile(
                    icon: Icon(Icons.person),
                    title: 'Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  UserInfoTile(
                    icon: Icon(Icons.info),
                    title: 'Whislist',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Wishlist()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  UserInfoTile(
                    icon: Icon(Icons.gavel),
                    title: 'Terms & Conditions',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsConditionsPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  UserInfoTile(
                    icon: Icon(Icons.lock),
                    title: 'Privacy',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacyPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  UserInfoTile(
                    icon: Icon(Icons.logout),
                    title: 'Log Out',
                    onTap: _signOut, // Call signOut method on tap
                  ),
                ],
              ).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library), // Changed icon to ShoppingCart
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        selectedItemColor: Colors.orange, // Active icon color
        unselectedItemColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black // Light mode
            : Colors.white, // Dark mode
        currentIndex: 3, // Set currentIndex to 4 for "User" page
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ExplorePage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShortsPage()),
              );
              break;
            case 3:
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function onTap;

  const UserInfoTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: icon,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
