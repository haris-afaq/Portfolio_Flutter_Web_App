import 'package:flutter/material.dart';

import 'package:portfolio/core/animations/app_curves.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/features/home/presentation/controllers/home_sections_controller.dart';

class HomeTopNav extends StatelessWidget {
  const HomeTopNav({
    super.key,
    required this.sections,
    required this.onSectionTap,
  });

  final List<HomeSection> sections;
  final Future<void> Function(HomeSection section) onSectionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: kToolbarHeight,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = Responsive.deviceSizeForWidth(constraints.maxWidth);

            return switch (size) {
              DeviceSize.mobile => _MobileNav(
                  sections: sections,
                  onSectionTap: onSectionTap,
                ),
              DeviceSize.tablet || DeviceSize.desktop => _DesktopNav(
                  sections: sections,
                  onSectionTap: onSectionTap,
                ),
            };
          },
        ),
      ),
    );
  }
}
class _DesktopNav extends StatelessWidget {
  const _DesktopNav({required this.sections, required this.onSectionTap});

  final List<HomeSection> sections;
  final Future<void> Function(HomeSection section) onSectionTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Portfolio',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Wrap(
          spacing: AppSpacing.md,
          children: [
            for (final s in sections)
              _NavItem(
                label: s.label,
                onTap: () => onSectionTap(s),
              ),
          ],
        ),
      ],
    );
  }
}
class _MobileNav extends StatelessWidget {
  const _MobileNav({required this.sections, required this.onSectionTap});

  final List<HomeSection> sections;
  final Future<void> Function(HomeSection section) onSectionTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Portfolio',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleLarge,
          ),
        ),
        PopupMenuButton<HomeSection>(
          tooltip: 'Menu',
          itemBuilder: (context) => [
            for (final s in sections)
              PopupMenuItem<HomeSection>(
                value: s,
                child: Text(s.label),
              ),
          ],
          onSelected: onSectionTap,
          icon: const Icon(Icons.menu_rounded),
        ),
      ],
    );
  }
}
class _NavItem extends StatefulWidget {
  const _NavItem({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered == value) return;
    setState(() => _hovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: AppRadii.button,
        child: AnimatedContainer(
          duration: AppDurations.medium,
          curve: AppCurves.emphasized,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: _hovered
                ? theme.colorScheme.surfaceContainerHighest
                : Colors.transparent,
            borderRadius: AppRadii.button,
          ),
          child: Text(
            widget.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
