import 'package:flutter/widgets.dart';

import 'package:portfolio/core/constants/app_constants.dart';

enum DeviceSize { mobile, tablet, desktop }

sealed class Responsive {
  static DeviceSize deviceSizeForWidth(double width) {
    if (width < AppLayout.mobileBreakpoint) return DeviceSize.mobile;
    if (width < AppLayout.tabletBreakpoint) return DeviceSize.tablet;
    return DeviceSize.desktop;
  }

  static EdgeInsets pagePaddingForWidth(double width) {
    final size = deviceSizeForWidth(width);
    return switch (size) {
      DeviceSize.mobile => const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
        ),
      DeviceSize.tablet => const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
        ),
      DeviceSize.desktop => const EdgeInsets.symmetric(
          horizontal: AppSpacing.xxl,
        ),
    };
  }

  static double clampContentWidth(double width) {
    return width > AppLayout.maxContentWidth
        ? AppLayout.maxContentWidth
        : width;
  }
}
