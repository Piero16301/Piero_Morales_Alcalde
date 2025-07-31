import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeImageCarousel extends StatefulWidget {
  const HomeImageCarousel({
    required this.images,
    super.key,
  });

  final List<String> images;

  @override
  State<HomeImageCarousel> createState() => _HomeImageCarouselState();
}

class _HomeImageCarouselState extends State<HomeImageCarousel> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) return const SizedBox();

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return NetworkImageWithFallback(
                imageUrl: widget.images[index],
              );
            },
          ),
        ),
        // Indicadores de página fijos
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (dotIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == dotIndex
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.5),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
