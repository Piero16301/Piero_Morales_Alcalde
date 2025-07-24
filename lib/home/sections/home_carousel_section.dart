import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeCarouselSection extends StatefulWidget {
  const HomeCarouselSection({super.key});

  @override
  State<HomeCarouselSection> createState() => _HomeCarouselSectionState();
}

class _HomeCarouselSectionState extends State<HomeCarouselSection> {
  late CarouselController _carouselController;

  @override
  void initState() {
    _carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final availableWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height - appBarHeight,
      child: CarouselView(
        controller: _carouselController,
        itemExtent: availableWidth,
        children: const [
          HomeCarouselItem(),
          HomeCarouselItem(),
          HomeCarouselItem(),
          HomeCarouselItem(),
        ],
      ),
    );
  }
}

class HomeCarouselItem extends StatelessWidget {
  const HomeCarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppProperties.globalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          const Positioned.fill(
            child: NetworkImageWithFallback(
              imageUrl:
                  'https://images.unsplash.com/photo-1498050108023-c5249f4df085'
                  '?w=1920&h=1080&fit=crop',
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(143, 163, 163, 0.8),
                  Color.fromRGBO(107, 125, 125, 0.8),
                ],
              ),
            ),
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hi, I'm Piero, a Software Engineer",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 24),
                Text(
                  "I'm a software engineer with a passion for building "
                  'innovative solutions. I specialize in full-stack '
                  'development, cloud computing, and machine learning. '
                  'Explore my portfolio to see my work and learn more '
                  'about my skills and experience.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.6,
                    shadows: const [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
