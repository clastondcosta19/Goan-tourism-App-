import 'dart:math';
import 'package:flutter/material.dart';
import 'video_player_widget.dart';
import 'ExplorePage.dart';
import 'UserPage.dart';
import 'home_page.dart';

class VideoData {
  final String title;
  final String description;
  final String videoPath;
  bool isLiked;
  int likeCount;
  List<CommentData> comments;
  String userProfileImage;

  VideoData({
    required this.title,
    required this.description,
    required this.videoPath,
    this.isLiked = false,
    this.likeCount = 0,
    this.comments = const [],
    this.userProfileImage = 'lib/images/default_avatar.png',
  });
}

class CommentData {
  String comment;
  String userProfileImage;
  String userName;

  CommentData({
    required this.comment,
    required this.userProfileImage,
    required this.userName,
  });
}

class ShortsPage extends StatefulWidget {
  @override
  _ShortsPageState createState() => _ShortsPageState();
}

class _ShortsPageState extends State<ShortsPage> {
  late List<VideoData> videos;

  @override
  void initState() {
    super.initState();
    videos = [
      VideoData(
        title: 'droneshotsgoa',
        description: 'Explore the Wonderful Goa',
        videoPath: 'lib/videos/video1.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'droneshotsgoa',
        description: 'Curtorim: Quaint Lanes, Heritage Whispers.',
        videoPath: 'lib/videos/video2.mp4',
        userProfileImage:
            'lib/images/user_avatar.png', // User profile image path
        comments: [],
      ),
      VideoData(
        title: 'droneshotsgoa',
        description: 'Betul Beach: Weak Wifi, Strong Nature Bond.',
        videoPath: 'lib/videos/video4.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'goacashewfest',
        description: 'Cashew festival in Goa',
        videoPath: 'lib/videos/video5.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'aerialsbykiran',
        description: 'Evening beach ride',
        videoPath: 'lib/videos/video6.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'beautyofgoa',
        description: 'Mahadev temple at Tambdi surla',
        videoPath: 'lib/videos/video7.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'sab_explorer',
        description: 'Panjim Goa',
        videoPath: 'lib/videos/video8.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'droneshotsgoa',
        description: 'Butterfly Beach: Natures Magic Flutters.',
        videoPath: 'lib/videos/video9.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'travel_with_prathi',
        description: 'Bubbling Lake: A Natural Wonder in Goa.',
        videoPath: 'lib/videos/video10.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: '_Prime_shots_',
        description: 'Surla ferry, cotombi Goa',
        videoPath: 'lib/videos/video11.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'rizzx_khan_',
        description: 'Tranquil reflection at Sweetwater Lake',
        videoPath: 'lib/videos/video12.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'rizzx_khan',
        description: 'Goa Beyond Beaches',
        videoPath: 'lib/videos/video13.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'droneshotsgoa',
        description: 'Goa comes alive, underneath the stars',
        videoPath: 'lib/videos/video14.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'aniruddha_patilll',
        description: 'This is not Cola Beach Lagoon',
        videoPath: 'lib/videos/video15.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'droneshotsgoa',
        description: 'Fort Tiracol: Majestic Beauty Captivates.',
        videoPath: 'lib/videos/video16.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'droneshotsgoa',
        description: '"Baga Beach, Goa: Set Your Soul Free."',
        videoPath: 'lib/videos/video17.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'amchegoa_',
        description: 'Aerial view of Dona Paula Jetty',
        videoPath: 'lib/videos/video18.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      VideoData(
        title: 'beautyofgoa',
        description: 'Famous street of Goa',
        videoPath: 'lib/videos/video19.mp4',
        userProfileImage: 'lib/images/user_avatar.png',
        comments: [],
      ),
      // Add more VideoData instances here...
    ];
    videos.shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildVideoPage(index);
        },
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
            icon: Icon(Icons.video_library),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        currentIndex: 2,
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
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }

  Widget _buildVideoPage(int index) {
    return Stack(
      children: [
        VideoPlayerWidget(
          key: UniqueKey(),
          videoPath: videos[index].videoPath,
          isFullScreen: true,
          autoplay: true,
          onEnd: () {},
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  videos[index].userProfileImage,
                ),
                radius: 16,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videos[index].title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    videos[index].description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  videos[index].isLiked
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: videos[index].isLiked ? Colors.red : Colors.white,
                ),
                iconSize: 32,
                onPressed: () {
                  setState(() {
                    if (videos[index].isLiked) {
                      videos[index].isLiked = false;
                      videos[index].likeCount--;
                    } else {
                      videos[index].isLiked = true;
                      videos[index].likeCount++;
                    }
                  });
                },
              ),
              SizedBox(height: 16),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
                iconSize: 32,
                onPressed: () {
                  _showCommentBottomSheet(context, index);
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  void _showCommentBottomSheet(BuildContext context, int index) {
    TextEditingController commentController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          if (commentController.text.isNotEmpty) {
                            setState(() {
                              videos[index].comments.add(
                                    CommentData(
                                      comment: commentController.text.trim(),
                                      userProfileImage:
                                          'lib/images/user_avatar.png',
                                      userName: 'User X', // Example user name
                                    ),
                                  );
                            });
                            commentController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  if (videos[index].comments.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: videos[index].comments.length,
                        itemBuilder: (BuildContext context, int i) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                videos[index].comments[i].userProfileImage,
                              ),
                            ),
                            title: Text(videos[index].comments[i].userName),
                            subtitle: Text(videos[index].comments[i].comment),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _editComment(context, index, i);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _editComment(BuildContext context, int videoIndex, int commentIndex) {
    TextEditingController editController = TextEditingController(
      text: videos[videoIndex].comments[commentIndex].comment,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Comment'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: 'Edit your comment...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  videos[videoIndex].comments[commentIndex].comment =
                      editController.text.trim();
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
