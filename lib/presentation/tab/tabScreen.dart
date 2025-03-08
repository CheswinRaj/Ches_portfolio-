import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.
    // asset("assets/video/cover.mp4");
    networkUrl(Uri.parse(
        'https://drive.google.com/uc?export=download&id=1u_YLb15hUj5Q4zd0rclqnzuvqWIsK0D6'));
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      if (mounted) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      }
    }).catchError((error) {
      print('Error initializing video: $error'); // Error handling
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: height,
                          width: width,
                          child: VideoPlayer(_controller)),
                SizedBox(
                height: height,
                width: width,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   RichText(
                     text: TextSpan(
                       text: 'Hello ',
                       style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: width*.05),
                     ),
                   ),
                   RichText(
                     text: TextSpan(
                       text: 'This ',
                       style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: width*.05),
                       children: <TextSpan>[
                         TextSpan(text: 'is', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: width*.03)),
                         const TextSpan(text: ' Cheswin Raj!' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.yellow)),
                       ],
                     ),
                   )

               ],)),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    color: Colors.black,
                      height: height,
                      width: width);
                } else {
                  return  Container(
                      color: Colors.black,
                      height: height,
                      width: width);
                }
              },
            ),
            const Center(child: Text("tab"),),

          ],
        ),
      ),);
  }
}