import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:not_so_custom_randomizer/ui/view/components/carousel_items/carousel_item.dart';
import 'package:not_so_custom_randomizer/ui/view/components/carousel_items/carousel_items_component.dart';
import 'package:not_so_custom_randomizer/ui/view/home/home_page.dart';

import '../../../core/models/media_item.dart';

class HomeWidget extends State<HomePage> {
  final CarouselSliderController _controller = CarouselSliderController();

  MediaItem cyberpunk2077 = MediaItem(
    coverUrl: "https://www.dolby.com/siteassets/xf-site/content-detail-pages/cyberpunk-2077.jpg",
    name: "Cyberpunk 2077",
    description: "An open-world RPG set in Night City, a megalopolis obsessed with power and body modification.",
    episodeCount: 1,
    // Jogo single-player
    platform: "PC, PlayStation, Xbox",
    releaseDate: "2020",
    genres: ["RPG", "Action", "Open World"],
    studio: "CD Projekt Red",
    author: "CD Projekt",
    note: "Buggy at launch, but improved with updates.",
    status: "Completed",
  );
  MediaItem inception = MediaItem(
    coverUrl: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg",
    name: "Inception",
    description: "A thief who steals corporate secrets through the use of dream-sharing technology.",
    episodeCount: 1,
    // Filme tem apenas 1 "episódio"
    platform: "Netflix",
    releaseDate: "2010",
    genres: ["Action", "Sci-Fi", "Thriller"],
    studio: "Warner Bros.",
    author: "Christopher Nolan",
    note: "Mind-bending plot!",
    status: "Completed",
  );

  MediaItem pharmacyDiaries = MediaItem(
    coverUrl: "https://infinitasvidas.wordpress.com/wp-content/uploads/2024/11/poster-diarios-de-uma-apotecaria.png",
    name: "Pharmacy Diaries",
    description:
        "Maomao led a peaceful life with her father, a renowned pharmacist. However, her life changes overnight when she is sold as a mere servant in the emperor's palace. Unable to adapt to life in royalty, Maomao decides to take drastic measures when the imperial heirs fall ill, embarking on a mission to find a cure. Her boldness catches the attention of Jinshi, a handsome palace official who decides to support her. Now, Maomao gets involved in medical intrigues while her fame spreads through the palace corridors!",
    episodeCount: 29,
    platform: "Crunchyroll",
    releaseDate: "2023",
    genres: ["Drama", "Shoujo"],
    studio: "Toho Animation Studio",
    author: "Natsu Hyūga",
    note: "",
    status: "Ongoing",
  );

  MediaItem blueExorcist = MediaItem(
    coverUrl:
        "https://a.storyblok.com/f/178900/722x1022/eb9e5bdffe/blue_exorcist_the_blue_night_saga_key_art.jpg/m/filters:quality(95)format(webp)",
    name: "Blue Exorcist",
    description:
        "Assiah, the realm of humans, and Gehenna, the realm of demons. Normally, these two dimensions would not interact, but now demons are invading the material world. However, among the members of the human race, there are individuals capable of exorcising these demons: the exorcists.",
    episodeCount: 66,
    platform: "Crunchyroll",
    releaseDate: "2011",
    genres: ["Action", "Adventure", "Comedy", "Fantasy"],
    studio: "A-1 Pictures",
    author: "Kazue Kato",
    note: "Rewatch to remember and watch the new season. There are movies.",
    status: "Ongoing",
  );
  List<MediaItem> itemsList = [];

  @override
  Widget build(BuildContext context) {
    itemsList = [
      pharmacyDiaries,
      blueExorcist,
      cyberpunk2077,
      inception,
    ];
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              CarouselItemsComponent(controller: _controller, itemsList: itemsList),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.red,
                    // foregroundColor: Colors.white,
                    ),
                onPressed: randomButtonFunc,
                child: Text("Aleatorizar"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.attach_file),
      ),
    );
  }

  randomButtonFunc() {
    _controller.stopAutoPlay();

    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('E o escolhido foi...'),
            content: CarouselItem(mediaItem: itemsList[Random().nextInt(itemsList.length - 1)]),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
