import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'ui/view/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const _title = 'Not So Custom Randomizer';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        extensions: const [
          SkeletonizerConfigData.dark()
        ],
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const HomePage(title: _title),
    );
  }
}

