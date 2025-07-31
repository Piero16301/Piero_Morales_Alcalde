import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';
import 'package:piero_morales_alcalde/home/sections/sections.dart';
import 'package:piero_morales_alcalde/home/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > AppProperties.responsiveBreakpoint) {
          return const HomeSwitcherPage(isMobile: false);
        } else {
          return const HomeSwitcherPage(isMobile: true);
        }
      },
    );
  }
}

class HomeSwitcherPage extends StatelessWidget {
  const HomeSwitcherPage({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isMobile ? const HomeMobileAppBar() : const HomeDesktopAppBar(),
      ),
      drawer: const HomeDrawer(),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return switch (index) {
            0 => HomeCarouselSection(isMobile: isMobile),
            1 => HomeSkillsSection(isMobile: isMobile),
            2 => HomeEducationSection(isMobile: isMobile),
            3 => HomeExperienceSection(isMobile: isMobile),
            4 => HomeProjectsSection(isMobile: isMobile),
            _ => const SizedBox.shrink(),
          };
        },
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Divider(),
        ),
      ),
    );
  }
}
