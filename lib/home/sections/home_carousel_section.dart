import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeCarouselSection extends StatelessWidget {
  const HomeCarouselSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppProperties.globalPadding),
      constraints: const BoxConstraints(
        minHeight: 400,
        maxWidth: AppProperties.maxWidth,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDWfs50_zrIc8'
            'jQGRCjWFmJLyizd0PQEjNAwv-TQXvuF9JJJhCV0df-W3Ig1JNq40OpmDbkxtJtkn'
            'QC-ERV9SDTvDS_jCGtf6dg9AdKmu5JT7tAyTj8Ltpk8VA-QUhYgeSyodxDuSWEkX'
            'O9AOnP4QgSR3whs60T-a16bR4OlnDqYRwxCTtpu-D6KhHAr5EiZ-ks2IKAlXo4eB'
            'Ba6zikthnY09wqLhU3cobOVtmlHxcJcvzRnBSXfrXASIJuk7gFKV2AkOw8fVbY0I'
            'Vu',
          ),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.end,
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
            ),
          ],
        ),
      ),
    );
  }
}
