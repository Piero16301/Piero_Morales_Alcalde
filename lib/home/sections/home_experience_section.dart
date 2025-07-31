import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeExperienceSection extends StatelessWidget {
  const HomeExperienceSection({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  static const List<Map<String, String>> _experiences = [
    {
      'position': 'Senior Software Engineer',
      'company': 'Tech Innovators Inc.',
      'period': '2020 - Present',
      'description':
          'At Tech Innovators Inc., I led a team of engineers in '
          'developing scalable web applications using modern '
          'frameworks like React and Node.js. I was responsible for'
          ' architecting solutions, mentoring junior developers, '
          'and ensuring code quality through rigorous testing and '
          'code reviews. Key achievements include improving '
          'application performance by 30% and reducing bug reports'
          ' by 20%.',
    },
    {
      'position': 'Software Engineer',
      'company': 'Code Crafters LLC',
      'period': '2018 - 2020',
      'description':
          'At Code Crafters LLC, I contributed to the development '
          'of several client projects, focusing on front-end '
          'development with Angular and back-end development with '
          'Java. I gained experience in Agile methodologies and '
          'worked closely with designers and product managers to '
          'deliver high-quality software solutions. Notable '
          'projects include a customer relationship management '
          'system and an e-commerce platform.',
    },
    {
      'position': 'Junior Developer',
      'company': 'Startup Solutions Ltd.',
      'period': '2016 - 2018',
      'description':
          'At Startup Solutions Ltd., I started my career as a '
          'junior developer, working on a variety of projects '
          'using technologies like PHP and MySQL. I was involved in'
          ' both front-end and back-end development, gaining a '
          'solid foundation in software engineering principles. I '
          'contributed to the development of a content management '
          'system and a web-based inventory management tool.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMobile
          ? AppProperties.mobilePadding
          : AppProperties.desktopPadding,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Professional Experience',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTimelineSection(context),
                const SizedBox(height: 32),
                _buildExperienceDetails(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Professional Experience',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildExperienceDetails(context),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(child: _buildTimelineSection(context)),
              ],
            ),
    );
  }

  Widget _buildTimelineSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: isMobile ? 0 : 16),
          child: Text(
            'Timeline',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ..._experiences.asMap().entries.map((entry) {
          final index = entry.key;
          final experience = entry.value;
          final isLast = index == _experiences.length - 1;

          return _buildTimelineItem(
            context: context,
            position: experience['position']!,
            company: experience['company']!,
            period: experience['period']!,
            isLast: isLast,
          );
        }),
      ],
    );
  }

  Widget _buildTimelineItem({
    required BuildContext context,
    required String position,
    required String company,
    required String period,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: 14,
                child: Align(
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              // Línea conectora
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    position,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    period,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceDetails(BuildContext context) {
    return Column(
      children: _experiences
          .map(
            (experience) => _buildExperienceCard(
              context: context,
              position: experience['position']!,
              company: experience['company']!,
              period: experience['period']!,
              description: experience['description']!,
            ),
          )
          .toList(),
    );
  }

  Widget _buildExperienceCard({
    required BuildContext context,
    required String position,
    required String company,
    required String period,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
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
                Icons.work,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    position,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$company | $period',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.8),
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
