import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';
import 'package:piero_morales_alcalde/home/widgets/widgets.dart';

class HomeDesktopAppBar extends StatelessWidget {
  const HomeDesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              width: AppProperties.homeIconSize,
              height: AppProperties.homeIconSize,
            ),
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
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const HomeNavItem(text: 'About'),
                const HomeNavItem(text: 'Skills'),
                const HomeNavItem(text: 'Education'),
                const HomeNavItem(text: 'Experience'),
                const HomeNavItem(text: 'Projects'),
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
    );
  }
}

class HomeMobileAppBar extends StatelessWidget {
  const HomeMobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/app_logo.png',
          width: AppProperties.homeIconSize,
          height: AppProperties.homeIconSize,
        ),
        const SizedBox(width: 8),
        const Text('Tech Portfolio'),
      ],
    );
  }
}
