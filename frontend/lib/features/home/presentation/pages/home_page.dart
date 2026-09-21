import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/scroll_helper.dart';
import '../../../../core/utils/cv_download.dart';
import '../widgets/about/about_section.dart';
import '../widgets/contact/contact_section.dart';
import '../widgets/education/education_section.dart';
import '../widgets/experience/experience_section.dart';
import '../widgets/footer/footer_section.dart';
import '../widgets/hero/hero_section.dart';
import '../widgets/navbar/app_navbar.dart';
import '../widgets/projects/projects_section.dart';
import '../widgets/skills/skills_section.dart';

enum HomeSectionId { home, about, projects, experience, skills, contact }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _sectionKeys = {
    for (final section in HomeSectionId.values) section: GlobalKey(),
  };
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateNavbar);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_updateNavbar)
      ..dispose();
    super.dispose();
  }

  void _updateNavbar() {
    final shouldBeOpaque = _scrollController.offset > 12;
    if (shouldBeOpaque != _isScrolled) {
      setState(() => _isScrolled = shouldBeOpaque);
    }
  }

  void _scrollToSection(HomeSectionId section) {
    _scaffoldKey.currentState?.closeEndDrawer();
    ScrollHelper.scrollTo(_sectionKeys[section]!);
  }

  void _openProject(String route) => context.go(route);

  void _downloadCv() {
    try {
      downloadCv();
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to download CV. Please try again in your browser.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: AppNavDrawer(
        onSectionSelected: _scrollToSection,
        onDownloadCv: _downloadCv,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: AppNavbarDelegate(
              isScrolled: _isScrolled,
              onSectionSelected: _scrollToSection,
              onMenuPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              onDownloadCv: _downloadCv,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                HeroSection(
                  key: _sectionKeys[HomeSectionId.home],
                  onViewProjects: () =>
                      _scrollToSection(HomeSectionId.projects),
                  onContact: () => _scrollToSection(HomeSectionId.contact),
                ),
                AboutSection(key: _sectionKeys[HomeSectionId.about]),
                ProjectsSection(
                  key: _sectionKeys[HomeSectionId.projects],
                  onProjectSelected: _openProject,
                ),
                ExperienceSection(key: _sectionKeys[HomeSectionId.experience]),
                SkillsSection(key: _sectionKeys[HomeSectionId.skills]),
                const EducationSection(),
                ContactSection(key: _sectionKeys[HomeSectionId.contact]),
                const FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
