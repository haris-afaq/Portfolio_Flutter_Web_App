import 'package:flutter/material.dart';

import 'package:portfolio/core/animations/app_curves.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/services/external_links.dart';
import 'package:portfolio/shared/widgets/max_width.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Responsive.deviceSizeForWidth(constraints.maxWidth);
        final padding = Responsive.pagePaddingForWidth(constraints.maxWidth);

        return Container(
          key: sectionKey,
          padding: padding.add(
            const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.surface,
                theme.colorScheme.surfaceContainerLowest,
              ],
            ),
          ),
          child: MaxWidth(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size == DeviceSize.desktop ? 520 : 420,
              ),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: AppDurations.slow,
                curve: AppCurves.emphasized,
                builder: (context, t, child) {
                  return Opacity(
                    opacity: t,
                    child: Transform.translate(
                      offset: Offset(0, (1 - t) * 10),
                      child: child,
                    ),
                  );
                },
                child: _HeroContent(size: size),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.size});

  final DeviceSize size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = PortfolioData.profile;

    final titleStyle = switch (size) {
      DeviceSize.mobile => theme.textTheme.headlineMedium,
      DeviceSize.tablet => theme.textTheme.headlineLarge,
      DeviceSize.desktop => theme.textTheme.displaySmall,
    };

    final bodyStyle = switch (size) {
      DeviceSize.mobile => theme.textTheme.bodyLarge,
      DeviceSize.tablet || DeviceSize.desktop => theme.textTheme.titleMedium,
    };

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(profile.role, style: theme.textTheme.labelLarge),
        const SizedBox(height: AppSpacing.sm),
        Text(profile.name, style: titleStyle),
        const SizedBox(height: AppSpacing.md),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 72 * 10),
          child: Text(profile.summary, style: bodyStyle),
        ),
        const SizedBox(height: AppSpacing.xl),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            PrimaryButton(
              label: 'Email me',
              icon: Icons.mail_rounded,
              onPressed: () => ExternalLinks.openEmail(profile.email),
            ),
            PrimaryButton(
              label: 'View GitHub',
              icon: Icons.code_rounded,
              isEmphasized: false,
              onPressed: () => ExternalLinks.openUrl(profile.github),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          profile.location,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );

    final right = Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: AppRadii.card,
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Focus', style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          _Bullet(text: 'Clean architecture & maintainable Flutter systems'),
          _Bullet(text: 'Responsive UI for mobile, tablet, and web'),
          _Bullet(text: 'Design systems & UX polish with subtle motion'),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: [
              _LinkChip(
                label: 'LinkedIn',
                url: profile.linkedin,
                icon: Icons.work_rounded,
              ),
              _LinkChip(
                label: 'Dribbble',
                url: profile.dribbble,
                icon: Icons.brush_rounded,
              ),
            ],
          ),
        ],
      ),
    );

    return switch (size) {
      DeviceSize.desktop => Row(
          children: [
            Expanded(child: left),
            const SizedBox(width: AppSpacing.xxl),
            SizedBox(width: 380, child: right),
          ],
        ),
      DeviceSize.mobile || DeviceSize.tablet => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            left,
            const SizedBox(height: AppSpacing.xl),
            right,
          ],
        ),
    };
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(
              Icons.check_circle_rounded,
              size: 18,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

class _LinkChip extends StatelessWidget {
  const _LinkChip({required this.label, required this.url, required this.icon});

  final String label;
  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ActionChip(
      onPressed: () => ExternalLinks.openUrl(url),
      avatar: Icon(icon, size: 18),
      label: Text(label),
      side: BorderSide(color: theme.colorScheme.outlineVariant),
    );
  }
}
