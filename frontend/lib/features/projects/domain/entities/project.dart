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
  });

  final String id;
  final String title;
  final String subtitle;
  final String role;
  final String description;
  final List<String> contributions;
  final List<String> technologies;
  final List<String> images;
  final ProjectType type;
  final ProjectCaseStudy? caseStudy;

  String get route => '/projects/$id';
}

class ProjectContentGroup {
  const ProjectContentGroup({required this.title, required this.description});

  final String title;
  final String description;
}

class ProjectApplication {
  const ProjectApplication({
    required this.name,
    required this.platform,
    required this.description,
    required this.modules,
    this.contribution,
  });

  final String name;
  final String platform;
  final String description;
  final List<ProjectContentGroup> modules;
  final String? contribution;
}

class ProjectCaseStudy {
  const ProjectCaseStudy({
    required this.summary,
    required this.platforms,
    required this.indicators,
    required this.featuredTechnologies,
    required this.roleSummary,
    required this.applications,
    required this.management,
    required this.journey,
    required this.challenge,
    required this.approach,
    required this.technicalContribution,
  });

  final String summary;
  final List<String> platforms;
  final List<String> indicators;
  final List<String> featuredTechnologies;
  final String roleSummary;
  final List<ProjectApplication> applications;
  final List<ProjectContentGroup> management;
  final List<String> journey;
  final String challenge;
  final String approach;
  final String technicalContribution;
}
