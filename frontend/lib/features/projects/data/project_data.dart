import '../domain/entities/project.dart';

abstract final class ProjectData {
  static const projects = [
    Project(
      id: 'educational-management-system',
      title: 'Midadd',
      subtitle: 'School Management Ecosystem',
      role: 'Project Manager & Flutter Developer',
      description:
          'Midadd is a school management ecosystem consisting of three connected applications for school administration, teachers, and parents/students. The platform brings academic and administrative operations into one connected system.',
      contributions: [
        'Organized requirements, scope, features, and actionable tasks',
        'Coordinated the team and followed up on parallel development',
        'Contributed to the visual identity and product consistency',
        'Independently developed the complete Administration Desktop application',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Cubit',
        'Clean Architecture',
        'Feature-Based Architecture',
      ],
      images: [],
      type: ProjectType.platform,
      caseStudy: ProjectCaseStudy(
        summary:
            'Managed the project from the initial idea and project study through planning and team execution, while independently developing the complete Administration Desktop application in Flutter.',
        platforms: ['Desktop', 'Android', 'iOS'],
        indicators: ['3 Applications', '3 User Groups', 'Desktop + Mobile'],
        featuredTechnologies: ['Flutter', 'Cubit', 'Clean Architecture'],
        roleSummary:
            'I managed Midadd from the initial idea and project study through planning and development: organizing requirements and scope, breaking features into tasks, coordinating the team, following up on implementation, and contributing to the visual identity.',
        applications: [
          ProjectApplication(
            name: 'Administration',
            platform: 'Desktop',
            description:
                'Academic and administrative operations in one workspace.',
            contribution: 'Developed entirely by me using Flutter',
            modules: [
              ProjectContentGroup(
                title: 'People & attendance',
                description:
                    'Human resources, employee attendance, students, student attendance, and parents.',
              ),
              ProjectContentGroup(
                title: 'Academic planning',
                description:
                    'Curriculum, weekly academic schedules, exams, and exam schedules.',
              ),
              ProjectContentGroup(
                title: 'School operations',
                description:
                    'Transportation, buses and drivers, events, roles and permissions, and archive.',
              ),
            ],
          ),
          ProjectApplication(
            name: 'Parents & Students',
            platform: 'Android / iOS',
            description:
                'One parent account, multiple children, and a centralized view of school activity.',
            modules: [
              ProjectContentGroup(
                title: 'Learning & progress',
                description:
                    'Weekly and exam schedules, grades, homework, curriculum, and daily lessons.',
              ),
              ProjectContentGroup(
                title: 'School updates',
                description: 'School and teacher notes, plus upcoming events.',
              ),
              ProjectContentGroup(
                title: 'Attendance & alerts',
                description:
                    'Attendance history, arrival and departure information, and absence and lateness notifications.',
              ),
            ],
          ),
          ProjectApplication(
            name: 'Teachers',
            platform: 'Android / iOS',
            description: 'A focused view of daily academic responsibilities.',
            modules: [
              ProjectContentGroup(
                title: 'Daily teaching',
                description:
                    'Assigned classes, weekly schedule, and class students.',
              ),
              ProjectContentGroup(
                title: 'Assessment & follow-up',
                description: 'Homework, exams, grades, and student notes.',
              ),
            ],
          ),
        ],
        management: [
          ProjectContentGroup(
            title: 'Planning & Scope',
            description:
                'Turned project requirements into structured features and actionable tasks.',
          ),
          ProjectContentGroup(
            title: 'Team Coordination',
            description:
                'Organized and followed up on work across different parts of the project.',
          ),
          ProjectContentGroup(
            title: 'Development Workflow',
            description:
                'Coordinated parallel development so different workstreams could progress together.',
          ),
          ProjectContentGroup(
            title: 'Product Consistency',
            description:
                'Contributed to the visual identity and helped maintain consistency across the product.',
          ),
        ],
        journey: [
          'Idea',
          'Project Study',
          'Scope',
          'Feature Breakdown',
          'Task Planning',
          'Team Coordination',
          'Development',
        ],
        challenge:
            'Three applications, multiple user roles, and a limited development timeline created dependencies across the system, particularly while the backend was still being developed.',
        approach:
            'We divided the project into clear features and responsibilities and organized the team to work in parallel. We used mock data so frontend development could continue while backend implementation was in progress.',
        technicalContribution:
            'I independently developed the complete Administration Desktop application using Flutter, with a feature-based structure, Clean Architecture, and Cubit for state management.',
      ),
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
