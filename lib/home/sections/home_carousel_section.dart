import 'dart:async';
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

class _HomeCarouselSectionState extends State<HomeCarouselSection>
    with TickerProviderStateMixin {
  static const double _sectionHeight = 450;
  late PageController _pageController;
  late Timer _autoScrollTimer;
  late AnimationController _progressController;
  int _currentPage = 0;
  static const int _totalPages = 4;

  @override
  void initState() {
    _pageController = PageController();
    _progressController = AnimationController(
      duration:
          AppProperties.autoScrollDuration + AppProperties.transitionDuration,
      vsync: this,
    );
    _startAutoScroll();
    super.initState();
  }

  void _startAutoScroll() {
    _progressController.forward();
    _autoScrollTimer = Timer.periodic(
      AppProperties.autoScrollDuration + AppProperties.transitionDuration,
      (timer) async {
        if (_pageController.hasClients) {
          final nextPage = (_currentPage + 1) % _totalPages;
          await _pageController.animateToPage(
            nextPage,
            duration: AppProperties.transitionDuration,
            curve: Curves.easeInOut,
          );
          _progressController
            ..reset()
            ..forward();
        }
      },
    );
  }

  void _restartAutoScroll() {
    _autoScrollTimer.cancel();
    _progressController.reset();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _progressController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _sectionHeight,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
              _restartAutoScroll();
            },
            children: [
              HomeCarouselItem(isMobile: widget.isMobile),
              HomeCarouselItem(isMobile: widget.isMobile),
              HomeCarouselItem(isMobile: widget.isMobile),
              HomeCarouselItem(isMobile: widget.isMobile),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _totalPages,
                (index) => AnimatedBuilder(
                  animation: _progressController,
                  builder: (context, child) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 12,
                      height: 12,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(
                                context,
                              ).cardColor.withValues(alpha: 0.4),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.shadow.withValues(alpha: 0.3),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          if (_currentPage == index)
                            CustomPaint(
                              size: const Size(12, 12),
                              painter: PizzaProgressPainter(
                                progress: _progressController.value,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
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
    return Card(
      margin: isMobile
          ? AppProperties.mobilePadding
          : AppProperties.desktopPadding,
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.shadow.withValues(alpha: 0.2),
                  Theme.of(context).colorScheme.shadow.withValues(alpha: 0.4),
                ],
              ),
            ),
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Hi, I'm Piero, a Software Engineer",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).cardColor,
                    height: 1.2,
                    shadows: const [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
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
                    color: Theme.of(context).cardColor,
                    height: 1.6,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        blurRadius: 3,
                        color: Theme.of(
                          context,
                        ).colorScheme.shadow.withValues(alpha: 0.54),
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

class PizzaProgressPainter extends CustomPainter {
  PizzaProgressPainter({
    required this.progress,
    required this.color,
  });

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final backgroundPaint = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, backgroundPaint);

    if (progress > 0) {
      final progressPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      final sweepAngle = 2 * 3.14159 * progress;
      const startAngle = -3.14159 / 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(PizzaProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
