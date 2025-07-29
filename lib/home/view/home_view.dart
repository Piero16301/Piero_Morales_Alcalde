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
          return const HomeDesktopPage();
        } else {
          return const HomeMobilePage();
        }
      },
    );
  }
}

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeDesktopAppBar(),
      ),
      drawer: const HomeDrawer(),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return switch (index) {
            0 => const HomeCarouselSection(isMobile: false),
            1 => const HomeSkillsSection(isMobile: false),
            2 => const HomeEducationSection(isMobile: false),
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

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeMobileAppBar(),
      ),
      drawer: const HomeDrawer(),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return switch (index) {
            0 => const HomeCarouselSection(isMobile: true),
            1 => const HomeSkillsSection(isMobile: true),
            2 => const HomeEducationSection(isMobile: true),
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
