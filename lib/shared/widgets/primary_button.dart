import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isEmphasized = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isEmphasized;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = isEmphasized
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurface;
    final bg = isEmphasized
        ? theme.colorScheme.primary
        : theme.colorScheme.surfaceContainerHighest;

    return FilledButton.icon(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: fg,
        backgroundColor: bg,
        shape: const RoundedRectangleBorder(borderRadius: AppRadii.button),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
      icon: Icon(icon ?? Icons.arrow_forward_rounded, size: 18),
      label: Text(label, style: theme.textTheme.labelLarge),
    );
  }
}
