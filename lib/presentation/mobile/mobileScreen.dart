import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();

}


class _MobileLayoutState extends State<MobileLayout> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool iconClr1=false;
  bool iconClr2=false;
  bool iconClr3=false;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                background(initializeVideoPlayerFuture: _initializeVideoPlayerFuture, height: height, width: width),
                SizedBox(
                    height: height,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          'Hello ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: width * .05),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text(
                             'This ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: width * .05),

                          ),
                          Text(
                              'is',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: width * .03)),
                          Text(
                              ' Cheswin Raj!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow,fontSize: width * .05
                              )).animate(
                            effects: [ShimmerEffect( colors: [Colors.yellowAccent,Colors.black])],
                              onPlay: (controller) => controller.repeat(reverse: true,period: Duration(seconds: 3)))
                              ,
                        ],),

                        RichText(
                          text: TextSpan(
                            text: 'Flutter  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent,
                                fontSize: width * .05),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Developer',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * .03)),
                            ],
                          ),
                        ),
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
                                    fontSize: width * .02),

                              ),
                            ),

                              Text(
                                   'Android ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      fontSize: width * .025)).animate(
                                  // effects: [ShimmerEffect(color: Colors.black)],
                                  onPlay: (controller) => controller.repeat(reverse: true,period: Duration(seconds: 3))).fadeOut(curve: Curves.easeIn),
                            Text(
                                ',',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * .02)),
                            Text(
                                   ' iOS ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      fontSize: width * .025)).animate(
                              // effects: [ShimmerEffect(color: Colors.black)],
                                onPlay: (controller) => controller.repeat(reverse: true,period: Duration(seconds: 4))).fadeOut(curve: Curves.easeIn),
                            Text(
                                  'and ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * .02)),
                            Text(
                                   ' Web',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      fontSize: width * .025)).animate(
                                // effects: [],
                                onPlay: (controller) => controller.repeat(reverse: true,period: Duration(seconds: 5))).fadeOut(curve: Curves.easeIn),


                          ],
                        ),
                        RichText(
                            text: TextSpan(
                              text:
                              'applications using Flutter. With',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: width * .02),children: [
                              TextSpan(
                                  text: ' 2 ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                      fontSize: width * .025)),
                              TextSpan(
                                  text: 'years of experience, I create high-performance ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * .02)),
                            ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'and visually appealing apps.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: width * .02)),

                        ),
                        StatefulBuilder(
                          builder: (context,setStates) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      _launchUrl("https://github.com/CheswinRaj");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                      child: MouseRegion(
                                        onEnter: (_) => setStates(() => iconClr1 = true), // When mouse enters
                                        onExit: (_) => setStates(() => iconClr1 = false),
                                        child: SizedBox(
                                          height: height*.03,
                                          width: height*.03,
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
                                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                       child: MouseRegion(
                            onEnter: (_) => setStates(() => iconClr2 = true), // When mouse enters
                            onExit: (_) => setStates(() => iconClr2 = false),
                                        child: SizedBox(
                                          height: height*.03,
                                          width: height*.03,
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
                                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                      child: MouseRegion(
                                        onEnter: (_) => setStates(() => iconClr3 = true), // When mouse enters
                                        onExit: (_) => setStates(() => iconClr3 = false), // When mouse exits
                                        child: SizedBox(
                                          height: height*.03,
                                          width: height*.03,
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
                      ],
                    )),
              ],
            ),
            const Center(child: Text("tab"),),
          ],
        ),
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
            // color: Colors.black,
            height: height,
            width: width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/ph.jpeg",),fit: BoxFit.cover))
            );
          // return SizedBox(
          //     height: height,
          //     width: width,
          //     child: VideoPlayer(_controller));
        } else if (snapshot.hasError) {
          return Container(
            // color: Colors.black,
              height: height,
              width: width,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/ph.jpeg",),fit: BoxFit.cover))
          );
        } else {
          return Container(
            // color: Colors.black,
              height: height,
              width: width,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/ph.jpeg",),fit: BoxFit.cover))
          );
        }
      },
    );
  }
}