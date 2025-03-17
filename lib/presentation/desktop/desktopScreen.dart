

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  bool iconClr1 = false;
  bool iconClr2 = false;
  bool iconClr3 = false;
  bool mainHead1 = false;
  bool mainHead2 = false;
  bool mainHead3 = false;
  bool mainHead4 = false;
  bool mainHead5 = false;
  bool mainHead6 = false;
  final PageController pageControl=PageController();
  // ScrollController =ScrollController();
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
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
          PageView(
            controller: pageControl,
            scrollDirection: Axis.vertical, // Vertical scrolling
              children: [
                Stack(
                  children: [
                    background( height: height, width: width),
                    SizedBox(
                        height: height,
                        width: width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * .3,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40.0),
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Hello ',
                                            style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .03),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: 'This ',
                                                style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .025),
                                                children: <TextSpan>[
                                                  TextSpan(text: 'is', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .015)),
                                                ],
                                              ),
                                            ),
                                            Text(' Cheswin Raj!', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .02)).animate(effects: [
                                              ShimmerEffect(
                                                colors: [Colors.blue, Colors.purple], // Gradient colors
                                              )
                                            ], onPlay: (controller) => controller.repeat(reverse: true, period: Duration(seconds: 3)))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40.0),
                                        child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
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
                                              style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .025),
                                            ),
                                          ),
                                          Text(
                                            'Developer',
                                            style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .015),
                                          )
                                        ]),
                                      ),

                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(),
                                              StatefulBuilder(builder: (context, setStates) {
                                                return Padding(
                                                  padding: const EdgeInsets.only(right: 50),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          _launchUrl("https://github.com/CheswinRaj");
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                          child: MouseRegion(
                                                            onEnter: (_) => setStates(() => iconClr1 = true), // When mouse enters
                                                            onExit: (_) => setStates(() => iconClr1 = false),
                                                            child: SizedBox(
                                                              height: height * .035,
                                                              width: height * .035,
                                                              child: SvgPicture.asset(
                                                                "assets/svg/git.svg",
                                                                colorFilter: ColorFilter.mode(iconClr1 ? Colors.red : Colors.white, BlendMode.srcIn),
                                                                semanticsLabel: 'Red dash paths',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          _launchUrl("https://www.linkedin.com/in/cheswin-raj-9352941b2/");
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                          child: MouseRegion(
                                                            onEnter: (_) => setStates(() => iconClr2 = true), // When mouse enters
                                                            onExit: (_) => setStates(() => iconClr2 = false),
                                                            child: SizedBox(
                                                              height: height * .035,
                                                              width: height * .035,
                                                              child: SvgPicture.asset(
                                                                "assets/svg/linkedin.svg",
                                                                colorFilter: ColorFilter.mode(iconClr2 ? Colors.blue : Colors.white, BlendMode.srcIn),
                                                                semanticsLabel: 'Red dash paths',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          _launchUrl("https://github.com/Cheswin");
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                          child: MouseRegion(
                                                            onEnter: (_) => setStates(() => iconClr3 = true), // When mouse enters
                                                            onExit: (_) => setStates(() => iconClr3 = false), // When mouse exits
                                                            child: SizedBox(
                                                              height: height * .035,
                                                              width: height * .035,
                                                              child: SvgPicture.asset(
                                                                "assets/svg/git.svg",
                                                                colorFilter: ColorFilter.mode(iconClr3 ? Colors.red : Colors.white, BlendMode.srcIn),
                                                                semanticsLabel: 'Red dash paths',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        )),
                  ],
                ),

                ///page 2
                page2(height: height, width: width),



                ///page 3
                page3(height: height, width: width),

///page4
                page4(height: height, width: width),

                page5(height: height, width: width),
              ],

          ),
          StatefulBuilder(builder: (context, screenState) {
            return Padding(
              padding: EdgeInsets.only(top: height * .02, right: 20, left: 20),
              child: Container(
                height: height * .06,
                width: width,
                margin: EdgeInsets.all(1),
                // To prevent the inner black container from covering the border
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 0, right: width * .02, left: width * .04),
                            child: MouseRegion(
                              onEnter: (_) => screenState(() => mainHead1 = true), // When hovered
                              onExit: (_) => screenState(() => mainHead1 = false),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: (){
                                      pageControl.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeOutCubic);
                                    },
                                    child: Text(
                                      'Home ',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontWeight: FontWeight.bold,
                                        color: mainHead1 ? Colors.purple : Colors.white,
                                        // decoration: mainHead1?TextDecoration.underline:null, // Adds underline
                                        // decorationColor: Colors.red, // Underline color
                                        // decorationThickness: 5, // Underline thickness
                                        // fontSize: width * .01
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceWidget(width: width, height: height),
                          Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 0, right: width * .02),
                            child: MouseRegion(
                              onEnter: (_) => screenState(() => mainHead2 = true), // When hovered
                              onExit: (_) => screenState(() => mainHead2 = false),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap:(){
                                      pageControl.animateTo(height*1, duration: Duration(milliseconds: 500), curve: Curves.easeOutCubic);

                                    },
                                    child: Text(
                                      'About',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontWeight: FontWeight.bold,
                                        color: mainHead2 ? Colors.blue : Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceWidget(width: width, height: height),
                          Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 0, right: width * .02),
                            child: MouseRegion(
                              onEnter: (_) => screenState(() => mainHead3 = true), // When hovered
                              onExit: (_) => screenState(() => mainHead3 = false),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap:(){
                                      pageControl.animateTo(height*2, duration: Duration(milliseconds: 500), curve: Curves.easeOutCubic);

                                    },
                                    child: Text(
                                      'Skills',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontWeight: FontWeight.bold,
                                        color: mainHead3 ? Colors.purple : Colors.white,
                                        // fontSize: width * .01
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceWidget(width: width, height: height),
                          Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 0, right: width * .02),
                            child: MouseRegion(
                              onEnter: (_) => screenState(() => mainHead4 = true), // When hovered
                              onExit: (_) => screenState(() => mainHead4 = false),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap:(){
                                      pageControl.animateTo(height*3, duration: Duration(milliseconds: 500), curve: Curves.easeOutCubic);

                                    },
                                    child: Text(
                                      'Projects',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontWeight: FontWeight.bold,
                                        color: mainHead4 ? Colors.blue : Colors.white,
                                        // fontSize: width * .01
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceWidget(width: width, height: height),
                          Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 0, right: width * .02),
                            child: MouseRegion(
                              onEnter: (_) => screenState(() => mainHead5 = true), // When hovered
                              onExit: (_) => screenState(() => mainHead5 = false),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap:(){
                                      pageControl.animateTo(height*4, duration: Duration(milliseconds: 500), curve: Curves.easeOutCubic);

                                    },
                                    child: Text(
                                      'Contact',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontWeight: FontWeight.bold,
                                        color: mainHead5 ? Colors.purple : Colors.white,
                                        // decoration: mainHead4 ? TextDecoration.underline : null, // Adds underline
                                        // decorationColor: Colors.red, // Underline color
                                        // decorationThickness: 5, // Underline thickness
                                        // fontSize: width * .01
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceWidget(width: width, height: height),
                          Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 0, right: width * .02),
                            child: MouseRegion(
                              onEnter: (_) => screenState(() => mainHead6 = true), // When hovered
                              onExit: (_) => screenState(() => mainHead6 = false),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap:()async {
                                      if (await canLaunchUrl(Uri.parse("https://drive.google.com/uc?export=download&id=1jh8z0drYPJFEFLIoD0NZVyJ286xNb14B"))) {
                                        await launchUrl(Uri.parse("https://drive.google.com/uc?export=download&id=1jh8z0drYPJFEFLIoD0NZVyJ286xNb14B"), mode: LaunchMode.externalApplication);
                                      } else {
                                        throw 'Could not launch https://drive.google.com/uc?export=download&id=1jh8z0drYPJFEFLIoD0NZVyJ286xNb14B';
                                      }

                                    },
                                    child: Text(
                                      'Resume',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontWeight: FontWeight.bold,
                                        color: mainHead6 ? Colors.blue : Colors.white,
                                        // fontSize: width * .01
                                      ),
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
            );
          }),
        ],
      ),
    );
  }
}

class page4 extends StatelessWidget {
  const page4({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> caro=[
      {
        "image":"assets/image/cybernet.webp",
        "content":"Cybernet ITS delivering innovation and excellence in Enterprise Resource Planning software.The app covering Finance, Sales, Inventory, Procurement, Planning and production, HRMS , CRM etc. modules.",
        "name":"Cybernet IT Solutions",
        "link":"https://play.google.com/store/apps/details?id=com.redstars.mobile&pcampaignid=web_share",
        "isLink":true
      },
      {
        "image":"assets/image/billingerp.png",
        "content":"Billing ERP is a van sales application that enables salesmen to take orders and track sales details efficiently. It streamlines the sales process by providing real-time order management and sales insights.",
        "name":"Billing ERP ",
        "link":"",
        "isLink":false

      },
      {
        "image":"assets/image/172.png",
        "content":"Arakkal Tap and Order is a hotel application that allows customers to place orders for dine-in, takeaway, or home delivery. It simplifies the ordering process for a seamless dining experience.",
        "name":"Arakkal Tap and Order",
        "link":"",
        "isLink":false

      },
      {
        "image":"assets/image/billingerp.png",
        "content":"360 Solve is an ERP application designed to streamline business operations and enhance efficiency. It provides integrated solutions for managing various business processes.",
        "name":"360 solve",
        "link":"",
        "isLink":false

      },

    ];
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
      child: Stack(
        children: [
          SizedBox(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: height*.25,),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Expanded(flex: 1,
                        child: Container(
                          // color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        colors: [Colors.blue, Colors.purple], // Gradient colors
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(bounds);
                                    },
                                    child: Text('Projects', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .035)),
                                  ),
                                  Icon(Icons.arrow_drop_down,size: width * .05,color: Colors.white,)
                                ],
                              ),

                              SizedBox(height:20),
                              Row(children: [

                                SizedBox(
                                  height: height*.4,
                                  width: width*.35,

                                  child: FlutterCarousel(
                                    options: FlutterCarouselOptions(
                                    viewportFraction: .95,
                                      // height: 400.0,
                                      autoPlay: true,
                                      showIndicator: false,
                                      slideIndicator: CircularSlideIndicator(),
                                    ),
                                    items: caro.map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                              width: width*.35,
                                              height: height*.25,
                                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                  color: Colors.white,
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end:Alignment.centerRight ,
                                                  colors: [Colors.purple, Colors.blue, Colors.blue,Colors.purple,], // Gradient colors
                                                )
                                              ),
                                              child: Center(child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  // Text(' ${i["name"]}', style: TextStyle(fontSize: 16.0),),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                                                    child: ProjectCard(width: width, height: height, name: "${i["name"]}", image: "${i["image"]}",onTaped: () async {
                                                      if(i["isLink"]){
                                                            if (!await launchUrl(
                                                                Uri.parse(
                                                                    "${i["link"]}"))) {
                                                              throw Exception(
                                                                  'Could not launch ${i["link"]}');
                                                            }
                                                          }
                                                        },),
                                                  ),

                                                  Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Text("${i["content"]}",style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),),
                                                  )
                                                ],
                                              ))
                                          ).animate(
                                              effects: [
                                                  FlipEffect(begin: .03,end: .0)
                                            // SlideEffect(begin: Offset(0,-.02),end: Offset(-.01,0 ))
                                            // ShimmerEffect(
                                            //   colors: [Colors.blue, Colors.purple], // Gradient colors
                                            // )
                                          ],
                                              onPlay: (controller) => controller.repeat(reverse: true, period: Duration(seconds: 1)));
                                        },
                                      );
                                    }).toList(),
                                  ),
                                )

                              ],)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: width*.1),
                    child: Container(
                      height: height*.5 , // Adjust size as needed
                      // Adjust size as needed
                      child: Lottie.asset('assets/image/project.json'),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class page3 extends StatelessWidget {
  const page3({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
      child: Stack(
        children: [
          SizedBox(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: height*.3,),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [Colors.blue, Colors.purple], // Gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  child: Text('Skills', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .05)),
                                ),
                                Icon(Icons.arrow_drop_down,size: width * .05,color: Colors.white,)
                              ],
                            ),
                           SizedBox(height: 30,),
                           Wrap(
                             spacing: 30,
                             runSpacing: 10,
                             children: [
                             SkillCard(width: width, height: height, name: "Flutter", image: "assets/image/flutter.jpg",),
                             SkillCard(width: width, height: height, name: "Dart", image: "assets/image/dart.png",),
                             SkillCard(width: width, height: height, name: "Git", image: "assets/image/git.png",),
                             SkillCard(width: width, height: height, name: "Firebase", image: "assets/image/firebase.png",),
                             SkillCard(width: width, height: height, name: "Node", image: "assets/image/node.png",),
                             SkillCard(width: width, height: height, name: "Adobe XD", image: "assets/image/adobe.png",),
                             SkillCard(width: width, height: height, name: "Figma", image: "assets/image/figma.png",),
                               SkillCard(width: width, height: height, name: "Bloc", image: "assets/image/bloc.png",),
                               SkillCard(width: width, height: height, name: "Provider", image: "assets/image/provider.jpg",),
                               SkillCard(width: width, height: height, name: "Redux", image: "assets/image/redux.png",),
                               SkillCard(width: width, height: height, name: "GetX", image: "assets/image/getx.png",),
                               SkillCard(width: width, height: height, name: "Postman", image: "assets/image/postman.jpg",),



                             ],),


                          ],
                        ),
                      ), Expanded(child: SizedBox()),

                    ],
                  ),
                ),

              ],),),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: width*.1),
                    child: Container(
                      height: height*.4 , // Adjust size as needed
                      // Adjust size as needed
                      child: Lottie.asset('assets/image/skills.json'),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class page2 extends StatelessWidget {
  const page2({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
      child: Stack(
        children: [
          SizedBox(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: height*.3,),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [Colors.blue, Colors.purple], // Gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  child: Text('About me', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .05)),
                                ),
                                Icon(Icons.arrow_drop_down,size: width * .05,color: Colors.white,)
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'I specialize in building seamless  ',
                                    style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .01),
                                  ),
                                ),
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [Colors.blue, Colors.purple], // Gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  child: Text('Android ', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .013))
                                      .animate(
                                    // effects: [ShimmerEffect(color: Colors.black)],
                                      onPlay: (controller) => controller.repeat(reverse: true, period: Duration(seconds: 1)))
                                      .fadeOut(curve: Curves.easeIn),
                                ),
                                Text(',', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .01)),
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [Colors.blue, Colors.purple], // Gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  child: Text('iOS ', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .013))
                                      .animate(
                                    // effects: [ShimmerEffect(color: Colors.black)],
                                      onPlay: (controller) => controller.repeat(reverse: true, period: Duration(seconds: 2)))
                                      .fadeOut(curve: Curves.easeIn),
                                ),
                                Text('and ', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .01)),
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [Colors.blue, Colors.purple], // Gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  child: Text('Web', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .013))
                                      .animate(
                                    // effects: [ShimmerEffect(color: Colors.black)],
                                      onPlay: (controller) => controller.repeat(reverse: true, period: Duration(seconds: 1)))
                                      .fadeOut(curve: Curves.easeIn),
                                ),
                                Text(' applications using Flutter.  ', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .01)),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'With ',
                                  style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .01),
                                ),
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: [Colors.blue, Colors.purple], // Gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  child: Text('2', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .01)),
                                ),
                                Text(' years of experience, I create high-performance and visually appealing apps.',
                                    style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .01)),
                              ],
                            ),
                            SizedBox(height:20),
                            Row(children: [
                              // Container(
                              //   decoration: BoxDecoration(color: Colors.purple),
                              // child: ,
                              // )
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Optional rounded edges
                                  border: Border.all(
                                    width: 3, // Border width
                                    color: Colors.transparent, // Required for gradient
                                  ),
                                  gradient: LinearGradient(
                                    colors: [Colors.purple, Colors.blue], // Gradient colors
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                                    child: Text(
                                      "Hire Me",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )

                            ],)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                                  ],),),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Container(
                    height: height*.4 , // Adjust size as needed
                    // Adjust size as needed
                    child: Lottie.asset('assets/image/about.json'),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.width,
    required this.height, required this.name, required this.image,
  });

  final double width;
  final double height;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width*.04,
          height: height*.07,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill),
            color: Colors.white,borderRadius: BorderRadius.circular(15)),),
        Text(name,style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .008),)
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.width,
    required this.height, required this.name, required this.image, this.onTaped,
  });

  final double width;
  final double height;
  final String name;
  final String image;
final void Function()? onTaped;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTaped,
          child: Container(
            width: width*.045,
            height: height*.075,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                color: Colors.white,borderRadius: BorderRadius.circular(15)),),
        ),
        Text(name,style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .008),)
      ],
    );
  }
}
class spaceWidget extends StatelessWidget {
  const spaceWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 0, right: width * .01, left: width * .01),
      child: Container(
        height: height * .03,
        width: width * .002,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

class background extends StatelessWidget {
  const background({
    super.key,
    required this.height,
    required this.width,
  }) ;

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: height,
        width: width,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //           "assets/image/bg2.jpg",
        //         ),
        //         fit: BoxFit.cover)
        //
        //
        // )

        // Adjust size as needed
        // Adjust size as needed
        child: Row(
          children: [
            Expanded(flex: 2, child: SizedBox()),
            Lottie.asset('assets/image/an1.json'),
          ],
        ),

        // child:
        // Chewie(
        //     controller: _chewieController
        // ),
        // VideoPlayer(_controller)
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
      ..strokeWidth = 6;

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

class page5 extends StatelessWidget {
   page5({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;


  bool contact2 = false;
  bool contact1 = false;
  bool contact3 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
      child: Stack(
        children: [
          SizedBox(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: height*.3,),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(padding: EdgeInsets.only(left: width*.1),
                        child: StatefulBuilder(
                          builder: (context,contactState) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(
                                          colors: [Colors.blue, Colors.purple], // Gradient colors
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ).createShader(bounds);
                                      },
                                      child: Text('Contact', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white, fontSize: width * .05)),
                                    ),
                                    Icon(Icons.arrow_drop_down,size: width * .05,color: Colors.white,)
                                  ],
                                ),
                                SizedBox(height: 30,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.phone_android_outlined,color: Colors.white,),
                                    ),MouseRegion(
                                        onEnter: (_) => contactState(() => contact1 = true), // When mouse enters
                                        onExit: (_) => contactState(() => contact1 = false),child: GestureDetector(onTap: () async {
                                      final Uri dialUri = Uri(
                                        scheme: 'tel',
                                        path: '+917034489417'
                                             // Replace with the specific phone number
                                      );

                                      if (await canLaunchUrl(dialUri)) {
                                      await launchUrl(dialUri);
                                      } else {
                                      throw "Could not launch dialer";
                                      }
                                    },child: Text("+91 7034489417",style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color:contact1?Colors.blue: Colors.white, fontSize: width * .01),)))
                                  ],),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.email,color: Colors.white,),
                                    ),GestureDetector(
                                        onTap: () async {
                                          final Uri emailUri = Uri(
                                            scheme: 'mailto',
                                            path: 'cheswin1999@gmail.com', // Replace with your specific email ID
                                          );

                                          if (await canLaunchUrl(emailUri)) {
                                          await launchUrl(emailUri);
                                          } else {
                                          throw "Could not launch email";
                                          }
                                        },
                                        child:MouseRegion(
                                            onEnter: (_) => contactState(() => contact2 = true), // When mouse enters
                                            onExit: (_) => contactState(() => contact2 = false),child: Text("cheswin1999@gmail.com",style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color:contact2?Colors.purple: Colors.white, fontSize: width * .01),)))
                                  ],),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    GestureDetector(
                                      onTap: () async {
                                        String url = "https://wa.me/+917034489417?text=${Uri.encodeComponent("Hello, Cheswin")}";

                                        if (await canLaunchUrl(Uri.parse(url))) {
                                        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                                        } else {
                                        throw "Could not launch WhatsApp";
                                        }
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(15)),
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Icon(CupertinoIcons.chat_bubble,color: Colors.white,),
                                                MouseRegion(
                                                    onEnter: (_) => contactState(() => contact3 = true), // When mouse enters
                                                    onExit: (_) => contactState(() => contact3 = false),
                                                    child: Text(" WhatsApp",style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: contact3?Colors.blue: Colors.white, fontSize: width * .01),)),
                                              ],
                                            ),
                                          )

                                      ),
                                    )],),
                                )
                              ],
                            );
                          }
                        ),
                        )
                      ), Expanded(child: SizedBox()),

                    ],
                  ),
                ),

              ],),),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width*.2),
                    child: Container(
                      height: height*.4 , // Adjust size as needed
                      // Adjust size as needed
                      child: Lottie.asset('assets/image/contac.json'),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}


