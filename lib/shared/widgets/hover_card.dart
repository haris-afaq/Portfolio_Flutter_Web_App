import 'package:flutter/material.dart';

import 'package:portfolio/core/animations/app_curves.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered == value) return;
    setState(() => _hovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final base = theme.colorScheme.surfaceContainerHighest;
    final hovered = Color.alphaBlend(
      theme.colorScheme.primary.withValues(alpha: 0.06),
      base,
    );

    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: AppDurations.medium,
          curve: AppCurves.emphasized,
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: _hovered ? hovered : base,
            borderRadius: AppRadii.card,
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6),
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
