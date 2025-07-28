import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class IconDataHelper {
  static Widget getIcon(BuildContext context, String icon, {double size = 16}) {
    final iconTheme = IconTheme.of(context);

    switch (icon) {
      case 'FULL_STACK':
        return Icon(Icons.code, size: size);
      case 'CLOUD_COMPUTING':
        return Icon(Icons.cloud, size: size);
      case 'LINKEDIN':
        return HugeIcon(
          icon: HugeIcons.strokeRoundedLinkedin01,
          color: iconTheme.color!,
        );
      default:
        return const Icon(Icons.help_outline, size: 16);
    }
  }
}
