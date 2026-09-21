enum ProjectType { mobile, web, platform }

class Project {
  const Project({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.role,
    required this.description,
    required this.contributions,
    required this.technologies,
    required this.images,
    required this.type,
    this.caseStudy,
    this.status,
  });

  final String id;
  final String title;
  final String subtitle;
  final String role;
  final String description;
  final List<String> contributions;
  final List<String> technologies;
  final List<ProjectImage> images;
  final ProjectType type;
  final ProjectCaseStudy? caseStudy;
  final ProjectContentGroup? status;

  String get route => '/projects/$id';
}

class ProjectContentGroup {
  const ProjectContentGroup({
    required this.title,
    required this.description,
    this.label,
  });

  final String title;
  final String description;
  final String? label;
}

class ProjectImage {
  const ProjectImage({required this.caption, this.assetPath});
  final String caption;
  final String? assetPath;
}

class ProjectApplication {
  const ProjectApplication({
    required this.name,
    required this.platform,
    required this.description,
    this.modules = const [],
    this.contribution,
    this.image,
  });

  final String name;
  final String platform;
  final String description;
  final List<ProjectContentGroup> modules;
  final String? contribution;
  final ProjectImage? image;
}

class ProjectCaseStudy {
  const ProjectCaseStudy({
    required this.summary,
    required this.platforms,
    required this.indicators,
    required this.featuredTechnologies,
    required this.roles,
    required this.applications,
    this.management = const [],
    this.journey = const [],
    this.challenge,
    this.approach,
    required this.technicalContribution,
    required this.technicalTitle,
    this.challengeTitle = 'The Challenge',
    this.approachTitle = 'Our Approach',
    this.evolution = const [],
    this.capabilities = const [],
    this.technicalNote,
    this.ownership = const [],
    this.customerFlow = const [],
    this.team = const [],
    this.implementationTechnologies = const [],
    this.platformCaption = 'One platform. Multiple surfaces.',
  });

  final String summary;
  final List<String> platforms;
  final List<String> indicators;
  final List<String> featuredTechnologies;
  final List<ProjectContentGroup> roles;
  final List<ProjectApplication> applications;
  final List<ProjectContentGroup> management;
  final List<String> journey;
  final String? challenge;
  final String? approach;
  final String technicalContribution;
  final String technicalTitle;
  final String challengeTitle;
  final String approachTitle;
  final List<ProjectContentGroup> evolution;
  final List<ProjectContentGroup> capabilities;
  final ProjectContentGroup? technicalNote;
  final List<ProjectContentGroup> ownership;
  final List<String> customerFlow;
  final List<ProjectContentGroup> team;
  final List<String> implementationTechnologies;
  final String platformCaption;
}
