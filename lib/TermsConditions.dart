import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'All images and videos displayed in this application are obtained from various platforms on the internet. We do not claim ownership of any media content displayed within this application. The images are for illustrative purposes only and may be subject to copyright. No license or permission is granted to use or reproduce any of the images or videos displayed in this application.',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'We provide information to help people explore Goa and discover all its wonderful places.',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
