import '../domain/entities/experience.dart';

abstract final class ExperienceData {
  static const items = [
    Experience(
      title: 'Project Manager',
      company: 'DESITECH',
      period: '2024 - 2026',
      badge: 'Internal Promotion',
      responsibilities: [
        'Led software projects from requirements gathering to production',
        'Managed cross-functional teams',
        'Sprint planning',
        'Client communication',
        'Coordinated deployments and releases',
        'Continued contributing to Flutter development',
      ],
    ),
    Experience(
      title: 'Flutter Developer',
      company: 'DESITECH',
      period: '2024 - 2026',
      badge: 'Cross-platform Delivery',
      responsibilities: [
        'Developed cross-platform Flutter applications',
        'Integrated REST APIs',
        'Built reusable application modules',
        'Collaborated with cross-functional teams',
        'Published and maintained Android and iOS applications',
      ],
    ),
  ];
}
