import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeCarouselSection extends StatefulWidget {
  const HomeCarouselSection({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  State<HomeCarouselSection> createState() => _HomeCarouselSectionState();
}

class _HomeCarouselSectionState extends State<HomeCarouselSection> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    return SizedBox(
      height: MediaQuery.of(context).size.height - appBarHeight,
      child: PageView(
        controller: _pageController,
        children: [
          HomeCarouselItem(isMobile: widget.isMobile),
          HomeCarouselItem(isMobile: widget.isMobile),
          HomeCarouselItem(isMobile: widget.isMobile),
          HomeCarouselItem(isMobile: widget.isMobile),
        ],
      ),
    );
  }
}

class HomeCarouselItem extends StatelessWidget {
  const HomeCarouselItem({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMobile
          ? AppProperties.mobilePadding
          : AppProperties.desktopPadding,
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
