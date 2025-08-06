import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeContactSection extends StatefulWidget {
  const HomeContactSection({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  State<HomeContactSection> createState() => _HomeContactSectionState();
}

class _HomeContactSectionState extends State<HomeContactSection> {
  static const List<Map<String, dynamic>> _contactMethods = [
    {
      'icon': Icons.alternate_email,
      'label': 'Email',
      'value': 'alex.dev@example.com',
      'type': 'email',
    },
    {
      'icon': Icons.phone,
      'label': 'Phone',
      'value': '+1-555-987-6543',
      'type': 'phone',
    },
    {
      'icon': Icons.download,
      'label': 'Download CV',
      'value': 'curriculum_vitae.pdf',
      'type': 'download',
    },
  ];

  static const List<Map<String, dynamic>> _socialLinks = [
    {
      'icon': Icons.alternate_email,
      'label': 'Twitter',
      'value': '@alexdev',
      'type': 'social',
    },
    {
      'icon': Icons.code,
      'label': 'GitHub',
      'value': 'github.com/alexdev',
      'type': 'social',
    },
    {
      'icon': Icons.work,
      'label': 'LinkedIn',
      'value': 'linkedin.com/in/alexdev',
      'type': 'social',
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
            'Contact Information',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          _buildContactContent(context),
        ],
      ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    return widget.isMobile
        ? Column(
            children: [
              _buildContactMethods(context),
              const SizedBox(height: 24),
              _buildSocialLinks(context),
              const SizedBox(height: 24),
              _buildContactFooter(context),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Expanded(
                child: _buildContactMethods(context),
              ),
              Expanded(
                child: _buildSocialLinks(context),
              ),
              Expanded(
                child: _buildContactFooter(context),
              ),
            ],
          );
  }

  Widget _buildContactMethods(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            if (widget.isMobile)
              Column(
                children: _contactMethods
                    .map(
                      (contact) => SizedBox(
                        width: double.infinity,
                        child: _buildContactItem(
                          context: context,
                          icon: contact['icon'] as IconData,
                          label: contact['label'] as String,
                          value: contact['value'] as String,
                          type: contact['type'] as String,
                        ),
                      ),
                    )
                    .toList(),
              )
            else
              Column(
                children: _contactMethods
                    .map(
                      (contact) => SizedBox(
                        width: double.infinity,
                        child: _buildContactItem(
                          context: context,
                          icon: contact['icon'] as IconData,
                          label: contact['label'] as String,
                          value: contact['value'] as String,
                          type: contact['type'] as String,
                        ),
                      ),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Social Media',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            if (widget.isMobile)
              Column(
                children: _socialLinks
                    .map(
                      (social) => SizedBox(
                        width: double.infinity,
                        child: _buildContactItem(
                          context: context,
                          icon: social['icon'] as IconData,
                          label: social['label'] as String,
                          value: social['value'] as String,
                          type: social['type'] as String,
                        ),
                      ),
                    )
                    .toList(),
              )
            else
              Column(
                children: _socialLinks
                    .map(
                      (social) => SizedBox(
                        width: double.infinity,
                        child: _buildContactItem(
                          context: context,
                          icon: social['icon'] as IconData,
                          label: social['label'] as String,
                          value: social['value'] as String,
                          type: social['type'] as String,
                        ),
                      ),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    required String type,
  }) {
    Color getIconColor() {
      switch (type) {
        case 'email':
          return Colors.blue;
        case 'phone':
          return Colors.green;
        case 'download':
          return Colors.orange;
        case 'social':
          return Theme.of(context).colorScheme.primary;
        default:
          return Colors.grey;
      }
    }

    return InkWell(
      onTap: () {
        _handleContactTap(type, value);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: getIconColor().withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 28,
                color: getIconColor(),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactFooter(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Work Together",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "I'm always interested in new opportunities and exciting "
              "projects. Whether you're a company looking to hire, or you're a"
              ' fellow developer interested in collaboration, feel free to '
              'reach out!',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Email: alex.dev@example.com | Phone: +1-555-987-6543',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
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

  void _handleContactTap(String type, String value) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Acción: $type - $value'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
