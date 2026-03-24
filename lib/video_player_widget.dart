import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  final bool isFullScreen;

  const VideoPlayerWidget({
    Key? key,
    required this.videoPath,
    required this.isFullScreen, required bool autoplay, required Null Function() onEnd,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        if (widget.isFullScreen) {
          _controller.play();
          _isPlaying = true;
        } else {
          _isPlaying = false;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
          _isPlaying = !_isPlaying;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: widget.isFullScreen
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : SizedBox(), // Hide non-fullscreen videos
      ),
    );
  }

  @override
  void dispose() {
    _controller.pause(); // Pause the video before disposing
    _controller.dispose();
    super.dispose();
  }
}
