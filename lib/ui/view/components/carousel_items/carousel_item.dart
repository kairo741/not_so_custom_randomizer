import 'package:flutter/material.dart';
import 'package:not_so_custom_randomizer/core/models/media_item.dart';
import 'package:not_so_custom_randomizer/ui/view/components/carousel_items/carousel_item_property.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarouselItem extends StatefulWidget {
  final MediaItem mediaItem;

  const CarouselItem({super.key, required this.mediaItem});

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  late Future<void> _imageFuture;
  bool _isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    _imageFuture = _loadImage();
  }

  Future<void> _loadImage() async {
    final image = Image.network(widget.mediaItem.coverUrl);
    image.image.resolve(ImageConfiguration());

    // Quando a imagem é carregada, atualize o estado para desativar o skeleton
    if (mounted) {
      setState(() {
        _isImageLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: !_isImageLoaded, // Desativa o skeleton quando a imagem é carregada
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              margin: EdgeInsets.all(10),
              // child: ClipRRect(
              // borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                height: 300,
                widget.mediaItem.coverUrl,
                fit: BoxFit.cover,
              )
              // ),
              ),
          CarouselItemProperty(
            title: "Título",
            value: widget.mediaItem.name,
          ),
          CarouselItemProperty(
            title: "Data de Lançamento",
            value: widget.mediaItem.releaseDate,
          ),
          CarouselItemProperty(
            title: "Gênero(s)",
            value: widget.mediaItem.genresString,
          ),
          CarouselItemProperty(
            title: "Estudio",
            value: widget.mediaItem.studio,
          ),
          CarouselItemProperty(
            title: "Autor",
            value: widget.mediaItem.author,
          ),
          CarouselItemProperty(
            title: "Status",
            value: widget.mediaItem.status,
          ),
        ],
      ),
    );
  }
}
