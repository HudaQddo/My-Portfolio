class Experience {
  const Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.badge,
    required this.responsibilities,
  });

  final String title;
  final String company;
  final String period;
  final String badge;
  final List<String> responsibilities;
}
