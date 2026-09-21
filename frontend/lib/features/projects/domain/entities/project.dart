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

  String get route => '/projects/$id';
}
