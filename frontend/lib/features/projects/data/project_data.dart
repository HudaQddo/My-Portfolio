import '../domain/entities/project.dart';
import '../../../core/constants/app_assets.dart';

abstract final class ProjectData {
  static const _dwamieyWeb = ProjectImage(
    caption: 'Web dashboard',
    assetPath: AppAssets.dwamieyWebScreenshot,
  );
  static const _dwamieyMobile = ProjectImage(
    caption: 'Mobile application',
    assetPath: AppAssets.dwamieyMobileScreenshot,
  );
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
        roles: [
          ProjectContentGroup(
            label: 'PROJECT MANAGEMENT',
            title: 'From idea to development',
            description:
                'I managed Midadd from the initial idea and project study through planning and development: organizing requirements and scope, breaking features into tasks, coordinating the team, following up on implementation, and contributing to the visual identity.',
          ),
          ProjectContentGroup(
            label: 'FLUTTER DEVELOPMENT',
            title: 'The complete desktop application',
            description:
                'Alongside project management, I independently developed the complete Administration Desktop application in Flutter.',
          ),
        ],
        challengeTitle: 'Scope, time & dependencies',
        approachTitle: 'Clear features. Parallel work.',
        technicalTitle: 'Administration Application',
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
      title: 'Dwamiey',
      subtitle: 'Enterprise Management Platform',
      role: 'Project Manager & Technical Contributor',
      description:
          'Dwamiey is an enterprise management platform for web and mobile, designed to centralize employee operations, projects, communication, and day-to-day company workflows.',
      contributions: [
        'Took over and studied an existing web product',
        'Managed testing, stabilization, and feature expansion',
        'Coordinated the team’s mobile application development and release',
        'Resolved issues in Django and Next.js with reviewed AI-assisted changes',
      ],
      technologies: ['Flutter', 'Next.js', 'Django', 'LiveKit'],
      images: [
        _dwamieyWeb,
        _dwamieyMobile,
        ProjectImage(
          caption: 'Internal communication',
          assetPath: AppAssets.dwamieyCommunicationScreenshot,
        ),
      ],
      type: ProjectType.web,
      caseStudy: ProjectCaseStudy(
        summary:
            'Managed the evolution of an existing web platform through stabilization, feature expansion, and the team’s development and release of a new mobile application.',
        platforms: ['Web', 'Mobile'],
        indicators: ['Web + Mobile', 'Product Expansion', 'Team Delivery'],
        featuredTechnologies: ['Next.js', 'Django', 'Flutter', 'LiveKit'],
        roles: [
          ProjectContentGroup(
            label: 'PROJECT MANAGEMENT',
            title: 'Taking over & moving forward',
            description:
                'I took over an existing web platform with a limited set of features. I managed the team through testing, stabilization, bug fixing, and feature expansion, then coordinated the team’s development and release of the mobile application.',
          ),
          ProjectContentGroup(
            label: 'TECHNICAL CONTRIBUTION',
            title: 'Understanding the existing system',
            description:
                'Alongside management, I investigated and resolved issues in the Django and Next.js codebase. I used AI assistance where needed and reviewed how proposed changes interacted with the system.',
          ),
        ],
        evolution: [
          ProjectContentGroup(
            title: 'Existing Web Platform',
            description:
                'Took responsibility for a product with implemented features.',
          ),
          ProjectContentGroup(
            title: 'Testing & Stabilization',
            description:
                'Worked with the team to understand behavior and identify issues.',
          ),
          ProjectContentGroup(
            title: 'Bug Fixing',
            description:
                'Addressed existing functionality before further expansion.',
          ),
          ProjectContentGroup(
            title: 'Feature Expansion',
            description:
                'Managed new functionality and improvements to existing features.',
          ),
          ProjectContentGroup(
            title: 'Mobile App Development',
            description:
                'Coordinated the team building the mobile application.',
          ),
          ProjectContentGroup(
            title: 'Web + Mobile Platform',
            description: 'Released the expanded product across both surfaces.',
          ),
        ],
        applications: [
          ProjectApplication(
            name: 'Web Application',
            platform: 'Web',
            description:
                'The existing platform, stabilized and expanded with the team.',
            image: _dwamieyWeb,
          ),
          ProjectApplication(
            name: 'Mobile Application',
            platform: 'Mobile',
            description:
                'Coordinated the team’s development of the mobile application and its integration into the existing platform.',
            image: _dwamieyMobile,
          ),
        ],
        capabilities: [
          ProjectContentGroup(
            title: 'Workforce',
            description:
                'Attendance • Leave • Employees • Branches • Departments',
          ),
          ProjectContentGroup(
            title: 'Work Management',
            description: 'Projects • Weekly reports • Workspaces',
          ),
          ProjectContentGroup(
            title: 'Communication',
            description:
                'Encrypted internal chat • Encrypted meeting rooms with group video calls',
          ),
          ProjectContentGroup(title: 'Organization', description: 'Archive'),
        ],
        management: [
          ProjectContentGroup(
            title: 'Product Takeover',
            description:
                'Worked with the team to understand the existing product, its functionality, and its issues.',
          ),
          ProjectContentGroup(
            title: 'Stabilization',
            description:
                'Coordinated testing, issue identification, and bug fixing before further expansion.',
          ),
          ProjectContentGroup(
            title: 'Feature Expansion',
            description:
                'Managed continued development as new features and functionality were introduced.',
          ),
          ProjectContentGroup(
            title: 'Cross-Platform Expansion',
            description:
                'Coordinated the team’s mobile development, integration, and release alongside the web platform.',
          ),
        ],
        challengeTitle: 'An existing product, an unfamiliar stack',
        challenge:
            'Taking over and expanding an existing codebase outside my primary specialization while continuing to manage the project’s development.',
        approachTitle: 'Understand, stabilize, then expand',
        approach:
            'I first studied the product, architecture, and application behavior. We tested and stabilized existing functionality before expanding it. For deeper framework-specific changes, I used AI assistance while reviewing the implementation and its effect on the system.',
        technicalTitle: 'Working Beyond My Primary Stack',
        technicalContribution:
            'Flutter is my primary expertise. I had working knowledge, rather than deep professional experience, in Django and Next.js. Understanding the architecture, code structure, and behavior helped me investigate and resolve several issues across the backend and web application.',
        technicalNote: ProjectContentGroup(
          title: 'AI-Assisted Development',
          description:
              'I used Codex / AI assistance to bridge framework-specific knowledge gaps. Proposed changes were reviewed and understood before integration, including how they interacted with the existing system.',
        ),
      ),
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
      images: [
        ProjectImage(caption: 'Menu browsing'),
        ProjectImage(caption: 'Checkout flow'),
        ProjectImage(caption: 'Order tracking'),
      ],
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
