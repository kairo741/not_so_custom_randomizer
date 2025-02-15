import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:not_so_custom_randomizer/core/models/media_item.dart';
import 'package:not_so_custom_randomizer/ui/view/components/carousel_items/carousel_item.dart';

class CarouselItemsComponent extends StatelessWidget {
  final CarouselSliderController controller;
  final List<MediaItem> itemsList;

  const CarouselItemsComponent({super.key, required this.controller, required this.itemsList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(height: 600, autoPlay: true, autoPlayInterval: Duration(seconds: 1)),
      items: itemsList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Card(
                color: Color.fromARGB(255, 38, 38, 38),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CarouselItem(
                      mediaItem: i,
                    )));
          },
        );
      }).toList(),
    );
  }
}
