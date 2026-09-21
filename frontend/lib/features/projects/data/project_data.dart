import '../domain/entities/project.dart';

abstract final class ProjectData {
  static const projects = [
    Project(
      id: 'educational-management-system',
      title: 'Educational Management System',
      subtitle: 'School Administration, Teacher, and Parent applications',
      role: 'Project Manager & Flutter Developer',
      description:
          'A complete school management ecosystem including School Administration, Teacher, and Parent applications.',
      contributions: [
        'Led project planning and team coordination',
        'Gathered client requirements',
        'Managed feature delivery',
        'Developed key modules of the School Administration application',
        'Collaborated with Flutter, Django, Web, and UI/UX teams',
      ],
      technologies: ['Flutter', 'Django', 'REST APIs'],
      images: [
        'School admin dashboard',
        'Teacher workflow',
        'Parent mobile app',
      ],
      type: ProjectType.platform,
    ),
    Project(
      id: 'enterprise-management-system',
      title: 'Enterprise Management System',
      subtitle: 'Enterprise operations across web and mobile',
      role: 'Project Manager',
      description:
          'Enterprise management platform designed for web and mobile environments.',
      contributions: [
        'Managed project execution',
        'Coordinated cross-functional teams',
        'Contributed to Flutter development',
        'Supported Django and Next.js implementation',
        'Participated in LiveKit integration',
        'Coordinated production deployments',
      ],
      technologies: ['Flutter', 'Next.js', 'Django', 'LiveKit'],
      images: [
        'Operations dashboard',
        'Mobile task flow',
        'Live communication module',
      ],
      type: ProjectType.web,
    ),
    Project(
      id: 'restaurant-ordering-platform',
      title: 'Restaurant Ordering Platform',
      subtitle: 'Ordering experience for Android, iOS, and Web',
      role: 'Flutter Developer',
      description:
          'Cross-platform restaurant ordering solution for Android, iOS, and Web.',
      contributions: [
        'Developed Flutter mobile applications',
        'Integrated REST APIs',
        'Implemented authentication flows',
        'Supported production releases',
        'Published applications to Google Play and Apple App Store',
      ],
      technologies: ['Flutter', 'Dart', 'REST APIs', 'Android', 'iOS'],
      images: ['Menu browsing', 'Checkout flow', 'Order tracking'],
      type: ProjectType.mobile,
    ),
  ];

  static Project? findById(String id) {
    for (final project in projects) {
      if (project.id == id) {
        return project;
      }
    }
    return null;
  }

  static Project nextProject(String id) {
    final index = projects.indexWhere((project) => project.id == id);
    if (index == -1 || index == projects.length - 1) {
      return projects.first;
    }
    return projects[index + 1];
  }
}
