import 'package:flutter/widgets.dart';

import 'package:portfolio/core/animations/app_curves.dart';
import 'package:portfolio/core/constants/app_constants.dart';

enum HomeSection { hero, about, projects, caseStudies, experience, contact }

extension HomeSectionX on HomeSection {
  String get label => switch (this) {
        HomeSection.hero => 'Home',
        HomeSection.about => 'About',
        HomeSection.projects => 'Projects',
        HomeSection.caseStudies => 'Case Studies',
        HomeSection.experience => 'Experience',
        HomeSection.contact => 'Contact',
      };
}

class HomeSectionsController {
  HomeSectionsController() : scrollController = ScrollController();

  final ScrollController scrollController;

  final Map<HomeSection, GlobalKey> _keys = {
    for (final s in HomeSection.values) s: GlobalKey(debugLabel: s.name),
  };

  GlobalKey keyFor(HomeSection section) => _keys[section]!;

  Future<void> scrollTo(HomeSection section) async {
    final context = _keys[section]?.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      alignment: 0,
      duration: AppDurations.slow,
      curve: AppCurves.emphasized,
    );
  }

  void dispose() {
    scrollController.dispose();
  }
}
