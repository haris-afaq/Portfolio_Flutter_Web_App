import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/features/about/presentation/widgets/about_section.dart';
import 'package:portfolio/features/case_studies/presentation/widgets/case_studies_section.dart';
import 'package:portfolio/features/contact/presentation/widgets/contact_section.dart';
import 'package:portfolio/features/experience/presentation/widgets/experience_section.dart';
import 'package:portfolio/features/home/presentation/controllers/home_sections_controller.dart';
import 'package:portfolio/features/home/presentation/widgets/hero_section.dart';
import 'package:portfolio/features/home/presentation/widgets/home_top_nav.dart';
import 'package:portfolio/features/projects/presentation/widgets/projects_section.dart';
import 'package:portfolio/shared/widgets/max_width.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeSectionsController _sections = HomeSectionsController();

  @override
  void dispose() {
    _sections.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final padding = Responsive.pagePaddingForWidth(
                constraints.maxWidth,
              );
              return Material(
                color: theme.colorScheme.surface.withValues(alpha: 0.92),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: padding.copyWith(
                      top: AppSpacing.md,
                      bottom: AppSpacing.md,
                    ),
                    child: MaxWidth(
                      child: HomeTopNav(
                        sections: HomeSection.values,
                        onSectionTap: _sections.scrollTo,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _sections.scrollController,
              child: Column(
                children: [
                  HeroSection(sectionKey: _sections.keyFor(HomeSection.hero)),
                  AboutSection(sectionKey: _sections.keyFor(HomeSection.about)),
                  ProjectsSection(
                    sectionKey: _sections.keyFor(HomeSection.projects),
                  ),
                  CaseStudiesSection(
                    sectionKey: _sections.keyFor(HomeSection.caseStudies),
                  ),
                  ExperienceSection(
                    sectionKey: _sections.keyFor(HomeSection.experience),
                  ),
                  ContactSection(
                    sectionKey: _sections.keyFor(HomeSection.contact),
                  ),
                  const SizedBox(height: AppSpacing.sectionGap),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
