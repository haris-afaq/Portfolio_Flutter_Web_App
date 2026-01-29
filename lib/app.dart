import 'package:flutter/material.dart';

import 'package:portfolio/core/routing/app_router.dart';
import 'package:portfolio/core/theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
       darkTheme: AppTheme.dark,
  themeMode: ThemeMode.dark, 
      // theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      // themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
