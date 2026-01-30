import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/services/external_links.dart';
import 'package:portfolio/shared/widgets/hover_card.dart';
import 'package:portfolio/shared/widgets/section_shell.dart';

class CaseStudiesSection extends StatelessWidget {
  const CaseStudiesSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = PortfolioData.caseStudies;

    return SectionShell(
      sectionKey: sectionKey,
      title: 'UI/UX Case Studies',
      subtitle:
          'Short, outcome-focused snapshots of product thinking and design execution.',
      background: theme.colorScheme.surfaceContainerLowest,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Responsive.deviceSizeForWidth(constraints.maxWidth);

          if (size == DeviceSize.mobile) {
            return Column(
              children: [
                for (final cs in items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                    child: HoverCard(
                      onTap: () => ExternalLinks.openUrl(cs.link),
                      child: _caseStudyCard(context, cs, isGrid: false),
                    ),
                  ),
              ],
            );
          }

          final columns = size == DeviceSize.desktop ? 2 : 1;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppSpacing.lg,
              mainAxisSpacing: AppSpacing.lg,
            ),
            itemBuilder: (context, index) {
              final cs = items[index];
              return HoverCard(
                onTap: () => ExternalLinks.openUrl(cs.link),
                child: _caseStudyCard(context, cs, isGrid: true),
              );
            },
          );
        },
      ),
    );
  }

  Widget _caseStudyCard(
    BuildContext context,
    CaseStudy cs, {
    required bool isGrid,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cs.title, style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),

          _labelValue(context, 'Problem', cs.problem),
          const SizedBox(height: AppSpacing.sm),

          _labelValue(context, 'Solution', cs.solution),
          const SizedBox(height: AppSpacing.sm),

          _labelValue(context, 'Outcome', cs.outcome),

          if (isGrid) const Spacer(), 

          const SizedBox(height: AppSpacing.md),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View case',
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
    );
  }

  Widget _labelValue(BuildContext context, String label, String value) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.labelLarge),
        const SizedBox(height: 6),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _CaseStudyCard extends StatelessWidget {
  const _CaseStudyCard({required this.caseStudy});

  final CaseStudy caseStudy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caseStudy.title,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.md),

          _LabelValue(label: 'Problem', value: caseStudy.problem),
          const SizedBox(height: AppSpacing.sm),

          _LabelValue(label: 'Solution', value: caseStudy.solution),
          const SizedBox(height: AppSpacing.sm),

          _LabelValue(label: 'Outcome', value: caseStudy.outcome),
          const SizedBox(height: AppSpacing.md),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View case',
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
    );
  }
}
class _LabelValue extends StatelessWidget {
  const _LabelValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.labelLarge),
        const SizedBox(height: 6),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
