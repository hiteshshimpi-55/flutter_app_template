import 'package:flutter/material.dart';

import '../utils/color_theme.dart';

class PackageBottomBarItem {
  final IconData iconData;
  final String? title;

  const PackageBottomBarItem({required this.iconData, this.title});
}

class PackageBottomNavBar extends StatefulWidget {
  final List<PackageBottomBarItem> children;
  final Function(int) onTap;
  final int currentIndex;
  const PackageBottomNavBar(
      {super.key,
      required this.children,
      required this.onTap,
      required this.currentIndex});

  @override
  State<PackageBottomNavBar> createState() => _PackageBottomNavBarState();
}

class _PackageBottomNavBarState extends State<PackageBottomNavBar> {
  Widget buildItem(int currentIndex, IconData iconData) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: IconButton(
        onPressed: () {
          widget.onTap(currentIndex);
        },
        icon: Icon(iconData),
        iconSize: 32,
        color: widget.currentIndex == currentIndex
            ? ColorTheme.primary
            : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < widget.children.length; i++)
            buildItem(i, widget.children[i].iconData),
        ],
      ),
    );
  }
}
