import '../domain/entities/education.dart';

abstract final class EducationData {
  static const items = [
    Education(
      title: "Bachelor's Degree in Information Technology Engineering",
      institution: 'Damascus University',
      period: '2019 - 2025',
    ),
    Education(
      title: 'Diploma in Business Administration',
      institution: 'Ousos Institute',
      period: '2025',
    ),
  ];
}
