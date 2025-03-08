import 'package:ches/presentation/desktop/desktopScreen.dart';
import 'package:ches/presentation/mobile/mobileScreen.dart';
import 'package:ches/presentation/tab/tabScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileLayout(); // Phone
        } else if (constraints.maxWidth < 1200) {
          return const TabletLayout(); // Tablet
        } else {
          return const DesktopLayout(); // Desktop
        }
      },
    );
  }
}


