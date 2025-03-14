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

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late ChewieController _chewieController;
  bool iconClr1=false;
  bool iconClr2=false;
  bool iconClr3=false;
  bool mainHead1=false;
  bool mainHead2=false;
  bool mainHead3=false;
  bool mainHead4=false;
  bool mainHead5=false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.

    // asset("assets/video/cover.mp4");
    networkUrl(
        Uri.parse("https://www.dropbox.com/scl/fi/mhnzf0l0ws2c0eacl3awd/cover.mp4?rlkey=u23xy642qr7xhcwuzqodcwkz1&raw=1"
          // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
            // 'https://drive.google.com/uc?export=download&id=1u_YLb15hUj5Q4zd0rclqnzuvqWIsK0D6'
        )
    //
    );
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      if (mounted) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
        _chewieController = ChewieController(

          videoPlayerController: _controller,
          autoPlay: true,
          looping: true,
          showOptions: false,
          allowFullScreen: true, // Allows full-screen mode
          fullScreenByDefault: true, // Opens
        );
      }
    }).catchError((error) {
      print('Error initializing video: $error'); // Error handling
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

                Stack(
                  children: [
                    background(initializeVideoPlayerFuture: _initializeVideoPlayerFuture, height: height, width: width),
                    SizedBox(
                        height: height,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
               SizedBox(height: height*.3,),
                            Row(
                              children: [
                                Expanded(flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Hello ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: width * .03),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'This ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: width * .025),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'is',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: width * .015)),
                                              ],
                                            ),
                                          ),
                                          Text(' Cheswin Raj!',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow,
                                                  fontSize: width * .02))
                                              .animate(
                                              effects: [
                                                ShimmerEffect( colors: [Colors.blue, Colors.purple], // Gradient colors
                                                )
                                              ],
                                              onPlay: (controller) => controller.repeat(
                                                  reverse: true,
                                                  period: Duration(seconds: 3)))
                                        ],
                                      ),

                                          Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                            ShaderMask(
                                              shaderCallback: (Rect bounds) {
                                                return LinearGradient(
                                                  colors: [Colors.blue, Colors.purple], // Gradient colors
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ).createShader(bounds);
                                              },
                                              child: Text(
                                                 'Flutter  ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: width * .025),),
                                            ),
                                                Text(
                                                  'Developer',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: width * .015),)
                                            ]),


                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'I specialize in building seamless  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: width * .01),
                                            ),
                                          ),
                                          Text('Android ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellowAccent,
                                                  fontSize: width * .013))
                                              .animate(
                                            // effects: [ShimmerEffect(color: Colors.black)],
                                              onPlay: (controller) => controller.repeat(
                                                  reverse: true,
                                                  period: Duration(seconds: 3)))
                                              .fadeOut(curve: Curves.easeIn),
                                          Text(',',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: width * .01)),
                                          Text('iOS ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellowAccent,
                                                  fontSize: width * .013))
                                              .animate(
                                            // effects: [ShimmerEffect(color: Colors.black)],
                                              onPlay: (controller) => controller.repeat(
                                                  reverse: true,
                                                  period: Duration(seconds: 4)))
                                              .fadeOut(curve: Curves.easeIn),
                                          Text('and ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: width * .01)),
                                          Text('Web',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellowAccent,
                                                  fontSize: width * .013))
                                              .animate(
                                            // effects: [ShimmerEffect(color: Colors.black)],
                                              onPlay: (controller) => controller.repeat(
                                                  reverse: true,
                                                  period: Duration(seconds: 5)))
                                              .fadeOut(curve: Curves.easeIn),
                                          Text(' applications using Flutter.  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: width * .01)),
                                        ],
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'With ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: width * .01),
                                            children: [
                                              TextSpan(
                                                  text: '2',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.yellow,
                                                      fontSize: width * .01)),
                                              TextSpan(
                                                  text:
                                                  ' years of experience, I create high-performance and visually appealing apps.',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: width * .01)),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(flex:2,child:
                                Container(color: Colors.transparent,
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(),
                                          StatefulBuilder(
                                              builder: (context,setStates) {
                                                return Padding(
                                                  padding: const EdgeInsets.only(right: 50),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: (){
                                                          _launchUrl("https://github.com/CheswinRaj");
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                          child: MouseRegion(
                                                            onEnter: (_) => setStates(() => iconClr1 = true), // When mouse enters
                                                            onExit: (_) => setStates(() => iconClr1 = false),
                                                            child: SizedBox(
                                                              height: height*.035,
                                                              width: height*.035,
                                                              child: SvgPicture.asset(
                                                                "assets/svg/git.svg",
                                                                colorFilter:  ColorFilter.mode(iconClr1?Colors.red:Colors.white, BlendMode.srcIn),
                                                                semanticsLabel: 'Red dash paths',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: (){
                                                          _launchUrl("https://www.linkedin.com/in/cheswin-raj-9352941b2/");
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                          child: MouseRegion(
                                                            onEnter: (_) => setStates(() => iconClr2 = true), // When mouse enters
                                                            onExit: (_) => setStates(() => iconClr2 = false),
                                                            child: SizedBox(
                                                              height: height*.035,
                                                              width: height*.035,
                                                              child: SvgPicture.asset(
                                                                "assets/svg/linkedin.svg",
                                                                colorFilter:  ColorFilter.mode(iconClr2?Colors.blue:Colors.white, BlendMode.srcIn),
                                                                semanticsLabel: 'Red dash paths',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: (){
                                                          _launchUrl("https://github.com/Cheswin");
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                          child: MouseRegion(
                                                            onEnter: (_) => setStates(() => iconClr3 = true), // When mouse enters
                                                            onExit: (_) => setStates(() => iconClr3 = false), // When mouse exits
                                                            child: SizedBox(
                                                              height: height*.035,
                                                              width: height*.035,
                                                              child: SvgPicture.asset(
                                                                "assets/svg/git.svg",
                                                                colorFilter:  ColorFilter.mode(iconClr3?Colors.red:Colors.white, BlendMode.srcIn),
                                                                semanticsLabel: 'Red dash paths',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                          )


                                        ],)
                                    ],),))
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
                Container(
                  color: Colors.blue,
                  height: height,
                  width: width,
                  child: Center(child: Text("tab"),

                  ),),            ],
            ),
          ),
          StatefulBuilder(
              builder: (context,screenState) {
                return Padding(
                  padding:  EdgeInsets.only(top:height*.02,right: 20,left: 20 ),
                  child: CustomPaint(
                    size: Size(100, 100),
                    painter: GradientBorderPainter(),
                    child: Container(
                      height: height*.05,
                                    margin: EdgeInsets.all(1), // To prevent the inner black container from covering the border
                                    decoration: BoxDecoration(
                                    // color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(
                                      top: 0,bottom:0,right: width*.02,left: width*.04),
                                  child: MouseRegion(
                                    onEnter: (_) => screenState(() => mainHead1 = true), // When hovered
                                    onExit: (_) => screenState(() => mainHead1 = false),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Home ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:mainHead1?Colors.red: Colors.white,
                                            // decoration: mainHead1?TextDecoration.underline:null, // Adds underline
                                            // decorationColor: Colors.red, // Underline color
                                            // decorationThickness: 5, // Underline thickness
                                            // fontSize: width * .01
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: 0,bottom:0,right: width*.02),
                                  child: MouseRegion(
                                    onEnter: (_) => screenState(() => mainHead2 = true), // When hovered
                                    onExit: (_) => screenState(() => mainHead2 = false),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'About',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:mainHead2?Colors.red: Colors.white,                                    decoration: mainHead2?TextDecoration.underline:null, // Adds underline
                                            // decorationColor: Colors.red, // Underline color
                                            // decorationThickness: 5, // Underline thickness
                                            // fontSize: width * .01
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: 0,bottom:0,right: width*.02),
                                  child: MouseRegion(
                                    onEnter: (_) => screenState(() => mainHead3 = true), // When hovered
                                    onExit: (_) => screenState(() => mainHead3 = false),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Projects',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:mainHead3?Colors.red: Colors.white,                                    decoration: mainHead3?TextDecoration.underline:null, // Adds underline
                                            // decorationColor: Colors.red, // Underline color
                                            // decorationThickness: 5, // Underline thickness
                                            // fontSize: width * .01
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: 0,bottom:0,right: width*.02),
                                  child: MouseRegion(
                                    onEnter: (_) => screenState(() => mainHead4 = true), // When hovered
                                    onExit: (_) => screenState(() => mainHead4 = false),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Contact',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:mainHead4?Colors.red: Colors.white,                                    decoration: mainHead4?TextDecoration.underline:null, // Adds underline
                                            // decorationColor: Colors.red, // Underline color
                                            // decorationThickness: 5, // Underline thickness
                                            // fontSize: width * .01
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top:0,bottom:0,right: width*.02),
                                  child: MouseRegion(
                                    onEnter: (_) => screenState(() => mainHead5 = true), // When hovered
                                    onExit: (_) => screenState(() => mainHead5 = false),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Resume',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:mainHead5?Colors.red: Colors.white,                                    decoration: mainHead5?TextDecoration.underline:null, // Adds underline
                                            // decorationColor: Colors.red, // Underline color
                                            // decorationThickness: 5, // Underline thickness
                                            // fontSize: width * .01
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        ],
      ),);
  }
}

class background extends StatelessWidget {
  const background({
    super.key,
    required Future<void> initializeVideoPlayerFuture,
    required this.height,
    required this.width,
  }) : _initializeVideoPlayerFuture = initializeVideoPlayerFuture;

  final Future<void> _initializeVideoPlayerFuture;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
              height: height,
              width: width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/bg.jpg",),fit: BoxFit.cover))

        // child:
              // Chewie(
              //     controller: _chewieController
              // ),
              // VideoPlayer(_controller)
          );
        }
        else if (snapshot.hasError) {
          return Container(
              // color: Colors.black,
              height: height,
              width: width,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/bg.jpg",),fit: BoxFit.cover))
            ,);
        }
        else {
          return  Container(
            // color: Colors.black,
            height: height,
            width: width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/bg.jpg",),fit: BoxFit.cover))
            ,);
        }
      },
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.blue, Colors.purple], // Gradient colors
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Manually create a BorderRadius (with the same value for all corners)
    final BorderRadius borderRadius = BorderRadius.circular(20);

    // Convert BorderRadius to the top-left, top-right, bottom-left, bottom-right radius values
    final Radius radius = borderRadius.topLeft;

    // Create RRect using the radius for rounded corners
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, radius),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
