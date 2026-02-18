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
      title: 'Flutter Projects',
      subtitle:
          'A selection of Flutter builds with strong structure, UX polish, and pragmatic delivery.',
      background: theme.colorScheme.surface,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Responsive.deviceSizeForWidth(constraints.maxWidth);
          
          // Calculate cross axis count based on screen size
          final crossAxisCount = switch (size) {
            DeviceSize.mobile => 1,
            DeviceSize.tablet => 2,
            DeviceSize.desktop => 3,
          };

          // Use different layout approaches based on screen size
          if (size == DeviceSize.mobile) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                  child: HoverCard(
                    onTap: () => ExternalLinks.openUrl(project.link),
                    child: _ProjectCard(project: project),
                  ),
                );
              },
            );
          } else {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: AppSpacing.lg,
                mainAxisSpacing: AppSpacing.lg,
                // Use fixed height for tablets and desktops
                mainAxisExtent: size == DeviceSize.tablet ? 300 : 320,
              ),
              itemBuilder: (context, index) {
                final project = projects[index];
                return HoverCard(
                  onTap: () => ExternalLinks.openUrl(project.link),
                  child: _ProjectCard(project: project),
                );
              },
            );
          }
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Title
              Text(
                project.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: isMobile ? 20 : 22,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.sm),

              // Project Description
              Expanded(
                flex: 2,
                child: Text(
                  project.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: isMobile ? 13 : 14,
                  ),
                  maxLines: isMobile ? 3 : 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Project Tags
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final t in project.tags)
                    Container(
                      margin: const EdgeInsets.only(right: 4, bottom: 4),
                      child: Chip(
                        label: Text(
                          t,
                          style: const TextStyle(fontSize: 11),
                        ),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 0,
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.outlineVariant,
                        ),
                        backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      ),
                    ),
                ],
              ),

              const Spacer(),

              // View Link
              Container(
                margin: const EdgeInsets.only(top: AppSpacing.sm),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View Project',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Icon(
                      Icons.arrow_outward_rounded,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

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
//       title: 'Flutter Projects',
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
             
//               childAspectRatio: 1, 
//             ),
//             itemBuilder: (context, index) {
//               final project = projects[index];
//               return HoverCard(
//                 onTap: () => ExternalLinks.openUrl(project.link),
//                 child: _ProjectCard(project: project),
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

//     return Padding(
//       padding: const EdgeInsets.all(AppSpacing.md),
//       child: IntrinsicHeight(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Project Title
//             Text(
//               project.title,
//               style: theme.textTheme.titleLarge,
//             ),
//             const SizedBox(height: AppSpacing.sm),

//             // Project Description
//             Text(
//               project.description,
//               style: theme.textTheme.bodyMedium?.copyWith(
//                 color: theme.colorScheme.onSurfaceVariant,
//               ),
//             ),
//             const SizedBox(height: AppSpacing.sm),

//             // Project Tags
//             Wrap(
//               spacing: AppSpacing.sm,
//               runSpacing: AppSpacing.sm,
//               children: [
//                 for (final t in project.tags)
//                   Chip(
//                     label: Text(t),
//                     visualDensity: VisualDensity.compact,
//                     side: BorderSide(
//                       color: theme.colorScheme.outlineVariant,
//                     ),
//                     backgroundColor: theme.colorScheme.surfaceContainerHighest,
//                   ),
//               ],
//             ),

//             const Spacer(),

//             // View Link
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'View',
//                   style: theme.textTheme.labelLarge?.copyWith(
//                     color: theme.colorScheme.primary,
//                   ),
//                 ),
//                 const SizedBox(width: AppSpacing.xs),
//                 Icon(
//                   Icons.arrow_outward_rounded,
//                   size: 18,
//                   color: theme.colorScheme.primary,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
