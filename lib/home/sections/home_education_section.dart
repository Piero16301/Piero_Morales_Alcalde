import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeEducationSection extends StatelessWidget {
  const HomeEducationSection({
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Degrees',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _buildDegreeCard(
                  context: context,
                  institution: 'University of Technology',
                  degree: 'Master of Science in Computer Science',
                  coursework:
                      'Relevant Coursework: Algorithms, Data Structures, '
                      'Machine Learning',
                  imageAsset: 'assets/images/university1.jpg', // Placeholder
                ),
                const SizedBox(height: 10),
                _buildDegreeCard(
                  context: context,
                  institution: 'State Institute of Technology',
                  degree: 'Bachelor of Engineering in Software Engineering',
                  coursework:
                      'Relevant Coursework: Software Design, Database Systems,'
                      ' Operating Systems',
                  imageAsset: 'assets/images/university2.jpg', // Placeholder
                ),
                const SizedBox(height: 20),
                const Text(
                  'Certifications',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _buildCertificationCard(
                  context: context,
                  title: 'Certified Software Developer',
                  issuer: 'Issued by: Online Learning Platform',
                ),
                const SizedBox(height: 10),
                _buildCertificationCard(
                  context: context,
                  title: 'Advanced Web Development',
                  issuer: 'Issued by: Tech Training Institute',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDegreeCard({
    required BuildContext context,
    required String institution,
    required String degree,
    required String coursework,
    required String imageAsset,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.school,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    institution,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    coursework,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    degree,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationCard({
    required BuildContext context,
    required String title,
    required String issuer,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 4),
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.verified,
                size: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    issuer,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
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
