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
    required this.whatsapp,
  });

  final String name;
  final String role;
  final String location;
  final String summary;
  final String email;
  final String linkedin;
  final String github;
  final String whatsapp;
}

@immutable
class Skill {
  const Skill({required this.name, required this.level});

  final String name;
  final SkillLevel level;
}

enum SkillLevel { flutter, UIUX_Designing, Others }

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
    email: 'harisafaq22@gamil.com',
    linkedin: 'https://www.linkedin.com/in/haris-afaq-044570306?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
    github: 'https://github.com/haris-afaq?tab=repositories',
    whatsapp: 'https://wa.me/923144763488',
  );

  static const skills = <Skill>[
    Skill(name: 'Flutter', level: SkillLevel.flutter),
    Skill(name: 'Dart Programming', level: SkillLevel.flutter),
    Skill(name: 'Firebase & APIs Intergration', level: SkillLevel.flutter),
    Skill(name: 'Figma + Adobe XD', level: SkillLevel.UIUX_Designing),
    Skill(name: 'Bloc State Management', level: SkillLevel.flutter),
    Skill(name: 'Clean Coding', level: SkillLevel.flutter),
    Skill(name: 'UX Research', level: SkillLevel.UIUX_Designing),
    Skill(name: 'Prototyping', level: SkillLevel.UIUX_Designing),
    Skill(name: 'Wireframming', level: SkillLevel.UIUX_Designing),
    Skill(name: 'User Research', level: SkillLevel.UIUX_Designing),
    Skill(name: 'Mockups', level: SkillLevel.UIUX_Designing),
    Skill(name: 'Adobe Illustrator', level: SkillLevel.UIUX_Designing),
    Skill(name: 'Adobe Photoshop', level: SkillLevel.UIUX_Designing),
    Skill(name: 'Adobe InDesign', level: SkillLevel.UIUX_Designing),
    Skill(name: 'Canva', level: SkillLevel.UIUX_Designing),
    Skill(name: 'FlutterFlow', level: SkillLevel.Others),
    Skill(name: 'Adobe Premier Pro', level: SkillLevel.Others),
  ];

  static const projects = <Project>[
    Project(
      title: 'Learnify',
      description:
          'Learnify is a scalable learning app with clean architecture and a responsive, engaging UI.',
      tags: <String>['Flutter', 'Firebase', 'Youtube API', 'Bloc', 'Clean Coding'],
      link: 'https://github.com/haris-afaq/Learnify_App',
    ),
    Project(
      title: 'Ecommerce-App',
      description:
          'An ecommerce platform with clean code, responsive UI, and intuitive, user-focused design.',
      tags: <String>['Flutter', 'Firebase', 'Cloudinary', 'GetX', 'Clean Coding'],
      link: 'https://github.com/haris-afaq/Ecommerce-App',
    ),
    Project(
      title: 'Planty',
      description:
          'Detect plant diseases by uploading an image or capturing one with your phone camera.',
      tags: <String>['Flutter', 'GetX State Management', 'TensorFlow Lite'],
      link: 'https://github.com/haris-afaq/Planty',
    ),
    Project(
      title: 'Users App',
      description:
          'A user-friendly food delivery app for seamless restaurant browsing, easy ordering, and live order tracking.',
      tags: <String>['Flutter', 'Firebase', 'Food Delivery App'],
      link: 'https://github.com/haris-afaq/Users-App',
    ),
     Project(
      title: 'Sellers App',
      description:
          'A seller app that allows users to list and manage homemade or restaurant food for sale, track orders, and connect with customers seamlessly.',
      tags: <String>['Flutter', 'Firebase', 'Food Delivery App'],
      link: 'https://github.com/haris-afaq/Sellers-App',
    ),
      Project(
      title: 'Riders App',
      description:
          'A rider app that enables delivery partners to receive, manage, and complete orders efficiently in real time.',
      tags: <String>['Flutter', 'Firebase', 'Food Delivery App'],
      link: 'https://github.com/haris-afaq/Rider-App',
    ),
     Project(
      title: 'COVID App',
      description:
          'A COVID detection app built to practice API integration, developed by following Asif Taj’s tutorials for hands-on learning.',
      tags: <String>['Flutter', 'APIs Integration', 'Asif Taj'],
      link: 'https://github.com/haris-afaq/Covid-App',
    ),
     Project(
      title: 'Bloc State Management',
      description:
          'A Flutter project to practice Bloc and reactive state management with events, states, and UI updates.',
      tags: <String>['Flutter', 'Bloc State Management', 'Clean Coding'],
      link: 'https://github.com/haris-afaq/Bloc_State_Management_Practice',
    ),
     Project(
      title: 'Flutter_Clean_Architecture',
      description:
          'A Flutter template using BLoC and Clean Architecture for scalable, maintainable, and testable apps.',
      tags: <String>['Flutter', 'Bloc', 'Clean Coding', 'Bloc Patterns'],
      link: 'https://github.com/haris-afaq/Flutter_Clean_Architecture',
    ),
   Project(
  title: 'AgriSense',
  description:
      'AgriSense is a Flutter app using TensorFlow Lite to detect plant diseases, suggest treatments, guide soil & water testing, and locate nearby labs.',
  tags: <String>['Flutter', 'Firebase', 'Bloc', 'TensorFlow Lite',],
  link: 'https://github.com/haris-afaq/Agri_Sense_App',
),

  ];

  static const caseStudies = <CaseStudy>[
    CaseStudy(
      title: 'Learnify Mobile App Design',
      problem: 'Many learning apps struggle with scalability, maintainability, and providing a seamless user experience, leading to slow performance and inconsistent interfaces.',
      solution:
          'Learnify was built using modern development practices with clean architecture, modular code structure, and a responsive UI to ensure a robust, maintainable, and scalable learning platform.',
      outcome: 'The app delivers an efficient and engaging learning experience, with smooth performance, consistent design, and a codebase that is easy to extend and maintain over time.',
      link: 'https://www.figma.com/proto/0vM2HSbrIy7KGh10lRoOC0/Learnify-Mobile-App?node-id=7-1809&p=f&t=08qRfSzt5OVOWspF-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=7%3A1809',
    ),
    CaseStudy(
      title: 'Jugarhi Chutu',
      problem: 'Restaurants and food vendors often struggle to showcase their menu online and manage delivery orders efficiently, leading to delayed orders and poor user experience.',
      solution:
          'Designed a web app for Jugarhi Chutu that allows users to browse menus, place orders, and track deliveries seamlessly, with an intuitive and responsive UI for smooth interactions.',
      outcome: 'The web app improves order management for vendors, provides a seamless browsing and ordering experience for customers, and enhances overall delivery efficiency and user satisfaction.',
      link: 'https://www.figma.com/design/OSbugn3OIC0qBw4YFYfQkc/Jugari-Chutu?node-id=0-1&t=DYBV40SHxCaIeOvH-1',
    ),
     CaseStudy(
      title: 'Shoporia',
      problem: 'Small businesses and sellers often lack a streamlined platform to showcase products and reach customers, while users face difficulty discovering and ordering items easily.',
      solution:
          'Shoporia is a mobile ecommerce app that allows sellers to list products and manage orders, while providing users with an intuitive interface to browse, search, and track products seamlessly.',
      outcome: 'The app connects sellers and buyers efficiently, enhances product discoverability, simplifies ordering, and delivers a smooth, user-friendly shopping experience.',
      link: 'https://www.figma.com/design/HbsPuNi2MrAzLos1Ol4hEQ/Commerce-App-Designed-for-Portfolio?node-id=0-1&t=DYBV40SHxCaIeOvH-1',
    ),
     CaseStudy(
      title: 'Music App',
      problem: 'Users often struggle with cluttered music apps that make discovering, playing, and organizing songs inefficient and frustrating.',
      solution:
          'Designed a music app with a clean, intuitive interface that allows users to browse, search, and play songs easily, while offering organized playlists and smooth navigation.',
      outcome: 'The app provides an engaging and seamless listening experience, helping users discover music effortlessly and manage their playlists with ease.',
      link: 'https://www.figma.com/design/DmTcdvSmC5D5heiQLThcdl/music-app?node-id=65-2249&t=DYBV40SHxCaIeOvH-1',
    ),
  CaseStudy(
  title: 'AgriSense',
  problem: 'Farmers and gardeners often struggle to identify plant diseases accurately, access proper treatment methods, and find reliable resources for soil and water testing. This lack of guidance can lead to crop loss and inefficient farming practices.',
  solution: 
      'Developed AgriSense, a mobile app that detects plant diseases using image recognition, provides detailed information on symptoms, treatments, and preventive measures. The app also guides users through step-by-step soil and water testing procedures and suggests nearby government labs for professional testing.',
  outcome: 'AgriSense empowers users to maintain healthier crops by enabling accurate disease detection, informed treatment decisions, and reliable soil and water testing guidance, improving overall agricultural productivity and sustainability.',
  link: 'https://www.figma.com/proto/lZJ3COiK8TUkBUSGhp9Yjc/Agri-Sense-Pest-Destection-and-Qulaity-Testing-App-?node-id=13-2&p=f&t=9nZCzMkz53MjagZ7-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=5%3A92',
),

  ];

  static const experience = <ExperienceItem>[
    ExperienceItem(
      company: 'Inara Technologies',
      role: 'Flutter Developer & UI/UX Designer',
      period: 'May 2024 — Present',
      highlights: <String>[
        'Led the end-to-end design and development of multiple Flutter applications from concept to deployment,integrating RESTful APIs for dynamic data handling.',
        'Implemented Bloc, Provider and GetX for state management and established a clean architecture pattern,improving code maintainability and reducing post-launch issues.',
        'Collaborated closely with backend engineers and product managers in an agile environment, contributing to the successful early launch of key projects.',
        'Designed intuitive and responsive user interfaces for web and mobile applications, ensuring seamless user experiences aligned with client goals.',
        'Conducted user research, & usability testing to inform design decisions and improve user engagement.',
        'Created wireframes, prototypes, and design systems using Figma and Adobe XD for consistent and scalable design workflows.',
        'Delivered pixel-perfect UI assets and maintained cross-platform design consistency across Android, iOS, and web platforms.',
      ],
    ),
    ExperienceItem(
      company: 'Radiant Spark',
      role: 'UI/UX Designer (Part Time)',
      period: 'Feb 2024 – May 2024',
      highlights: <String>[
        'Designed user-centered interfaces for web and mobile applications, focusing on improving usability and visual appeal.',
        'Developed interactive prototypes and wireframes using Figma to communicate design concepts effectively.',
        'Collaborated with cross-functional teams to align design strategies with business objectives and user needs.',
        'Conducted user feedback sessions & implemented UI refinements to enhance overall user experience.',
        'Ensured design consistency across platforms through reusable components and style guides.',
      ],
    ),
  ];
}
