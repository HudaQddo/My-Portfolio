import 'package:flutter/material.dart';

import '../domain/entities/social_link.dart';

abstract final class ContactData {
  static const email = 'hudaqddo@gmail.com';
  static const linkedIn = 'https://linkedin.com/in/huda-qddo';
  static const github = 'https://github.com/HudaQddo';
  static const location = 'Damascus, Syria';

  static const socialLinks = [
    SocialLink(
      label: 'LinkedIn',
      url: linkedIn,
      icon: Icons.business_center_rounded,
    ),
    SocialLink(label: 'GitHub', url: github, icon: Icons.code_rounded),
    SocialLink(
      label: 'Email',
      url: 'mailto:$email',
      icon: Icons.mail_outline_rounded,
    ),
  ];
}
