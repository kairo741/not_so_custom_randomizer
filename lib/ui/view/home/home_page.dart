import 'package:flutter/material.dart';
import 'package:not_so_custom_randomizer/ui/view/home/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => HomeWidget();
}