import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/shared/widgets/max_width.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.sectionKey,
    this.background,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final Key? sectionKey;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = Responsive.pagePaddingForWidth(constraints.maxWidth);
        final theme = Theme.of(context);

        return Container(
          key: sectionKey,
          color: background,
          padding: padding.add(
            const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
          ),
          child: MaxWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title!, style: theme.textTheme.headlineSmall),
                  const SizedBox(height: AppSpacing.sm),
                ],
                if (subtitle != null) ...[
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 72 * 10),
                    child: Text(subtitle!, style: theme.textTheme.bodyLarge),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
