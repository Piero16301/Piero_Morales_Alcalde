import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';
import 'package:piero_morales_alcalde/home/widgets/widgets.dart';

class HomeProjectsSection extends StatefulWidget {
  const HomeProjectsSection({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  State<HomeProjectsSection> createState() => _HomeProjectsSectionState();
}

class _HomeProjectsSectionState extends State<HomeProjectsSection> {
  static const Map<String, List<String>> _projectImages = {
    'Project Alpha': [
      'https://picsum.photos/300/200?random=1',
    ],
    'Project Beta': [
      'https://picsum.photos/300/200?random=4',
      'https://picsum.photos/300/200?random=5',
    ],
    'Project Gamma': [
      'https://picsum.photos/300/200?random=7',
      'https://picsum.photos/300/200?random=8',
      'https://picsum.photos/300/200?random=9',
    ],
    'Project Delta': [
      'https://picsum.photos/300/200?random=10',
      'https://picsum.photos/300/200?random=11',
      'https://picsum.photos/300/200?random=12',
    ],
    'Project Epsilon': [
      'https://picsum.photos/300/200?random=13',
      'https://picsum.photos/300/200?random=14',
      'https://picsum.photos/300/200?random=15',
    ],
  };

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
      'status': 'In Production',
      'year': '2023',
    },
    {
      'name': 'Project Delta',
      'category': 'E-commerce Platform',
      'technologies': 'Vue.js, Laravel',
      'description':
          'A comprehensive e-commerce platform built with Vue.js and Laravel. '
          'Features include product catalog management, secure payment '
          'processing, order tracking, and customer reviews. The platform '
          'supports multiple vendors and includes admin dashboard for inventory'
          ' management.',
      'status': 'Completed',
      'year': '2023',
    },
    {
      'name': 'Project Epsilon',
      'category': 'Machine Learning',
      'technologies': 'Python, TensorFlow',
      'description':
          'A machine learning project for image recognition and classification.'
          ' Built using Python and TensorFlow, the system can identify and '
          'categorize objects in real-time. Includes a web interface for '
          'uploading images and viewing results with confidence scores.',
      'status': 'In Progress',
      'year': '2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.isMobile
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
    return widget.isMobile
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
    List<IconData> getTechnologyIcons(String technologies) {
      final techIconMap = {
        'React': Icons.web,
        'Node.js': Icons.storage,
        'Swift': Icons.phone_iphone,
        'Firebase': Icons.cloud,
        'Python': Icons.code,
        'Tableau': Icons.bar_chart,
        'Vue.js': Icons.web_asset,
        'Laravel': Icons.api,
        'TensorFlow': Icons.psychology,
        'JavaScript': Icons.javascript,
        'TypeScript': Icons.keyboard,
        'Flutter': Icons.flutter_dash,
        'Dart': Icons.apps,
        'MongoDB': Icons.storage_outlined,
        'PostgreSQL': Icons.table_view,
      };

      final fallbackIcons = [
        Icons.build,
        Icons.settings,
        Icons.memory,
        Icons.developer_mode,
        Icons.integration_instructions,
        Icons.terminal,
        Icons.code_off,
        Icons.construction,
      ];

      final techList = technologies.split(', ');
      final icons = <IconData>[];

      for (final tech in techList) {
        if (techIconMap.containsKey(tech)) {
          icons.add(techIconMap[tech]!);
        } else {
          icons.add(fallbackIcons[icons.length % fallbackIcons.length]);
        }
      }

      return icons;
    }

    ({String text, Color color, Color backgroundColor}) getStatusInfo() {
      switch (status) {
        case 'Completed':
          return (
            text: 'Terminado',
            color: Colors.green[700]!,
            backgroundColor: Colors.green.withValues(alpha: 0.2),
          );
        case 'In Progress':
          return (
            text: 'En proceso',
            color: Colors.orange[700]!,
            backgroundColor: Colors.orange.withValues(alpha: 0.2),
          );
        case 'In Production':
          return (
            text: 'En producción',
            color: Colors.blue[700]!,
            backgroundColor: Colors.blue.withValues(alpha: 0.2),
          );
        default:
          return (
            text: status,
            color: Colors.grey[700]!,
            backgroundColor: Colors.grey.withValues(alpha: 0.2),
          );
      }
    }

    final statusInfo = getStatusInfo();
    final techIcons = getTechnologyIcons(technologies);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: widget.isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título y estado ocupando todo el ancho
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusInfo.backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          statusInfo.text,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: statusInfo.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Categoría y tecnologías ocupando todo el ancho
                  Row(
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          children: techIcons.map((icon) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 6,
                              ),
                              child: Icon(
                                icon,
                                size: 16,
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Descripción e imágenes al mismo nivel en un Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: HomeImageCarousel(
                            images: _projectImages[name] ?? [],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: statusInfo.backgroundColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    statusInfo.text,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: statusInfo.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onSurface.withValues(
                                          alpha: 0.7,
                                        ),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onSurface.withValues(
                                          alpha: 0.5,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Row(
                                    children: techIcons.map((icon) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
                                        child: Icon(
                                          icon,
                                          size: 18,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: HomeImageCarousel(
                      images: _projectImages[name] ?? [],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.8),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
