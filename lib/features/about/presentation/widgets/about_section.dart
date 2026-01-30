import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/shared/widgets/hover_card.dart';
import 'package:portfolio/shared/widgets/section_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = PortfolioData.profile;

    return SectionShell(
      sectionKey: sectionKey,
      title: 'About & Skills',
      subtitle:
          'I bring engineering structure to UI work—clear boundaries, reusable components, and a design-first mindset.',
      background: theme.colorScheme.surfaceContainerLowest,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Responsive.deviceSizeForWidth(constraints.maxWidth);
          return switch (size) {
            DeviceSize.desktop => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _AboutCard(profile: profile)),
                  const SizedBox(width: AppSpacing.xl),
                  Expanded(child: const _SkillsCard()),
                ],
              ),
            DeviceSize.mobile || DeviceSize.tablet => Column(
                children: [
                  _AboutCard(profile: profile),
                  const SizedBox(height: AppSpacing.xl),
                  const _SkillsCard(),
                ],
              ),
          };
        },
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  const _AboutCard({required this.profile});

  final PortfolioProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What I value', style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          _ValueLine(
            title: 'Craft',
            body: 'Interfaces should feel simple, calm, and intentional, with every element thoughtfully placed to improve clarity, support usability, and maintain focus, creating a seamless and intuitive user experience.',
          ),
          _ValueLine(
            title: 'Clarity',
            body:
                'I build readable, modular architecture that evolves with the product, maintaining clarity, reducing technical debt, and making ongoing development efficient and sustainable.',
          ),
          _ValueLine(
            title: 'Impact',
            body:
                'I prioritize changes that improve both product metrics and user satisfaction, delivering outcomes that matter while maintaining a balance between design vision and technical execution.',
          ),
          const SizedBox(height: AppSpacing.lg),
          Divider(color: theme.colorScheme.outlineVariant),
          const SizedBox(height: AppSpacing.lg),
          Text('Currently', style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'I welcome opportunities for Flutter development and UI/UX collaborations, contributing structured, design-first solutions that deliver impact.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillsCard extends StatelessWidget {
  const _SkillsCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final skills = PortfolioData.skills;

    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills', style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          _SkillGroup(
            title: 'Development',
            color: theme.colorScheme.primary,
            skills: skills
                .where((s) => s.level == SkillLevel.flutter)
                .toList(growable: false),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SkillGroup(
            title: 'Designing',
            color: theme.colorScheme.tertiary,
            skills: skills
                .where((s) => s.level == SkillLevel.UIUX_Designing)
                .toList(growable: false),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SkillGroup(
            title: 'Others',
            color: theme.colorScheme.secondary,
            skills: skills
                .where((s) => s.level == SkillLevel.Others)
                .toList(growable: false),
          ),
        ],
      ),
    );
  }
}

class _SkillGroup extends StatelessWidget {
  const _SkillGroup({
    required this.title,
    required this.color,
    required this.skills,
  });

  final String title;
  final Color color;
  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(title, style: theme.textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final s in skills)
              Chip(
                label: Text(s.name),
                side: BorderSide(color: theme.colorScheme.outlineVariant),
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
          ],
        ),
      ],
    );
  }
}

class _ValueLine extends StatelessWidget {
  const _ValueLine({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            body,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
