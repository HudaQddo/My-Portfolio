class SkillCategory {
  const SkillCategory({
    required this.title,
    required this.skills,
    this.emphasizedSkill,
  });

  final String title;
  final List<String> skills;
  final String? emphasizedSkill;
}
