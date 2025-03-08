//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class DesktopLayout extends StatefulWidget {
//   const DesktopLayout({super.key});
//
//   @override
//   State<DesktopLayout> createState() => _DesktopLayoutState();
// }
//
// class _DesktopLayoutState extends State<DesktopLayout> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         VideoPlayerController.
//     asset("assets/video/cover.mp4");
//     _initializeVideoPlayer();
//
//
//   }
//
//   void _initializeVideoPlayer() {
//     _controller = VideoPlayerController.asset("assets/video/cover.mp4");
//     _initializeVideoPlayerFuture = _controller.initialize().then((_) {
//       if (mounted) {
//         setState(() {
//           _controller.play();
//           _controller.setLooping(true);
//         });
//       }
//     }).catchError((error) {
//     });
//   }
//
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//
//
//       FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             );
//           } else if (snapshot.hasError) {
//             return  Center(
//               child: Text(
//                 "AppLocalizations.of(context)!.error_loadingvideo",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.amber,
//               ),
//             );
//           }
//         },
//       )
//       ,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.
    // asset("assets/video/cover.mp4");
    networkUrl(
        Uri.parse(
            'https://drive.google.com/uc?export=download&id=1u_YLb15hUj5Q4zd0rclqnzuvqWIsK0D6')

    );
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
      backgroundColor: Colors.black,
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
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Container(
                      color: Colors.red,
                      height: height,
                      width: width);
                }
                else {
                  return  Container(
                      color: Colors.green,
                      height: height,
                      width: width);
                }
              },
            ),
             Container(
                color: Colors.blue,
                height: height*.3,
                width: width,
              child: Center(child: Text("tab"),

            ),),
          ],
        ),
      ),);
  }
}