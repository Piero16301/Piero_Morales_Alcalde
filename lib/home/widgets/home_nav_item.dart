import 'package:flutter/material.dart';

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
                    horizontal: 10,
                    vertical: 10,
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
