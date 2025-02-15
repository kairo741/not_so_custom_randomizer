import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarouselItemProperty extends StatelessWidget {
  final String title;
  final String value;

  const CarouselItemProperty({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: .8),
          borderRadius: BorderRadius.circular(5),
        ),
        color: Color.fromARGB(255, 16, 2, 44),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Text.rich(TextSpan(
            style: TextStyle(fontSize: 18),
            children: [
              TextSpan(
                text: "$title: ",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: value,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
              )
            ],
          )),
        ),
      ),
    );
  }
}
