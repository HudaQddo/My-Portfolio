import '../domain/entities/skill_category.dart';

abstract final class SkillsData {
  static const categories = [
    SkillCategory(
      title: 'Mobile Development',
      skills: [
        'Flutter',
        'Dart',
        'Android',
        'iOS',
        'REST APIs',
        'Clean Architecture',
      ],
      emphasizedSkill: 'Flutter',
    ),
    SkillCategory(
      title: 'State Management',
      skills: ['Cubit / BLoC', 'Provider'],
    ),
    SkillCategory(
      title: 'Backend & Web',
      skills: [
        'Django - Working Knowledge',
        'Next.js - Working Knowledge',
        'LiveKit Integration',
      ],
    ),
    SkillCategory(
      title: 'Tools & Deployment',
      skills: [
        'Git',
        'GitHub',
        'Linux',
        'Nginx',
        'PM2',
        'Google Play Console',
        'App Store Connect',
      ],
    ),
    SkillCategory(
      title: 'Project Management',
      skills: [
        'Agile Methodologies',
        'Sprint Planning',
        'Requirements Gathering',
        'Client Communication',
        'Team Coordination',
      ],
    ),
  ];
}
