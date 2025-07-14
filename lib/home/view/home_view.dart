import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > AppProperties.responsiveBreakpoint) {
          return const PortfolioHomePage();
        } else {
          return const MobilePortfolioPage();
        }
      },
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            Container(
              height: 1,
              color: Colors.grey.shade200,
            ),
            const HeroSection(),
            const SkillsSection(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppProperties.appBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Image.asset(
                'assets/images/app_logo.png',
                width: AppProperties.homeIconSize,
                height: AppProperties.homeIconSize,
              ),
              const SizedBox(width: 12),
              const Text(
                'Tech Portfolio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // Navigation Items
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const NavItem(text: 'About'),
                  const NavItem(text: 'Education'),
                  const NavItem(text: 'Experience'),
                  const NavItem(text: 'Projects'),
                  Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('Navegando a: Login');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget modular para items de navegación
class NavItem extends StatefulWidget {
  const NavItem({required this.text, super.key});

  final String text;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with TickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _bounceAnimation =
        Tween<double>(
          begin: 1,
          end: 1.1,
        ).animate(
          CurvedAnimation(
            parent: _bounceController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  void _handleTap() {
    _bounceController
      ..reset()
      ..repeat(
        reverse: true,
        period: const Duration(milliseconds: 150),
      );
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _bounceController.reset();
      }
    });
    // Navegación aquí
    debugPrint('Navegando a: ${widget.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedBuilder(
          animation: _bounceAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _bounceAnimation.value,
              child: InkWell(
                onTap: _handleTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 14,
                      color: _isHovered
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Widget modular para la sección hero
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(AppProperties.globalPadding),
        constraints: const BoxConstraints(
          minHeight: 500,
          maxWidth: AppProperties.maxWidth,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDWfs50_zrIc8'
              'jQGRCjWFmJLyizd0PQEjNAwv-TQXvuF9JJJhCV0df-W3Ig1JNq40OpmDbkxtJtkn'
              'QC-ERV9SDTvDS_jCGtf6dg9AdKmu5JT7tAyTj8Ltpk8VA-QUhYgeSyodxDuSWEkX'
              'O9AOnP4QgSR3whs60T-a16bR4OlnDqYRwxCTtpu-D6KhHAr5EiZ-ks2IKAlXo4eB'
              'Ba6zikthnY09wqLhU3cobOVtmlHxcJcvzRnBSXfrXASIJuk7gFKV2AkOw8fVbY0I'
              'Vu',
            ),
            fit: BoxFit.cover,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(143, 163, 163, 0.8),
                Color.fromRGBO(107, 125, 125, 0.8),
              ],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hi, I'm Piero, a Software Engineer",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "I'm a software engineer with a passion for building "
                      'innovative solutions. I specialize in full-stack '
                      'development, cloud computing, and machine learning. '
                      'Explore my portfolio to see my work and learn more '
                      'about my skills and experience.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withValues(alpha: 0.9),
                        height: 1.6,
                        shadows: const [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint('Ver proyectos');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'View Projects',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Widget modular para la sección de habilidades
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const skills = <String>[
      'Full-Stack Development',
      'Cloud Computing',
      'Machine Learning',
      'Data Analysis',
      'Python',
      'Java',
      'JavaScript',
      'React',
      'AWS',
      'Azure',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key Skills',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: skills
                    .map((skill) => SkillChip(skill: skill))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Widget modular para chips de habilidades
class SkillChip extends StatelessWidget {
  const SkillChip({required this.skill, super.key});

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}

// Widget modular responsivo (versión mobile)
class MobilePortfolioPage extends StatelessWidget {
  const MobilePortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              width: AppProperties.homeIconSize,
              height: AppProperties.homeIconSize,
            ),
            const SizedBox(width: 8),
            const Text('Tech Portfolio'),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Education'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Experience'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Projects'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Certifications'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 1,
              color: Colors.grey.shade200,
            ),
            const MobileHeroSection(),
            const SkillsSection(),
          ],
        ),
      ),
    );
  }
}

// Widget modular para hero section en mobile
class MobileHeroSection extends StatelessWidget {
  const MobileHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppProperties.globalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDWfs50_zrIc8jQ'
            'GRCjWFmJLyizd0PQEjNAwv-TQXvuF9JJJhCV0df-W3Ig1JNq40OpmDbkxtJtknQC-E'
            'RV9SDTvDS_jCGtf6dg9AdKmu5JT7tAyTj8Ltpk8VA-QUhYgeSyodxDuSWEkXO9AOnP'
            '4QgSR3whs60T-a16bR4OlnDqYRwxCTtpu-D6KhHAr5EiZ-ks2IKAlXo4eBBa6zikth'
            'nY09wqLhU3cobOVtmlHxcJcvzRnBSXfrXASIJuk7gFKV2AkOw8fVbY0IVu',
          ),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(143, 163, 163, 0.8),
              Color.fromRGBO(107, 125, 125, 0.8),
            ],
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hi, I'm Piero, a Software Engineer",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "I'm a software engineer with a passion for building innovative "
              'solutions. I specialize in full-stack development, cloud '
              'computing, and machine learning.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withValues(alpha: 0.9),
                height: 1.6,
                shadows: const [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
              ),
              child: const Text('View Projects'),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget principal con detección de responsive
class ResponsivePortfolio extends StatelessWidget {
  const ResponsivePortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return const PortfolioHomePage();
        } else {
          return const MobilePortfolioPage();
        }
      },
    );
  }
}
