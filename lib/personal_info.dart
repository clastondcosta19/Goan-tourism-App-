import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PersonalInfo extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors
                          .black, // You can customize this color as needed
                      backgroundImage: user?.photoURL != null
                          ? NetworkImage(user!.photoURL!)
                          : null,
                      child: user?.photoURL == null
                          ? Text(
                              user != null
                                  ? user!.email![0].toUpperCase()
                                  : "", // Display first letter of email
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            )
                          : null,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    user != null ? user!.email! : "", // Display user's email
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Guest', // Display user role
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
