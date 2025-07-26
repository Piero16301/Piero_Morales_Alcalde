import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeSkillsSection extends StatelessWidget {
  const HomeSkillsSection({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    const skills = <String>[
      'Full-Stack Development',
      'Cloud Computing',
      'Machine Learning',
      'Data Analysis',
      'Python',
      'Java',
      'JavaScript',
      'React',
      'AWS',
      'Azure',
    ];

    return Container(
      margin: isMobile
          ? AppProperties.mobilePadding
          : AppProperties.desktopPadding,
      constraints: const BoxConstraints(
        maxWidth: AppProperties.maxWidth,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Key Skills',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) => Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: skills
                        .map(
                          (skill) => Chip(
                            avatar: const Icon(
                              Icons.qr_code_rounded,
                              size: 16,
                            ),
                            label: Text(
                              skill,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            padding: const EdgeInsets.all(5),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.1),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
