import 'package:flutter/material.dart';

import 'package:portfolio/core/routing/app_routes.dart';
import 'package:portfolio/features/home/presentation/pages/home_page.dart';

sealed class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          settings: const RouteSettings(name: AppRoutes.home),
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: const RouteSettings(name: AppRoutes.unknown),
          builder: (_) => const _UnknownRoutePage(),
        );
    }
  }
}

class _UnknownRoutePage extends StatelessWidget {
  const _UnknownRoutePage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text('Page not found', style: theme.textTheme.titleLarge),
      ),
    );
  }
}
