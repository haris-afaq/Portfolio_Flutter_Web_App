// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/services/external_links.dart';
import 'package:portfolio/shared/widgets/hover_card.dart';
import 'package:portfolio/shared/widgets/section_shell.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projects = PortfolioData.projects;

    return SectionShell(
      sectionKey: sectionKey,
      title: 'Projects',
      subtitle:
          'A selection of Flutter builds with strong structure, UX polish, and pragmatic delivery.',
      background: theme.colorScheme.surface,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Responsive.deviceSizeForWidth(constraints.maxWidth);

          final columns = switch (size) {
            DeviceSize.mobile => 1,
            DeviceSize.tablet => 2,
            DeviceSize.desktop => 3,
          };

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppSpacing.lg,
              mainAxisSpacing: AppSpacing.lg,
              // DO NOT set fixed height
              childAspectRatio: 1, // approximate, allows flexible height
            ),
            itemBuilder: (context, index) {
              final project = projects[index];
              return HoverCard(
                onTap: () => ExternalLinks.openUrl(project.link),
                child: _ProjectCard(project: project),
              );
            },
          );
        },
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Title
            Text(
              project.title,
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.sm),

            // Project Description
            Text(
              project.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),

            // Project Tags
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final t in project.tags)
                  Chip(
                    label: Text(t),
                    visualDensity: VisualDensity.compact,
                    side: BorderSide(
                      color: theme.colorScheme.outlineVariant,
                    ),
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  ),
              ],
            ),

            const Spacer(),

            // View Link
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Icon(
                  Icons.arrow_outward_rounded,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:portfolio/core/constants/app_constants.dart';
// import 'package:portfolio/core/constants/portfolio_data.dart';
// import 'package:portfolio/core/responsive/responsive.dart';
// import 'package:portfolio/core/services/external_links.dart';
// import 'package:portfolio/shared/widgets/hover_card.dart';
// import 'package:portfolio/shared/widgets/section_shell.dart';

// class ProjectsSection extends StatelessWidget {
//   const ProjectsSection({super.key, required this.sectionKey});

//   final Key sectionKey;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final projects = PortfolioData.projects;

//     return SectionShell(
//       sectionKey: sectionKey,
//       title: 'Projects',
//       subtitle:
//           'A selection of Flutter builds with strong structure, UX polish, and pragmatic delivery.',
//       background: theme.colorScheme.surface,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final size = Responsive.deviceSizeForWidth(constraints.maxWidth);
//           final columns = switch (size) {
//             DeviceSize.mobile => 1,
//             DeviceSize.tablet => 2,
//             DeviceSize.desktop => 3,
//           };

//           return GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: projects.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: columns,
//               crossAxisSpacing: AppSpacing.lg,
//               mainAxisSpacing: AppSpacing.lg,
//               childAspectRatio: columns == 1 ? 1.6 : 1.2,
//             ),
//             itemBuilder: (context, index) {
//               final p = projects[index];
//               return HoverCard(
//                 onTap: () => ExternalLinks.openUrl(p.link),
//                 child: _ProjectCard(project: p),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class _ProjectCard extends StatelessWidget {
//   const _ProjectCard({required this.project});

//   final Project project;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(project.title, style: theme.textTheme.titleLarge),
//         const SizedBox(height: AppSpacing.sm),
//         Text(
//           project.description,
//           style: theme.textTheme.bodyMedium?.copyWith(
//             color: theme.colorScheme.onSurfaceVariant,
//           ),
//         ),
//         // const Spacer(),
//         Wrap(
//           spacing: AppSpacing.sm,
//           runSpacing: AppSpacing.sm,
//           children: [
//             for (final t in project.tags)
//               Chip(
//                 label: Text(t),
//                 visualDensity: VisualDensity.compact,
//                 side: BorderSide(color: theme.colorScheme.outlineVariant),
//                 backgroundColor: theme.colorScheme.surfaceContainerHighest,
//               ),
//           ],
//         ),
//         const SizedBox(height: AppSpacing.md),
//         Row(
//           children: [
//             Text('View', style: theme.textTheme.labelLarge),
//             const SizedBox(width: AppSpacing.xs),
//             Icon(
//               Icons.arrow_outward_rounded,
//               size: 18,
//               color: theme.colorScheme.primary,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
