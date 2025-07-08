import '../../includes.dart';

class BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/images/welcome.mp4")
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {}); // Trigger rebuild once initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: _controller.value.isInitialized
          ? FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            )
          : Container(color: CupertinoColors.black), // fallback while loading
    );
  }
}

class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  BackgroundVideoState createState() => BackgroundVideoState();
}
