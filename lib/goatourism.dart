import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goatourism/auth_page.dart';

void main() {
  runApp(GoaTourismApp());
}

class GoaTourismApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: OnboardingWrapper(),
    );
  }
}

class OnboardingWrapper extends StatefulWidget {
  @override
  _OnboardingWrapperState createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  late SharedPreferences _prefs;
  late bool _seenOnboarding;

  @override
  void initState() {
    super.initState();
    _checkIfSeenOnboarding();
  }

  void _checkIfSeenOnboarding() async {
    _prefs = await SharedPreferences.getInstance();
    _seenOnboarding = _prefs.getBool('seenOnboarding') ?? false;
    if (_seenOnboarding) {
      // If onboarding is already seen, navigate to authentication page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    }
  }

  void _markOnboardingAsSeen() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool('seenOnboarding', true);
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScreens(
      onCompleted: () {
        _markOnboardingAsSeen();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AuthPage()),
        );
      },
    );
  }
}

class OnboardingScreens extends StatefulWidget {
  final VoidCallback? onCompleted;

  OnboardingScreens({this.onCompleted});

  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              OnboardingScreen(
                image: 'lib/images/onboarding1.jpg',
                text:
                    'Discover the mesmerizing beaches of Goa with golden sands and crystal clear waters\n',
              ),
              OnboardingScreen(
                image: 'lib/images/onboarding2.jpg',
                text:
                    'Explore the rich heritage and architecture of Goa through its ancient churches and temples\n',
              ),
              OnboardingScreen(
                image: 'lib/images/onboarding3.jpg',
                text:
                    'Experience the vibrant culture and lively festivals of Goa, filled with music, dance, and joy\n',
              ),
            ],
          ),
          Positioned(
            bottom: 40.0,
            left: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 10.0,
                  width: (index == _currentPage) ? 30.0 : 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: (index == _currentPage)
                        ? const Color.fromARGB(255, 77, 75, 74)
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40.0,
            right: 20.0,
            child: (_currentPage != 2)
                ? InkWell(
                    onTap: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color:
                            Colors.white.withOpacity(0.5), // Transparent color
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      if (widget.onCompleted != null) {
                        widget.onCompleted!();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color:
                            Colors.white.withOpacity(0.5), // Transparent color
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String image;
  final String text;

  OnboardingScreen({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
