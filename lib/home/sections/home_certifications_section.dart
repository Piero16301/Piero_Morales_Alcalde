import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeCertificationsSection extends StatefulWidget {
  const HomeCertificationsSection({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  State<HomeCertificationsSection> createState() =>
      _HomeCertificationsSectionState();
}

class _HomeCertificationsSectionState extends State<HomeCertificationsSection> {
  static const List<Map<String, String>> _certifications = [
    {
      'name': 'Certified Software Developer',
      'organization': 'Tech Academy',
      'dateObtained': '2022-05-15',
      'visualColor': '4CAF50',
    },
    {
      'name': 'Cloud Solutions Architect',
      'organization': 'Cloud Providers Inc.',
      'dateObtained': '2023-01-20',
      'visualColor': '2196F3',
    },
    {
      'name': 'Agile Project Management',
      'organization': 'Agile Institute',
      'dateObtained': '2023-08-10',
      'visualColor': 'FF9800',
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
            'Certifications',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          _buildCertificationsTable(context),
        ],
      ),
    );
  }

  Widget _buildCertificationsTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Certification',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                if (!widget.isMobile) ...[
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Issuing Organization',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Date Obtained',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Visual Representation',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          ..._certifications.asMap().entries.map((entry) {
            final index = entry.key;
            final certification = entry.value;
            final isLast = index == _certifications.length - 1;

            return _buildCertificationRow(
              context: context,
              certification: certification,
              isLast: isLast,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCertificationRow({
    required BuildContext context,
    required Map<String, String> certification,
    required bool isLast,
  }) {
    final colorValue = int.parse(
      'FF${certification['visualColor']}',
      radix: 16,
    );
    final visualColor = Color(colorValue);

    final dateObtained = certification['dateObtained']!;
    final formattedDate = _formatDate(dateObtained);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
        borderRadius: isLast
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
            : null,
      ),
      child: widget.isMobile
          ? _buildMobileCertificationRow(
              context: context,
              certification: certification,
              visualColor: visualColor,
              formattedDate: formattedDate,
            )
          : _buildDesktopCertificationRow(
              context: context,
              certification: certification,
              visualColor: visualColor,
              formattedDate: formattedDate,
            ),
    );
  }

  Widget _buildMobileCertificationRow({
    required BuildContext context,
    required Map<String, String> certification,
    required Color visualColor,
    required String formattedDate,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                certification['name']!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                certification['organization']!,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Icon(
          Icons.verified,
          color: visualColor,
          size: 24,
        ),
      ],
    );
  }

  Widget _buildDesktopCertificationRow({
    required BuildContext context,
    required Map<String, String> certification,
    required Color visualColor,
    required String formattedDate,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            certification['name']!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            certification['organization']!,
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            formattedDate,
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Icon(
            Icons.verified,
            color: visualColor,
            size: 24,
          ),
        ),
      ],
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final months = [
        '',
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${date.year}-${months[date.month].padLeft(2, '0')}-'
          '${date.day.toString().padLeft(2, '0')}';
    } on Exception {
      return dateString;
    }
  }
}
