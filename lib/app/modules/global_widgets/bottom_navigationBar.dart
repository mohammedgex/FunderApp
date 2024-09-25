import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class bottom_NavigationBar extends StatelessWidget {
  const bottom_NavigationBar({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 70,
      onDestinationSelected: (index) {
        controller.changeIndex(index);
      },
      indicatorColor: Colors.white,
      selectedIndex: controller.currentPage.value,
      overlayColor: const WidgetStatePropertyAll(Colors.white),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      elevation: 0,
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/home_Icon.svg",
            color: const Color.fromRGBO(115, 115, 115, 1),
          ),
          label: "",
          selectedIcon: SvgPicture.asset(
            "assets/icons/home_Icon 2.svg",
            color: const Color.fromRGBO(236, 138, 35, 1),
          ),
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/wallet_Icon.svg",
            color: const Color.fromRGBO(115, 115, 115, 1),
          ),
          label: "",
          selectedIcon: SvgPicture.asset(
            "assets/icons/wallet_Icon 2.svg",
            color: const Color.fromRGBO(236, 138, 35, 1),
          ),
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/favorite_Icon.svg",
            color: const Color.fromRGBO(115, 115, 115, 1),
          ),
          label: "",
          selectedIcon: SvgPicture.asset(
            "assets/icons/favorite_Icon 2.svg",
            color: const Color.fromRGBO(236, 138, 35, 1),
          ),
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/profile_Icon.svg",
            color: const Color.fromRGBO(115, 115, 115, 1),
          ),
          label: "",
          selectedIcon: SvgPicture.asset(
            "assets/icons/profile_Icon 2.svg",
            color: const Color.fromRGBO(236, 138, 35, 1),
          ),
        )
      ],
    );
  }
}
