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
      'Programación Orientada a Objetos',
      'Desarrollo Web',
      'Bases de Datos',
      'Control de Versiones (Git)',
      'Arquitectura de Software',
      'Testing y Debugging',
      'APIs y Servicios Web',
      'Metodologías Ágiles',
      'Estructuras de Datos y Algoritmos',
      'DevOps y CI/CD',
    ];
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
                  'Skills',
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
