import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeProjectsSection extends StatelessWidget {
  const HomeProjectsSection({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  static const List<Map<String, String>> _projects = [
    {
      'name': 'Project Alpha',
      'category': 'Web Application',
      'technologies': 'React, Node.js',
      'description':
          'A web application for managing personal finances, built with React '
          'and Node.js. Features include expense tracking, budget planning, '
          'financial goal setting, and detailed analytics. The application '
          'provides a clean and intuitive interface for users to monitor their '
          'spending habits and make informed financial decisions. Implemented '
          'with real-time data synchronization and secure authentication.',
      'status': 'Completed',
      'year': '2024',
    },
    {
      'name': 'Project Beta',
      'category': 'Mobile Application',
      'technologies': 'Swift, Firebase',
      'description':
          'A mobile app for tracking fitness goals, developed using Swift and '
          'Firebase. The app allows users to set personalized workout routines,'
          ' track their progress, and monitor health metrics. Features include '
          'social sharing, achievement badges, and integration with health '
          'devices. Built with a focus on user engagement and motivation '
          'through gamification elements.',
      'status': 'In Progress',
      'year': '2024',
    },
    {
      'name': 'Project Gamma',
      'category': 'Data Analysis Tool',
      'technologies': 'Python, Tableau',
      'description':
          'A data analysis tool for visualizing market trends, implemented with'
          ' Python and Tableau. The tool processes large datasets to identify '
          'patterns, generate insights, and create interactive dashboards. '
          'Features include automated data processing, customizable '
          'visualizations, and export capabilities. Designed for business '
          'analysts and decision-makers to understand market dynamics and '
          'trends.',
      'status': 'Completed',
      'year': '2023',
    },
    {
      'name': 'Project Delta',
      'category': 'E-commerce Platform',
      'technologies': 'Vue.js, Laravel',
      'description':
          'A comprehensive e-commerce platform built with Vue.js and Laravel. '
          'Features include product catalog management, secure payment processing, '
          'order tracking, and customer reviews. The platform supports multiple '
          'vendors and includes admin dashboard for inventory management.',
      'status': 'Completed',
      'year': '2023',
    },
    {
      'name': 'Project Epsilon',
      'category': 'Machine Learning',
      'technologies': 'Python, TensorFlow',
      'description':
          'A machine learning project for image recognition and classification. '
          'Built using Python and TensorFlow, the system can identify and categorize '
          'objects in real-time. Includes a web interface for uploading images and '
          'viewing results with confidence scores.',
      'status': 'In Progress',
      'year': '2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMobile
          ? AppProperties.mobilePadding
          : AppProperties.desktopPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          _buildProjectsScroll(context),
        ],
      ),
    );
  }

  Widget _buildProjectsScroll(BuildContext context) {
    return isMobile
        ? Column(
            children: _projects
                .map(
                  (project) => _buildProjectCard(
                    context: context,
                    name: project['name']!,
                    category: project['category']!,
                    technologies: project['technologies']!,
                    description: project['description']!,
                    status: project['status']!,
                    year: project['year']!,
                  ),
                )
                .toList(),
          )
        : SizedBox(
            height: 340,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                final project = _projects[index];
                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 20),
                  child: _buildProjectCard(
                    context: context,
                    name: project['name']!,
                    category: project['category']!,
                    technologies: project['technologies']!,
                    description: project['description']!,
                    status: project['status']!,
                    year: project['year']!,
                  ),
                );
              },
            ),
          );
  }

  Widget _buildProjectCard({
    required BuildContext context,
    required String name,
    required String category,
    required String technologies,
    required String description,
    required String status,
    required String year,
  }) {
    Color cardColor;

    switch (name) {
      case 'Project Alpha':
        cardColor = const Color(0xFFB8E6B8);
      case 'Project Beta':
        cardColor = const Color(0xFFFFD4B8);
      case 'Project Gamma':
        cardColor = const Color(0xFFB8E6E6);
      case 'Project Delta':
        cardColor = const Color(0xFFE6B8FF);
      case 'Project Epsilon':
        cardColor = const Color(0xFFFFE6B8);
      default:
        cardColor = Theme.of(
          context,
        ).colorScheme.primary.withValues(alpha: 0.1);
    }

    return Card(
      margin: EdgeInsets.only(bottom: isMobile ? 16 : 0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: isMobile ? null : 320,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: isMobile
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$category | $technologies',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description.length > 100
                                ? '${description.substring(0, 97)}...'
                                : description,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.3,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.8),
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildProjectMockup(name),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildProjectMockup(name),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        description.length > 120
                            ? '${description.substring(0, 117)}...'
                            : description,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildProjectMockup(String projectName) {
    switch (projectName) {
      case 'Project Alpha':
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 'Project Beta':
        return Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => Container(
                    width: 12,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 'Project Gamma':
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildChartBar(0.6, compact: true),
                    _buildChartBar(0.8, compact: true),
                    _buildChartBar(0.4, compact: true),
                    _buildChartBar(0.9, compact: true),
                    _buildChartBar(0.7, compact: true),
                    _buildChartBar(1.0, compact: true),
                    _buildChartBar(0.5, compact: true),
                  ],
                ),
              ),
            ],
          ),
        );
      case 'Project Delta':
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    6,
                    (index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 'Project Epsilon':
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildChartBar(double height, {bool compact = false}) {
    final barHeight = compact ? 40 * height : 60 * height;
    return Container(
      width: compact ? 4 : 8,
      height: barHeight,
      decoration: BoxDecoration(
        color: Colors.teal.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
