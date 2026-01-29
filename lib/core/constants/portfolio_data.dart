import 'package:flutter/foundation.dart';

@immutable
class PortfolioProfile {
  const PortfolioProfile({
    required this.name,
    required this.role,
    required this.location,
    required this.summary,
    required this.email,
    required this.linkedin,
    required this.github,
    required this.dribbble,
  });

  final String name;
  final String role;
  final String location;
  final String summary;
  final String email;
  final String linkedin;
  final String github;
  final String dribbble;
}

@immutable
class Skill {
  const Skill({required this.name, required this.level});

  final String name;
  final SkillLevel level;
}

enum SkillLevel { core, strong, familiar }

@immutable
class Project {
  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.link,
  });

  final String title;
  final String description;
  final List<String> tags;
  final String link;
}

@immutable
class CaseStudy {
  const CaseStudy({
    required this.title,
    required this.problem,
    required this.solution,
    required this.outcome,
    required this.link,
  });

  final String title;
  final String problem;
  final String solution;
  final String outcome;
  final String link;
}

@immutable
class ExperienceItem {
  const ExperienceItem({
    required this.company,
    required this.role,
    required this.period,
    required this.highlights,
  });

  final String company;
  final String role;
  final String period;
  final List<String> highlights;
}

sealed class PortfolioData {
  static const profile = PortfolioProfile(
    name: 'HARIS AFAQ',
    role: 'Flutter Developer • UI/UX Designer',
    location: 'Islamabad, Pakistan',
    summary:
        'I design and build polished Flutter experiences—fast, accessible, and aligned to product goals. '
        'I blend engineering discipline with UI/UX craft to ship interfaces that feel effortless.',
    email: 'you@example.com',
    linkedin: 'https://www.linkedin.com/in/your-handle',
    github: 'https://github.com/your-handle',
    dribbble: 'https://dribbble.com/your-handle',
  );

  static const skills = <Skill>[
    Skill(name: 'Flutter', level: SkillLevel.core),
    Skill(name: 'Dart', level: SkillLevel.core),
    Skill(name: 'Material 3', level: SkillLevel.strong),
    Skill(name: 'Responsive UI', level: SkillLevel.core),
    Skill(name: 'Animations', level: SkillLevel.strong),
    Skill(name: 'Design Systems', level: SkillLevel.core),
    Skill(name: 'Figma', level: SkillLevel.core),
    Skill(name: 'UX Research', level: SkillLevel.strong),
    Skill(name: 'Accessibility', level: SkillLevel.strong),
    Skill(name: 'CI/CD', level: SkillLevel.familiar),
  ];

  static const projects = <Project>[
    Project(
      title: 'Fintech Dashboard',
      description:
          'A production-grade analytics dashboard with advanced filtering, responsive data tables, and offline-friendly caching.',
      tags: <String>['Flutter Web', 'Material 3', 'Architecture'],
      link: 'https://github.com/your-handle/fintech-dashboard',
    ),
    Project(
      title: 'Healthcare Booking App',
      description:
          'End-to-end appointment flow with thoughtful UX, strong validation, and clean state boundaries for maintainability.',
      tags: <String>['Flutter', 'UX', 'Forms'],
      link: 'https://github.com/your-handle/health-booking',
    ),
    Project(
      title: 'Design System Kit',
      description:
          'Reusable component library with tokens, typography scale, and themed widgets to accelerate consistent UI delivery.',
      tags: <String>['Design System', 'Tokens', 'Reusable UI'],
      link: 'https://github.com/your-handle/design-system-kit',
    ),
  ];

  static const caseStudies = <CaseStudy>[
    CaseStudy(
      title: 'Onboarding Redesign',
      problem: 'High drop-off during onboarding on mobile.',
      solution:
          'Simplified steps, reduced cognitive load, and introduced progressive disclosure with clearer copy.',
      outcome: 'Improved completion rate and reduced time-to-first-action.',
      link: 'https://dribbble.com/your-handle',
    ),
    CaseStudy(
      title: 'Checkout UX Optimization',
      problem: 'Users abandoned checkout due to unclear errors and friction.',
      solution:
          'Introduced inline validation, clearer hierarchy, and a calmer visual language.',
      outcome: 'Lower abandonment and fewer support tickets.',
      link: 'https://dribbble.com/your-handle',
    ),
  ];

  static const experience = <ExperienceItem>[
    ExperienceItem(
      company: 'Company Name',
      role: 'Flutter Developer',
      period: '2024 — Present',
      highlights: <String>[
        'Shipped responsive Flutter Web experiences with a component-driven approach.',
        'Built reusable UI patterns and improved performance through targeted optimizations.',
        'Collaborated with design and product to align scope with measurable outcomes.',
      ],
    ),
    ExperienceItem(
      company: 'Studio / Freelance',
      role: 'UI/UX Designer',
      period: '2022 — 2024',
      highlights: <String>[
        'Designed end-to-end flows from discovery to high-fidelity prototypes.',
        'Established design tokens and handoff processes for consistent implementation.',
      ],
    ),
  ];
}
